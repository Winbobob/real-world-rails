require "#{Rails.root}/db/chores/ncr_work_order_organization_reassigner"

describe Ncr::WorkOrderOrganizationReassigner do
  describe "#run" do
    it "reassigns work order organizations from strings to foreign keys" 


    it "does not assign an organization to work orders without an org code" 

  end

  describe "#unrun" do
    it "assigns work order org_code based on ncr_organization data" 


    it "does not assign an org_code for work orders without an organization" 

  end
end

