require 'rails_helper'

describe Admin::ImpersonateController do

  it "is a subclass of AdminController" 


  context 'while logged in as an admin' do
    let(:admin) { Fabricate(:admin) }
    let(:user) { Fabricate(:user) }
    let(:another_admin) { Fabricate(:admin) }

    before do
      sign_in(admin)
    end

    describe '#index' do
      it 'returns success' 

    end

    describe '#create' do
      it 'requires a username_or_email parameter' 


      it 'returns 404 when that user does not exist' 


      it "raises an invalid access error if the user can't be impersonated" 


      context 'success' do
        it "succeeds and logs the impersonation" 


        it "also works with an email address" 

      end
    end
  end
end

