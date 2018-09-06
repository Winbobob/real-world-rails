# frozen_string_literal: true

require 'spec_helper'

describe ReportsController, type: :controller do
  before(:all) do
    @user = FactoryGirl.create(:user)
    @banned = FactoryGirl.create(:banned)
    @checkout_person = FactoryGirl.create(:checkout_person)
    @admin = FactoryGirl.create(:admin)
  end

  context 'as admin user' do
    before(:each) do
      mock_app_config
      sign_in @admin
    end

    describe 'PUT /reports/update' do
      it 'defaults to the past year without a session or params' 


      it 'keeps the session values with no params' 


      it 'changes the dates and session with valid params' 

    end
  end
end

