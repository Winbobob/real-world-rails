describe Ncr::WorkOrderUpdater do
  describe ".run" do
    it "sends an on_proposal_update email" 


    context "reapproval necessary" do
      it "restarts budget approvals" 

    end

    context "reapproval not necessary" do
      it "does not restart budget approvals" 

    end
  end

  def stub_reapproval_checker_and_return(value, work_order)
    checker_double = double(requires_budget_reapproval?: value)
    allow(Ncr::WorkOrderReapprovalChecker).to receive(:new).with(work_order).
      and_return(checker_double)
  end

  def create_comment(work_order)
    @_comment ||= create(
      :comment,
      update_comment: true,
      user: work_order.requester,
      proposal: work_order.proposal
    )
  end
end

