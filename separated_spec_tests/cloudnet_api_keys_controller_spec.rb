require 'rails_helper'

RSpec.describe ApiKeysController, type: :controller do
  
  before(:each) { 
    sign_in_onapp_user
    @api_key = FactoryGirl.create(:api_key, user: @current_user)
    @request.env['HTTP_REFERER'] = '/users/edit'
  }
  
  describe '#create' do
    it 'should generate a new API key' 

    
    it 'should not generate API key' 

    
    it 'should not allow to create more than 3 api keys per user' 

  end
  
  describe '#toggle_active' do
    it 'should toggle active status of api key' 

  end
  
  describe '#destroy' do
    it 'should delete API key' 

  end

end

