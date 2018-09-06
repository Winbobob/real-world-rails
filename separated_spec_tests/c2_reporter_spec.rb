describe Ncr::Reporter do
  before(:each) do
    @work_order           = create(:ncr_work_order, :with_approvers)
    @completed_work_order = create(:ncr_work_order, :with_approvers).tap(&:setup_approvals_and_observers)
  end

  describe "#proposals_pending_approving_official" do
    it "only returns Proposals where the approving official is actionable" 

  end

  describe "#proposals_pending_budget" do
    it "only returns Proposals where the budget approver is actionable" 

  end

  describe "#as_csv" do
    it "shows final approver for completed work orders" 


    it "shows current approver for pending work orders" 


    it "shows final completed date and completion duration in days" 

  end

  describe "#build_fiscal_year_report_string" do
    it "includes information about approved NCR work orders for fiscal year passed in" 

  end
end

