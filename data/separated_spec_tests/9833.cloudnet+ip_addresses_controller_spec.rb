require 'rails_helper'

RSpec.describe IpAddressesController, :type => :controller do
  
  describe 'on a server with multiple IP support' do
    before(:each) { 
      sign_in_onapp_user
      @server = FactoryGirl.create(:server, user: @current_user)
      @server.update(state: :on)
      @server_ip_address = FactoryGirl.create(:server_ip_address, server: @server)
    }
    
    describe '#index' do
      it 'should render the servers IP addresses list' 

      
      context "with JSON format" do
        render_views
        let(:json) { JSON.parse(response.body) }
        
        it 'should get list of IP addresses as JSON' 

      end
    end
      
    describe '#create' do      
      describe 'add new IP' do
        before :each do
          allow(AssignIpAddress).to receive(:perform_async).and_return(true)
          allow_any_instance_of(Server).to receive(:primary_network_interface).and_return(['abc'])
          CreateSiftEvent.jobs.clear
        end
        
        it 'should add a new IP address' 

      end
      
      it 'should not allow more than MAX_IPS limit' 

    end
    
    describe '#destroy' do      
      describe 'remove IP' do
        before :each do
          @ip_address_tasks = double('IpAddressTasks', perform: true)
          allow(IpAddressTasks).to receive(:new).and_return(@ip_address_tasks)
          @server_ip_address.update(primary: false)
          CreateSiftEvent.jobs.clear
        end
        
        it 'should remove IP address' 

      end
      
      it 'should not allow to remove a primary IP address' 

    end
    
  end
  
  describe 'on a server without multiple IP support' do
    before(:each) { 
      sign_in_onapp_user
      @server = FactoryGirl.create(:server, user: @current_user)
      @server.location.update(hv_group_version: '4.0.0')
    }
    
    describe 'going to the index page' do
      it 'should redirect to dashboard' 

    end
  end

end

