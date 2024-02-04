require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'
require 'active_support/core_ext/string/output_safety'
require "awesome_print"
require 'json'

if Sinatra::Base.environment == :development
  require 'dotenv/load'
  Dotenv.load
end

AwesomePrint.defaults = {
  indent: -2,
  index: false,
  color: {
    hash: :white,
    class: :white,
    string: :white,
    integer: :cyan,
    boolean: :white
  }
}

require_relative 'config/application'
require_relative 'services/paypay'

get '/' do
  @results = {}

  if params.any?
    builder = PayPay::QrCodeCreateBuilder.new
    builder.merchant_payment_id
    builder.add_item(
      params['product'],
      params['category'],
      params['quantity'].to_i,
      rand(1..100).to_s,
      params['price'].to_i
    )
    client = PayPay::Client.new(ENV['API_KEY'], ENV['API_SECRET'], ENV['MERCHANT_ID'])
    message = client.qr_code_create(builder.finish)
    @results = JSON.parse(message.content)
    @page_url = @results['data']['url'] unless @results['data'].nil?
  end

  erb :index
end

# DO NOT CHANGE BELOW LINES
# Some configuration for Sinatra to be hosted and operational on Heroku
after do
  # Close the connection after the request is done so that we don't
  # deplete the ActiveRecord connection pool.
  ActiveRecord::Base.connection.close
end
