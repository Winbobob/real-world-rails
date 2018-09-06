describe Gsa18f::ProcurementPolicy do
  include EnvVarSpecHelper

  permissions :can_create? do
    it "allows a user with an arbitrary email to create" 


    it "allows someone with a GSA email to create" 


    it "doesn't allow someone with a non-GSA email to create" 

  end

  permissions :can_cancel? do
    it "allows requester to cancel" 


    it "allows admins to cancel" 


    it "allows approver to cancel" 


    it "allows approver delegate to cancel" 


    it "does not allow purchaser to cancel" 

  end
end

