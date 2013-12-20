class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter do
    CALLBACK_URL = "http://mk1.herokuapp.com"

    Instagram.configure do |config|
      config.client_id = ENV['INSTA_APP']
      config.client_secret = ENV['INSTA_SEC']
    end
  end
end
