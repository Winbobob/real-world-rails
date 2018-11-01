# encoding: utf-8

require_relative '../../../spec_helper_min'
require 'support/helpers'
require_relative '../../../../app/controllers/carto/api/users_controller'

describe Carto::Api::UsersController do
  include_context 'organization with users helper'
  include Warden::Test::Helpers
  include HelperMethods

  before(:all) do
    @headers = { 'CONTENT_TYPE' => 'application/json' }
    FactoryGirl.create(:notification, organization: @carto_organization)
  end

  before(:each) do
    ::User.any_instance.stubs(:create_in_central).returns(true)
    ::User.any_instance.stubs(:update_in_central).returns(true)
  end

  describe 'me' do
    it 'contains hubspot_form_ids in config' 


    it 'returns the user info even when locked' 


    it 'returns a hash with current user info' 


    it 'returns a hash with only config if there is no authenticated user' 

  end

  describe 'update_me' do
    context 'account updates' do
      before(:each) do
        @user = FactoryGirl.create(:user, password: 'foobarbaz', password_confirmation: 'foobarbaz')
      end

      after(:each) do
        @user.destroy
      end

      let(:url_options) do
        {
          user_domain: @user.username,
          user_id: @user.id,
          api_key: @user.api_key
        }
      end

      it 'gives an error if password is the same as old_password' 


      it 'gives a status code 200 if payload is empty' 


      it 'gives an error if no password_confirmation' 


      it 'updates account if password_confirmation' 


      it 'gives an error if email is invalid' 


      it 'gives an error if old password is invalid' 


      it 'gives an error if new password and confirmation are not the same' 


      it 'returns 401 if user is not logged in' 


      it 'updates account data for the given user' 

    end

    context 'profile updates' do
      before(:each) do
        @user = FactoryGirl.create(:user, password: 'foobarbaz', password_confirmation: 'foobarbaz')
      end

      after(:each) do
        @user.destroy
      end

      let(:url_options) do
        {
          user_domain: @user.username,
          user_id: @user.id,
          api_key: @user.api_key
        }
      end

      it 'updates profile data for the given user' 


      it 'does not update profile data if password_confirmation is wrong' 


      it 'does not update profile data if password_confirmation is missing' 


      it 'does not update fields not present in the user hash' 


      it 'sets field to nil if key is present in the hash with a nil value' 


      it 'returns 401 if user is not logged in' 

    end
  end

  describe 'delete_me' do
    before(:each) do
      @user = FactoryGirl.create(:user, password: 'foobarbaz', password_confirmation: 'foobarbaz')
      User.any_instance.stubs(:delete_in_central)
    end

    let(:url_options) do
      {
        user_domain: @user.username,
        api_key: @user.api_key
      }
    end

    it 'deletes the authenticated user' 


    it 'deletes the authenticated user even when locked' 


    context 'failures in deletion' do
      after(:each) do
        @user.destroy
      end

      it 'gives an error if deletion password confirmation is invalid' 


      it 'returns 401 if user is not logged in' 

    end
  end
end

