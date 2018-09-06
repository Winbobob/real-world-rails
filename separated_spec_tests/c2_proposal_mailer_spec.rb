describe ProposalMailer, :email do
  include MailerSpecHelper

  describe "#proposal_created_confirmation" do
    let(:mail) { ProposalMailer.proposal_created_confirmation(proposal) }

    it_behaves_like "a proposal email"

    it "renders the receiver email" 


    it "uses the default sender name" 

  end

  describe "#emergency_proposal_created_confirmation" do
    let(:mail) { ProposalMailer.emergency_proposal_created_confirmation(proposal) }

    it_behaves_like "a proposal email"

    it "contains information about the proposal" 

  end

  describe "#proposal_complete" do
    let(:mail) { ProposalMailer.proposal_complete(proposal) }

    it_behaves_like "a proposal email"
  end

  describe "#proposal_updated_no_action_required" do
    let(:proposal) { create(:proposal, :with_approver) }
    let(:user) { proposal.requester }
    let(:comment) { create(:comment, proposal: proposal) }
    let(:mail) { ProposalMailer.proposal_updated_no_action_required(user, proposal, comment) }

    it_behaves_like "a proposal email"
  end

  describe "#proposal_updated_needs_re_review" do
    let(:proposal) { create(:proposal, :with_approver) }
    let(:user) { proposal.requester }
    let(:comment) { create(:comment, proposal: proposal) }
    let(:mail) { ProposalMailer.proposal_updated_needs_re_review(user, proposal, comment) }

    it_behaves_like "a proposal email"
  end

  describe "#proposal_updated_while_step_pending" do
    let(:proposal) { create(:proposal, :with_approver) }
    let(:step) { proposal.individual_steps.first }
    let(:comment) { create(:comment, proposal: proposal) }
    let(:mail) { ProposalMailer.proposal_updated_while_step_pending(step, comment) }

    it_behaves_like "a proposal email"
  end

  private

  def proposal
    @proposal ||= create(:ncr_work_order, :is_emergency).proposal
  end
end

