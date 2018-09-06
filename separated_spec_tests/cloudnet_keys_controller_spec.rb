require 'rails_helper'

RSpec.describe KeysController, :type => :controller do
  
  before(:each) { 
    sign_in_onapp_user 
    @key = FactoryGirl.create(:key, user: @current_user)
    @request.env['HTTP_REFERER'] = '/users/edit'
  }
  
  describe '#index' do
    context "with JSON format" do
      render_views
      let(:json) { JSON.parse(response.body) }
      
      it 'should render SSH keys list as JSON' 

    end
  end
  
  describe '#create' do
    it 'should add a new SSH key' 

    
    it 'should not add SSH key' 

    
    context "with JS format" do      
      it 'should add a new SSH key as JS' 

      
      it 'should add a new SSH key as JS' 

    end
    
    context "with JSON format" do
      render_views
      let(:json) { JSON.parse(response.body) }
      
      it 'should add a new SSH key as JSON and return nothing' 

    end
  end
  
  describe '#destroy' do
    it 'should delete SSH key' 

  end

end

