require 'spec_helper'

describe Rack::Test::Session do
  context 'HTTP Digest authentication' do
    def app
      app = Rack::Auth::Digest::MD5.new(Rack::Test::FakeApp.new) do |username|
        { 'alice' => 'correct-password' }[username]
      end
      app.realm = 'WallysWorld'
      app.opaque = 'this-should-be-secret'
      app
    end

    it 'incorrectly authenticates GETs' 


    it 'correctly authenticates GETs' 


    it 'correctly authenticates GETs with params' 


    it 'correctly authenticates POSTs' 


    it 'returns a re-challenge if authenticating incorrectly' 

  end
end

