require 'spec_helper_min'
require 'rake'

describe 'oauth.rake' do
  before(:all) do
    Rake.application.rake_require('tasks/oauth')
    Rake::Task.define_task(:environment)

    @sequel_developer = FactoryGirl.create(:valid_user)
    @developer = Carto::User.find(@sequel_developer.id)
    @user = FactoryGirl.create(:valid_user)
    @oauth_app = FactoryGirl.create(:oauth_app, user: @developer)
  end

  before(:each) do
    @oauth_app_user = @oauth_app.oauth_app_users.create!(user_id: @user.id)
  end

  after(:each) do
    @oauth_app_user.reload.destroy!
    Delorean.back_to_the_present
  end

  after(:all) do
    @oauth_app.destroy!
    @user.destroy
    @sequel_developer.destroy
  end

  describe '#destroy_expired_access_tokens' do
    before(:each) do
      Rake::Task['cartodb:oauth:destroy_expired_access_tokens'].reenable
    end

    it 'does not delete just created access tokens' 


    it 'deletes old access tokens' 

  end

  describe '#destroy_expired_refresh_tokens' do
    before(:each) do
      Rake::Task['cartodb:oauth:destroy_expired_refresh_tokens'].reenable
    end

    it 'does not delete just created access tokens' 


    it 'deletes old access tokens' 

  end

  describe '#destroy_expired_authorization_codes' do
    before(:each) do
      Rake::Task['cartodb:oauth:destroy_expired_authorization_codes'].reenable
    end

    it 'does not delete just created access tokens' 


    it 'deletes old access tokens' 

  end
end

