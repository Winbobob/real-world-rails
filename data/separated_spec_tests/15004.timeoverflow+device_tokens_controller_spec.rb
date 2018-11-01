require 'spec_helper'

RSpec.describe DeviceTokensController do
  let (:organization) { Fabricate(:organization) }
  let (:member) { Fabricate(:member, organization: organization) }

  describe 'POST #create' do
    context 'without login' do
      it 'responds with error' 

    end

    context 'with valid params' do
      it 'creates a new device_token' 

    end

    context 'with invalid params' do
      it 'responds with error' 

    end
  end
end

