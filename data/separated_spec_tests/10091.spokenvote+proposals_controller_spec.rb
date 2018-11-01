require 'spec_helper'

describe ProposalsController do
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe 'POST create' do
    login_user

    context 'with existing hub' do
      let(:hub) { create(:hub) }

      describe 'new proposal' do
        describe 'with valid parameters' do
          let(:valid_attributes) do
            {
              statement: Faker::Lorem.sentence,
              hub_id: hub.id,
              votes_attributes: attributes_for(:vote)
            }
          end

          it 'creates a new proposal' 


          it "increases the vote count by 1" 


          it "creates a valid vote" 


          it "updates the votes_count attribute of the proposal loaded in memory" 

        end

        describe 'with invalid parameters' do
          let(:invalid_attributes) do
            {
              :hub => hub.attributes,
              :votes_attributes => attributes_for(:vote)
            }
          end

          it 'expect not create a new proposal' 


          it 'expect not increase the vote count' 

        end
      end

      describe 'improve proposal' do
        describe 'with valid parameters' do
          let(:hub) { create(:hub) }
          let(:current_user) { user } # Logged in user

          context 'current user has no other vote in the proposal tree' do
            let(:user2) { create(:user) }
            let!(:proposal1) { create(:proposal, user: user2, hub: hub, statement: 'Proposal-1') }
            let!(:vote1) { create(:vote, user: user2, proposal: proposal1, comment: 'Proposal-1 --> Vote-1') }
            let(:valid_attributes) { attributes_for(:proposal, parent_id: proposal1.id, votes_attributes: attributes_for(:vote)) }

            it 'expect proposal1 votes count to start at 1' 


            it 'creates a new improved proposal' 


            it 'expect increase in the votes count by 1' 


            it "updates the votes_count attribute of the proposal loaded in memory" 

          end

          context 'user has an existing vote in the proposal tree' do
            let(:user2) { create(:user) }

            let!(:proposal1) { create(:proposal, user: current_user, hub: hub, statement: 'Proposal-1') }
            let!(:vote1) { create(:vote, user: current_user, proposal: proposal1, comment: 'Proposal-1 --> Vote-1') }

            let!(:proposal2) { create(:proposal, user: user2, hub: hub, statement: 'Proposal-1 --> Proposal-2', parent: proposal1) }
            let!(:vote2) { create(:vote, user: user2, proposal: proposal2, comment: 'Proposal-1 --> Proposal-2 --> Vote-1') }

            let(:valid_attributes) { attributes_for(:proposal, parent_id: proposal2.id, votes_attributes: attributes_for(:vote)) }

            it 'creates a new improved proposal' 


            it 'expect to not increase the votes count' 

          end
        end
      end
    end

    context 'without existing hub' do
      describe 'create new proposal while creating a new hub' do
        describe 'with valid parameters' do
          let(:valid_attributes) do
            {
              statement: Faker::Lorem.sentence,
              hub_attributes: {
                group_name: 'Hacker Dojo',
                location_id: 'somerandomgoogleplacesid',
                formatted_location: 'Mountain View, CA'
              },
              votes_attributes: attributes_for(:vote)
            }
          end

          it 'creates a new proposal' 


          it "increases the vote count by 1" 


          it "creates a valid vote" 


          it "updates the votes_count attribute of the proposal loaded in memory" 


          it 'creates a new hub' 

        end
      end
    end
  end

  describe 'Get index' do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:user3) { create(:user) }
    let!(:user4) { create(:user) }

    let!(:hub1) { create(:hub, group_name: 'State of California') }
    let!(:hub2) { create(:hub, group_name: 'The United Nations') }

    let!(:proposal1) { create(:proposal, statement: 'P1: Taxes might be reduced by 5% in California', hub: hub1, user: user1) }
    let!(:proposal2) { create(:proposal, statement: 'P2: Public transportation might be improved in California', hub: hub1, user: user1) }
    let!(:proposal3) { create(:proposal, statement: 'P3: Animals not be killed for food', hub: hub2, user: user1) }
    let!(:forked_proposal2) { create(:proposal, statement: 'FP2: Public transportation ought be made better California', hub: hub1, user: user4, parent: proposal2) }
    let!(:forked_proposal3) { create(:proposal, statement: 'FP3: Animals are not to be killed for seafood', hub: hub2, user: user4, parent: proposal3) }

    let!(:vote1) { create(:vote, proposal: proposal1, user: user1) }
    let!(:vote2) { create(:vote, proposal: proposal1, user: user2) }
    let!(:vote3) { create(:vote, proposal: proposal1, user: user3) }
    let!(:vote4) { create(:vote, proposal: proposal2, user: user2) }
    let!(:vote5) { create(:vote, proposal: proposal3, user: user1) }
    let!(:vote6) { create(:vote, proposal: proposal3, user: user2) }
    let!(:vote7) { create(:vote, proposal: forked_proposal2, user: user1) }
    let!(:vote8) { create(:vote, proposal: forked_proposal2, user: user4) }
    let!(:vote9) { create(:vote, proposal: forked_proposal2, user: user3) }
    let!(:vote10) { create(:vote, proposal: forked_proposal3, user: user3) }

    describe 'New' do
      it 'returns all new proposals' 


      it 'returns new proposals for a particular hub' 


      it 'returns the list of proposals in reverse order of the their updates' 

    end

    describe 'Active' do
      it 'returns all active proposals' 


      it 'returns active proposals for a particular hub' 


      it 'returns the list of proposals in reverse order of the number of votes received in the whole proposal tree' 

    end

    describe 'My Votes' do
      describe 'for User #1'do
        before :each do
          login_with_user(user1)
        end

        it 'returns all proposals on which the current user voted' 


        it 'returns all proposals for a particular hub on which the current user voted' 

      end

      describe 'for User #2' do
        before :each do
          login_with_user(user2)
        end

        it 'returns all proposals on which the current user voted' 


        it 'returns all proposals for a particular hub on which the current user voted' 

      end
    end
  end
end
