require "spec_helper"

describe Admin::PaymentsController, type: :controller do
  include_context :logged_in_as_super_admin
  let(:subject) { FactoryGirl.create(:payment, user: user) }
  let(:organization) { FactoryGirl.create(:organization) }
  let(:invoice) { FactoryGirl.create(:invoice, organization: organization) }
  let(:user2) { FactoryGirl.create(:user) }
  let(:create_time) { Time.now - 2.weeks }
  let(:params) { { organization_id: organization.id, invoice_id: invoice.id, email: user2.email, amount: 222.22, kind: "stripe", created_at: create_time.strftime("%FT%T%:z") } }

  describe "index" do
    it "renders" 

  end

  describe "invoices" do
    it "renders" 

  end

  describe "edit" do
    it "renders" 

  end

  describe "new" do
    it "renders" 

  end

  describe "update" do
    context "stripe payment" do
      let(:og_time) { Time.now - 3.hours }
      let(:invoice) { FactoryGirl.create(:invoice, organization: organization, updated_at: og_time) }
      it "updates available attributes" 

    end
    context "check payment" do
      let(:subject) { FactoryGirl.create(:payment_check, organization: nil, amount_cents: 55_555, user: user) }
      it "updates available attributes" 

      context "no invoice" do
        it "updates available attributes" 

      end
      context "invoice for different organization" do
        let(:invoice) { FactoryGirl.create(:invoice) }
        let!(:subject) { FactoryGirl.create(:payment_check, organization: organization, amount_cents: 55_555, user: user, invoice: nil) }
        it "Does not update" 

      end
    end
  end

  describe "create" do
    context "stripe payment" do
      it "does not create" 

    end
    context "check payment" do
      it "creates" 

      context "no organization" do
        it "creates" 

      end
    end
  end
end

