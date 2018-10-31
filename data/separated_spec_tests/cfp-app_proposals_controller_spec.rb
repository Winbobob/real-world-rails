require 'rails_helper'

describe ProposalsController, type: :controller do
  let(:event) { create(:event) }

  describe 'GET #new' do
    before {
      allow(@controller).to receive(:require_user) { true }
    }

    it 'should succeed' 

  end

  describe 'POST #create' do
    let(:proposal) { build_stubbed(:proposal, uuid: 'abc123') }
    let(:user) { create(:person) }
    let(:params) {
      {
        slug: event.slug,
        proposal: {
          title: proposal.title,
          abstract: proposal.abstract,
          details: proposal.details,
          pitch: proposal.pitch,
          speakers_attributes: {
            '0' => {
              bio: 'my bio',
              person_id: user.id
            }
          }
        }
      }
    }

    before { allow(controller).to receive(:current_user).and_return(user) }

    it "sets the user's bio if not is present" 


    context "With completed demgraphics" do
      it "redirects to the new proposal" 

    end

    context "With incomplete demographics" do
      it "redirects to the profile page" 

    end
  end

  describe "GET #confirm" do
    it "allows any user with an accepted proposal" 

  end

  describe "POST #set_confirmed" do
    it "confirms a proposal" 


    it "can set confirmation_notes" 

  end

  describe 'POST #withdraw' do
    let(:proposal) { create(:proposal, event: event) }
    let(:user) { create(:person) }
    before { allow(controller).to receive(:current_user).and_return(user) }

    it "sets the state to withdrawn for unconfirmed proposals" 


    it "leaves state unchanged for confirmed proposals" 


    it "sends an in-app notification to reviewers" 

  end

  describe 'PUT #update' do
    let(:speaker) { create(:speaker) }
    let(:proposal) { create(:proposal, speakers: [ speaker ] ) }

    before { login(speaker.person) }

    it "updates a proposals attributes" 


    it "sends a notifications to an organizer" 

  end
end

