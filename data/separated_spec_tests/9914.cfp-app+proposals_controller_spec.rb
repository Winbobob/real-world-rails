require 'rails_helper'

describe Reviewer::ProposalsController, type: :controller do

  let(:proposal) { create(:proposal) }
  let(:event) { proposal.event }
  let(:reviewer) { create(:person, :reviewer) }
  let(:speaker) { create(:speaker, proposal: proposal) }


  before { login reviewer }

  describe "GET 'show'" do
    it "marks all notifications for this proposal as read" 

  end

  describe '#index' do
    it "should respond" 

  end

  context "reviewer has a submitted proposal" do
    let!(:speaker) { create(:speaker, person: reviewer) }
    let!(:proposal) { create(:proposal, speakers: [ speaker ]) }

    it "prevents reviewers from viewing their own proposals" 


    it "prevents reviewers from updating their own proposals" 

  end
end

