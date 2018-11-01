require "spec_helper"

describe Admin::Organizations::InvoicesController, type: :controller do
  let(:organization) { FactoryGirl.create(:organization) }
  let(:invoice) { FactoryGirl.create(:invoice, organization: organization) }
  let(:paid_feature1) { FactoryGirl.create(:paid_feature) }
  let(:paid_feature2) { FactoryGirl.create(:paid_feature) }
  let(:params) do
    {
      paid_feature_ids: [paid_feature1.id, paid_feature2.id].join(","),
      amount_due: "1220",
      timezone: "EST",
      subscription_start_at: "2018-09-05T23:00:00"
    }
  end
  context "super admin" do
    include_context :logged_in_as_super_admin

    describe "index" do
      it "renders" 

    end

    describe "edit" do
      it "renders" 

    end

    describe "create" do
      it "creates" 

    end

    describe "update" do
      let(:paid_feature3) { FactoryGirl.create(:paid_feature) }
      let(:invoice) { FactoryGirl.create(:invoice, organization: organization, amount_due: 10) }
      it "creates" 

      context "create_following_invoice" do
        let!(:invoice) { FactoryGirl.create(:invoice, organization: organization, subscription_start_at: Time.now - 2.years, force_active: true) }
        it "creates following invoice" 

      end
    end
  end
end

