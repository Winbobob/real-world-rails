require 'spec_helper'

describe VotesController do
  login_user

  before :each do
    request.env["HTTP_REFERER"] = '/'
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  let(:hub) { create(:hub) }
  # let!(:user1) { user }
  let(:current_user) { user } # Logged in user
  let!(:user2) { create(:user) }
  let!(:proposal1) { create(:proposal, user: user2, hub: hub) }
  let!(:vote1) { create(:vote, proposal: proposal1, user: user2) }

  describe 'POST creates' do

    context 'current user has no other vote in the proposal tree' do
      it 'creates a new vote' 

    end

    context 'current user has vote already on this proposal' do
      let!(:proposal2) { create(:proposal, user: current_user, parent: proposal1, hub: hub) }
      let!(:vote2) { create(:vote, proposal: proposal2, user: current_user) }

      it 'should not create a new vote' 


      it 'moves the vote from the proposal2 to proposal1' 

    end
  end
end

