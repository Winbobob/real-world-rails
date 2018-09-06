require 'spec_helper'

describe DevicesController, :type => :controller do

  describe 'GET index' do
    it 'fetches all the blacklisted devices but not the replication details if user have only black listed permission' 


    it 'should not show black listed devices, if the user have only manage replication permission' 


    it 'should show black listed devices and the replications if the user have both the permissions' 

  end
  describe 'POST update_blacklist' do
    it 'should update the blacklist flag' 


    it 'should return failure if blacklist fails' 


    it 'should not update the device by user without blacklist permission' 

  end

end

