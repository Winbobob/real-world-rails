require 'rails_helper'

RSpec.describe 'OmniAuth sign in', type: :rack_test do
  let(:app) do
    Rack::Builder.new do |b|
      b.use Rack::Session::Cookie, secret: 'abc123'
      b.use OmniAuth::Strategies::Developer, path_prefix: '/api/v1/staff/auth'
      b.run -> (_env) { [200, {}, ['Not Found']] }
    end.to_app
  end

  context 'request phase' do
    before(:each) { get '/api/v1/staff/auth/developer' }

    it 'displays a form' 


    it 'has the callback as the action for the form' 


    it 'has a text field for each of the fields' 

  end

  context 'callback phase' do
    let(:auth_hash) { last_request.env['omniauth.auth'] }

    context 'with custom options' do
      let(:app) do
        Rack::Builder.new do |b|
          b.use Rack::Session::Cookie, secret: 'abc123'
          b.use OmniAuth::Strategies::Developer, path_prefix: '/api/v1/staff/auth', fields: [:email, :password], uid_field: :email
          b.run -> (_env) { [200, {}, ['Not Found']] }
        end.to_app
      end

      before do
        @options = { uid_fields: :email, fields: [:email, :password] }
        post '/api/v1/staff/auth/developer/callback', email: 'user@example.com', password: '1234'
      end

      it 'sets info fields properly' 


      it 'sets the uid properly' 

    end
  end

  context 'mock auth' do
    before do
      OmniAuth.config.add_mock(:developer, uid: '12345', info: { name: 'Example User', email: 'user@example.com' })
    end

    it 'default is AuthHash' 


    it 'developer is AuthHash' 


    it 'sets developer attributes' 

  end
end

