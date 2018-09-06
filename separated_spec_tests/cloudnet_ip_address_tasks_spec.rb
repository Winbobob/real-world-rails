require 'rails_helper'

xdescribe IpAddressTasks do
  
  before(:each) { 
    @server = FactoryGirl.create(:server, user: @current_user)
    @server_ip_address = FactoryGirl.create(:server_ip_address, server: @server)
    @ip_address_task = IpAddressTasks.new
  }
  
  it 'should refresh IP addresses of server', :vcr do
    @ip_address_task.perform(:refresh_ip_addresses, @server.user_id, @server.id)
    new_ip_address = @server.server_ip_addresses.last
    expect(new_ip_address.address).not_to be_empty
    expect(new_ip_address.identifier).not_to be_empty
  end
  
  it 'should assign new IP address to server' 


  it 'should remove IP address from server' 

  
end

