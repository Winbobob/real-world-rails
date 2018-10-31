require 'helper'

describe OmniAuth::Strategies::Developer do
  let(:app) do
    Rack::Builder.new do |b|
      b.use Rack::Session::Cookie, :secret => 'abc123'
      b.use OmniAuth::Strategies::Developer
      b.run lambda { |_env| [200, {}, ['Not Found']] }
    end.to_app
  end

  context 'request phase' do
    before(:each) { get '/auth/developer' }

    it 'displays a form' 


    it 'has the callback as the action for the form' 


    it 'has a text field for each of the fields' 

  end

  context 'callback phase' do
    let(:auth_hash) { last_request.env['omniauth.auth'] }

    context 'with default options' do
      before do
        post '/auth/developer/callback', :name => 'Example User', :email => 'user@example.com'
      end

      it 'sets the name in the auth hash' 


      it 'sets the email in the auth hash' 


      it 'sets the uid to the email' 

    end

    context 'with custom options' do
      let(:app) do
        Rack::Builder.new do |b|
          b.use Rack::Session::Cookie, :secret => 'abc123'
          b.use OmniAuth::Strategies::Developer, :fields => %i[first_name last_name], :uid_field => :last_name
          b.run lambda { |_env| [200, {}, ['Not Found']] }
        end.to_app
      end

      before do
        @options = {:uid_field => :last_name, :fields => %i[first_name last_name]}
        post '/auth/developer/callback', :first_name => 'Example', :last_name => 'User'
      end

      it 'sets info fields properly' 


      it 'sets the uid properly' 

    end
  end
end

