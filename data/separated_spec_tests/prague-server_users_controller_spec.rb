require 'spec_helper'

describe Org::UsersController do
  let(:organization) { create(:organization) }
  let(:user) { create(:confirmed_user, organization: organization)}

  before(:each) do
    allow(controller).to receive(:current_organization).and_return( organization )
    sign_in user
  end

  describe 'index' do
    it 'should successfully load' 

  end

  describe 'destroy' do
    let(:other_user) { create(:confirmed_user, organization: organization) }

    it 'should be possible to destroy another user' 


    it 'should not be possible to delete the currently signed in user' 

  end
end

