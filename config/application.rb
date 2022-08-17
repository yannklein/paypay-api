configure :development do
  # This is some boilerplate code to read the config/database.yml file
  # And connect to the database
  config_path = File.join(__dir__, "database.yml")
  ActiveRecord::Base.configurations = YAML.load_file(config_path)
  ActiveRecord::Base.establish_connection(:development)
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host    => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

# Set a logger so that you can view the SQL actually performed by ActiveRecord
logger = Logger.new(STDOUT)
logger.formatter = proc do |severity, datetime, progname, msg|
  "#{msg}\n"
end
ActiveRecord::Base.logger = logger

# Load all models!
Dir["#{__dir__}/../models/*.rb"].each {|file| require file }