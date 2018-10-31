describe Ncr::WorkOrderDecorator do
  describe "#current_approver_email_address" do
    it "returns NOT FOUND string when WorkOrder has no approvers" 


    it "returns EMERGENCY string when WorkOrder is emergency" 


    it "returns pending (current) approver email address" 


    it "returns current approver email address when status is pending" 


    it "returns final approver when status is completed" 

  end

  describe "#translated_key" do
    it "fetches the correct translation" 

  end
end

