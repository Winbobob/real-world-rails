require 'spec_helper'

RSpec.describe InvitationsController, type: :controller, skip: true do

  it 'should capture referred by when viewing team invitation' 


  describe 'GET invitations#show' do

    let(:current_user)  { Fabricate(:user) }
    let(:team)          { Fabricate(:team) }

    describe 'logged in' do
      before { controller.send :sign_in, current_user }

      it 'should render invitation page successfully with valid referral' 


      it 'should redirect to root_url with invalid referral' 


    end

    describe 'logged out' do
      it 'should render invitation page successfully with valid referral' 


      it 'should redirect to root_url with invalid referral' 

    end

  end

end

