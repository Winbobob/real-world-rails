# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AdminUsersSessionsController do

  describe 'POST #create' do
    let(:admin_user) { FactoryGirl.create(:admin_user) }
    let(:target_user) { FactoryGirl.create(:user) }

    before do
      session[:user_id] = admin_user.id
    end

    it 'logs in as another user' 


    it 'sets the user_circumstance session to login_as' 


    it 'redirects to the target user page' 


    context 'with an unconfirmed user' do
      let(:target_user) { FactoryGirl.create(:unconfirmed_user) }

      it 'confirms their account' 


    end

    context 'if the user cannot log in as the user' do
      let(:target_user) { FactoryGirl.create(:pro_user) }

      it 'redirects to the admin user page for that user' 


      it 'shows an error message' 


    end

  end

end

