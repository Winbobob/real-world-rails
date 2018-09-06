describe Ncr::WorkOrdersController do
  include ProposalSpecHelper

  describe "#create" do
    it "sends an email to the first approver", :email do
      approving_official = create(:user, client_slug: "ncr")
      params = {
        ncr_work_order: {
          amount: "111.22",
          expense_type: "BA80",
          vendor: "Vendor",
          not_to_exceed: "0",
          building_number: Ncr::BUILDING_NUMBERS[0],
          emergency: "0",
          rwa_number: "A1234567",
          ncr_organization_id: create(:ncr_organization).code_and_name,
          work_order_code: "Work Order",
          project_title: "Title",
          description: "Desc",
          approving_official_id: approving_official.id
        }
      }

      login_as(create(:user, client_slug: "ncr"))

      post :create, params
      ncr = Ncr::WorkOrder.order(:id).last

      expect(ncr.work_order_code).to eq "Work Order"
      expect(ncr.approvers.first).to eq approving_official
      expect(email_recipients).to eq([approving_official.email_address, ncr.requester.email_address].sort)
    end
  end

  describe "#edit" do
    let(:work_order) { create(:ncr_work_order, :with_approvers) }
    let(:requester) { work_order.proposal.requester }
    before do
      login_as(requester)
    end

    it "does not display a message when the proposal is not fully approved" 


    it "displays a warning message when editing a fully-approved proposal" 


    it "does not explode if editing an emergency" 

  end

  describe "#update" do
    it "does not modify the work order when there is a bad edit" 


    it "respects FY start date for setting default max amount" 


    it "allows the project title to be edited" 


    it "allows the approver to be edited" 


    it "does not modify the approver if already approved" 


    it "will not modify emergency status on non-emergencies" 


    it "will not modify emergency status on emergencies" 

  end
end

