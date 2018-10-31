describe Ncr::ApprovalManager do
  describe '#setup_approvals_and_observers' do
    let(:ba61_tier_one) { Ncr::Mailboxes.ba61_tier1_budget }
    let(:ba61_tier_two) { Ncr::Mailboxes.ba61_tier2_budget }

    it "creates approvers when not an emergency" 


    it "replaces approving official step when approving official changed to system approver delegate" 


    it "reuses existing approvals" 


    it "creates observers when in an emergency" 


    it "accounts for approver transitions when nothing's completed" 


    describe "when changing expense type on a proposal which has only been approved by the approving official" do
      context "from one with budget approvers to one without" do
        it "changes the approval status" 

      end
    end

    it "does not re-add observers on emergencies" 


    it "handles the delegate then update scenario" 

  end

  describe '#system_approvers' do
    context "for a BA61 request" do
      let(:ba61_tier_one) { Ncr::Mailboxes.ba61_tier1_budget }
      let(:ba61_tier_two) { Ncr::Mailboxes.ba61_tier2_budget }

      context "when budget approvers are automatically added" do
        it "skips the Tier 1 budget approver for WHSC" 


        it "includes the Tier 1 budget approver for an unknown organization" 

      end

      context "when budget approvers are not automatically added" do
        it "does not include any budget approvers" 

      end
    end

    context "for a BA80 request" do
      it "uses the general budget email" 


      it "uses the OOL budget email for their org code" 

    end
  end

  describe "#should_add_budget_approvers_to_6x?" do
    before(:each) { @manager = Ncr::ApprovalManager.new(nil) }

    it "returns true before July 5 2016" 


    it "returns false on or after July 5 2016" 

  end
end

