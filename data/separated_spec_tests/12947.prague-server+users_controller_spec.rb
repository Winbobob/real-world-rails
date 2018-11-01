require 'spec_helper'

describe UsersController do
  let(:organization) { create(:organization) }
  let(:user) { create(:confirmed_user, organization: organization) }
  let(:invitation) { create(:invitation, organization: organization, sender: user) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe '#new' do
    it 'should be successful on normal new user requests' 


    context 'invitation' do
      it 'should load the invitation' 


      it 'should redirect if invitation does not exist' 

    end
  end

  describe '#create' do
    it 'should allow creation' 


    it 'should create with invitation' 

  end
end

