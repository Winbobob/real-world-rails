require 'rails_helper'

describe AccountUnfollowController do
  render_views

  let(:user) { Fabricate(:user) }
  let(:alice) { Fabricate(:account, username: 'alice') }

  describe 'POST #create' do
    let(:service) { double }

    subject { post :create, params: { account_username: alice.username } }

    before do
      allow(UnfollowService).to receive(:new).and_return(service)
      allow(service).to receive(:call)
    end

    it 'does not create for user who is not signed in' 


    it 'redirects to account path' 

  end
end

