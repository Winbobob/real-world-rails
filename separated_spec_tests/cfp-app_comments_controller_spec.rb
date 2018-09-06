require 'rails_helper'

describe CommentsController, type: :controller do
  describe "POST #create" do
    let(:proposal) { build_stubbed(:proposal, uuid: 'abc123') }
    let(:person) { build_stubbed(:person) }
    let(:referer_path) { proposal_path(slug: proposal.event.slug, uuid: proposal) }
    let(:mailer) { double("ProposalMailer.comment_notification") }

    before do
      allow(Proposal).to receive(:find).and_return(proposal)
      request.env['HTTP_REFERER'] =  referer_path
    end

    context "Public comments" do
      let(:comment_person) { build_stubbed(:person) }
      let(:comment) { build_stubbed(:comment, type: "PublicComment", person: comment_person) }
      let(:params) { { public_comment: { body: 'foo', proposal_id: proposal.id }, type: "PublicComment" } }

      before do
        allow(comment_person).to receive(:reviewer?).and_return(true)
        allow(comment_person).to receive(:reviewer_for_event?).and_return(true)
        allow_any_instance_of(CommentsController).to receive(:current_user) { comment_person }
      end

      it "adds a comment to the proposal" 


      it "returns to the referer" 


      it "sends an email notification to the speaker" 


      it "sends an email notification to all speakers" 

    end

    context "Internal comments" do
      let(:comment) { build_stubbed(:comment, type: "InternalComment") }
      let(:params) { { internal_comment: { body: 'foo', proposal_id: proposal.id }, type: "InternalComment" } }
      let(:reviewer) { build_stubbed(:reviewer)}

      before do
        allow_any_instance_of(CommentsController).to receive(:current_user) { reviewer }
      end

      it "adds the comment to the proposal" 


      it "returns to the referer" 


      it "does not send a notification email to the speaker" 

    end
  end
end

