require 'rails_helper'

describe Admin::ImpersonateController do

  it "is a subclass of AdminController" 


  context 'while logged in as an admin' do
    let!(:admin) { log_in(:admin) }
    let(:user) { Fabricate(:user) }

    context 'index' do
      it 'returns success' 

    end

    context 'create' do

      it 'requires a username_or_email parameter' 


      it 'returns 404 when that user does not exist' 


      it "raises an invalid access error if the user can't be impersonated" 


      context 'success' do

        it "logs the impersonation" 


        it "changes the current user session id" 


        it "returns success" 


        it "also works with an email address" 


      end

    end

  end

end

