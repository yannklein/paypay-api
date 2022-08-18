# PayPay API call examples in Ruby 💎

## How to use

- Create an `.env` fine in the root folder
- Create a [PayPay developer account](https://developer.paypay.ne.jp/dashboard/home), in test mode.
- After 15min, you credential would appear on the dashboard, save the `Merchand Id`, the `Key Id` and the `Secret Id` in you `.env` file as follows:
```
API_KEY=YOUR_API_KEY_HERE
API_SECRET=YOUR_API_SECRET_HERE
MERCHANT_ID=YOUR_MERCHANT_ID_HERE
```

Example:
```
API_KEY=a_Jr5R9YqHEthisisdummy
API_SECRET=lgo1nX9BqBV6qiHY/mYa96ws0kGn2Ri1hthisisdummy
MERCHANT_ID=5448489472thisisdummy
```

- Run:
```
 bundle
 ruby app.rb
```

## How to deploy

- Create a heroku app: `heroku create YOUR_HEROKU_APP`
- Push to heroku
```
git add .
git commit -m "commit changes before first push to heroku"
git push heroku main
```
- Add env variables to Heroku (**put your own keys**):
```
heroku config:set API_KEY=YOUR_API_KEY_HERE
heroku config:set API_SECRET=YOUR_API_SECRET_HERE
heroku config:set API_KEY=YOUR_API_KEY_HERE
```
- Run `heroku open`

## Additional resources

- I based myself on [this work](https://qiita.com/aoyagikouhei/items/bc5ef1db0191d79a7da6) from @aoyaikouhei
- [PayPay dev dashboard](https://developer.paypay.ne.jp/dashboard/home)
- [Paypay doc](https://developer.paypay.ne.jp/products/docs/qrcode)
