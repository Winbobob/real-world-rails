describe Ncr::WorkOrderPolicy do
  include EnvVarSpecHelper

  subject { described_class }

  permissions :can_edit? do
    let(:work_order) { create(:ncr_work_order, :with_approvers) }
    let(:proposal) { work_order.proposal }

    it "allows the requester to edit it" 


    it "allows an approver to edit it" 


    it "allows approval.completer to edit it" 


    it "allows a delegate to edit it" 


    it "allows an observer to edit it" 


    it "does not allow anyone else to edit it" 


    it "allows an completed request to be edited" 

  end

  permissions :can_create? do
    it "allows a user with an arbitrary email to create" 


    it "allows someone with a GSA email to create" 


    it "doesn't allow someone with a non-GSA email to create" 

  end
end

