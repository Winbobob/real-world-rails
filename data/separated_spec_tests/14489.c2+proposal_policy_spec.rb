describe ProposalPolicy do
  let(:proposal) { create(:proposal, :with_parallel_approvers, :with_observers) }

  permissions :can_complete? do
    it "allows pending delegates" 


    context "parallel proposal" do
      let(:proposal) {create(:proposal, :with_parallel_approvers)}
      let(:approval) {proposal.individual_steps.first}

      it "allows when there's a pending approval" 


      it "does not allow when the user's already completed" 


      it "does not allow with a non-existent approval" 

    end

    context "linear proposal" do
      it "allows when there's a pending approval" 


      it "allows when there's a pending purchase" 


      it "does not allow when it's not the user's turn" 


      it "does not allow when the user's already completed" 


      it "does not allow with a non-existent approval" 


      it "allows pending delegates" 

    end
  end

  permissions :can_show? do
    let(:proposal) {create(:proposal, :with_parallel_approvers, :with_observers)}

    it "allows the requester to see it" 


    it "allows an approver to see it" 


    it "does not allow a pending approver to see it" 


    it "allows an observer to see it" 


    it "does not allow anyone else to see it" 

  end

  permissions :can_edit? do
    it "allows the requester to edit" 


    it "allows an admin to edit" 


    it "doesn't allow an approver to edit it" 


    it "doesn't allow an observer to edit it" 


    it "does not allow anyone else to edit it" 


    it "does not allow an completed request to be edited" 

  end

  permissions :can_cancel? do
    it "allows the requester to cancel it" 


    it "does not allow a requester to edit a canceled one" 


    it "allows an actionable approver to cancel it" 


    it "allows a delegate of an actionable approver to cancel it" 


    it "does not allow pending approver to cancel it" 


    it "allows admins to cancel" 

  end
end

