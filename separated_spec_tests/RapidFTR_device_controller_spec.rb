require 'spec_helper'

describe Api::DeviceController, :type => :controller do
  describe '#blacklisted' do
    it 'does not authenticate' 


    it 'is true if device IMEI is blacklisted' 


    it 'is false if device IMEI is not blacklisted' 


    it 'is renders an error if device IMEI does not exist' 

  end

end

