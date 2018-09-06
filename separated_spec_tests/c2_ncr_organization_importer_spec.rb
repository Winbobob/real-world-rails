require File.join(Rails.root, "/db/chores/ncr_organization_importer")

SAMPLE_NCR_ORG_CODES = "spec/support/fixtures/sample_ncr_org_codes.csv".freeze

describe Ncr::OrganizationImporter do
  describe "#run" do
    it "creates Ncr::Organization records" 


    it "is indempotent" 

  end
end

