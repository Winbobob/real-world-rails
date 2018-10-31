require 'spec_helper'

describe Org::InvitationsController do
  let(:organization) { create(:organization)}
  let(:user) { create(:confirmed_user, organization: organization)}

  before(:each) do
    sign_in user
  end

  describe 'create' do
    it 'should successfully create an invitation' 


    it 'should respond with an error status' 

  end
end

