require "instagram"
before_filter do
  CALLBACK_URL = "http://mk1.herokuapp.com"

  Instagram.configure do |config|
    config.client_id = ENV['INSTA_APP']
    config.client_secret = ENV['INSTA_SEC']
  end
end