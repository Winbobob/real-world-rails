require 'spec_helper'

describe 'OmniAuth authentication' do

  supported_auths = {
      'github' => 'GitHub',
      'gplus'  => 'Google'
  }

  before do
    StaticPage.create!(title: 'getting started', body: 'remote pair programming' )
    @uid = '12345678'
    supported_auths.each do |provider, name|
      OmniAuth.config.mock_auth[provider.to_sym] = {
          'provider'  => provider,
          'uid'       => @uid,
          'info'      => { 'email' => "#{name}@mock.com"}
      }
    end
    OmniAuth.config.logger.level = Logger::FATAL
  end

  after { OmniAuth.config.logger.level = Logger::DEBUG }

  supported_auths.each do |provider, name|
    context 'for unregistered users' do
      context "with a #{name} profile" do
        it 'should work with valid credentials' 


        it 'should not work with invalid credentials' 


        it 'should not allow removal of profiles without passwords' 

      end
    end

    context 'for registered users' do
      before do
        @user = User.create!(email: 'something_else@email.com', password: '123456789')
      end

      context "with a #{name} profile" do
        before do
          @user.authentications.create!(provider: provider, uid: @uid)
        end

        it 'finds the right user if auth exists' 


        it 'should be removable for users with a password' 


        it 'should be able to create other profiles' 


        it 'should not accept multiple profiles from the same source' 

      end
    end
  end
end

