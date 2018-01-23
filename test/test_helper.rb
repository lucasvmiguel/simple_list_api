ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def api_sign_in
    user = users(:one)
    post '/auth/sign_in', params: { email: user.uid, password: "secret123" }

    return { 
      "uid" => response.headers["uid"],
      "access-token" => response.headers["access-token"],
      "client" => response.headers["client"] }
  end
end
