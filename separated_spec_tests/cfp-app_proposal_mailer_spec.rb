require "rails_helper"

describe ProposalMailer do
  describe "comment_notification" do
    let(:proposal) { create(:proposal) }
    let(:person) { create(:person) }
    let(:comment) { create(:comment, person: person, proposal: proposal) }
    let(:mail) { ProposalMailer.comment_notification(proposal, comment) }

    it "bccs to all speakers" 


    it "doesn't bcc the speaker if they are also the commenter" 

  end

end

