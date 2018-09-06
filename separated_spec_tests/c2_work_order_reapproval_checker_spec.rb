describe Ncr::WorkOrderReapprovalChecker do
  include ProposalSpecHelper

  describe '#requires_budget_reapproval?' do
    context "when the amount has been changed" do
      it "returns false by when the amount is decreased" 


      it "returns true if amount is increased" 

    end

    context "when details have other than amount have been changed" do
      it "returns true if one of the protected fields is changed" 


      it "returns false if a protected field is set for the first time" 


      it "returns false if none of the protected fields are changed" 

    end

    context "when the changes were made by a budget approver" do
      it "returns false if the function code is changed by a budget approver" 


      it "returns false if a protected field is changed by a budget approver delegate" 


      it "returns false if a protected field is changed by a budget approver delegate who did not complete the step" 

    end

    context "when the proposal has no budget approval steps" do
      it "returns false" 

    end
  end
end

