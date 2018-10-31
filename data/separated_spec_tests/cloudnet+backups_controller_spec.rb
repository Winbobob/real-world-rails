require 'rails_helper'

RSpec.describe BackupsController, :type => :controller do
  
  before(:all) { Rails.cache.clear }
  
  before(:each) {
    sign_in_onapp_user
    CreateSiftEvent.jobs.clear
  }
  
  let(:server) { FactoryGirl.create(:server, state: :on, user: @current_user) }
  
  describe 'on a server with manual backup support' do
    describe '#index' do
      it 'should render the servers backups list' 

      
      context "with JSON format" do
        render_views
        let(:json) { JSON.parse(response.body) }
        
        it 'should get list of backups as JSON' 

      end
    end
      
    describe '#create' do      
      it 'should add a new backup' 

    end
    
    describe '#restore' do      
      it 'should restore a backup' 

    end
    
    describe '#destroy' do      
      it 'should remove backup' 

    end
    
  end
  
  describe 'on a server without manual backup support' do    
    describe 'going to the index page' do
      it 'should redirect to dashboard' 

    end
  end

end

