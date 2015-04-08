ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'savon'

HTTPI.adapter = :rack
HTTPI::Adapter::Rack.mount 'app', RailsSoapCalculator::Application
RailsSoapCalculator::Application.routes.draw do
  wash_out :calc
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def savon(method, message: {})
    savon = Savon::Client.new(:wsdl => 'http://app/calc/wsdl',
                              :log => false,
                              :convert_request_keys_to => :none)
    response_key = "#{method}_response".to_sym

    savon.call(method, :message => message).to_hash[response_key][:value]
  end
end
