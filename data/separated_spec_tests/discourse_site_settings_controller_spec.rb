require 'rails_helper'

describe Admin::SiteSettingsController do

  it "is a subclass of AdminController" 


  context 'while logged in as an admin' do
    before do
      @user = log_in(:admin)
    end

    context 'index' do
      it 'returns success' 


      it 'returns JSON' 

    end

    context 'update' do

      before do
        SiteSetting.setting(:test_setting, "default")
        SiteSetting.refresh!
      end

      it 'sets the value when the param is present' 


      it 'allows value to be a blank string' 


      it 'logs the change' 


      it 'does not allow changing of hidden settings' 


      it 'fails when a setting does not exist' 

    end

  end

end

