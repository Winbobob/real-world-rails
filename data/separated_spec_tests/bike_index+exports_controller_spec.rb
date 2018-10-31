require "spec_helper"

describe Organized::ExportsController, type: :controller do
  let(:root_path) { organization_bikes_path(organization_id: organization.to_param) }
  let(:exports_root_path) { organization_exports_path(organization_id: organization.to_param) }
  let(:export) { FactoryGirl.create(:export_organization, organization: organization) }

  before { set_current_user(user) if user.present? }

  context "organization without has_bike_codes" do
    let(:organization) { FactoryGirl.create(:organization) }
    context "logged in as organization admin" do
      let(:user) { FactoryGirl.create(:organization_admin, organization: organization) }
      describe "index" do
        it "redirects" 

      end

      describe "show" do
        it "redirects" 

      end
    end

    context "logged in as super admin" do
      let(:user) { FactoryGirl.create(:admin) }
      describe "index" do
        it "renders" 

      end
    end
  end

  context "organization with csv-exports" do
    let!(:organization) { FactoryGirl.create(:organization) }
    let(:user) { FactoryGirl.create(:organization_member, organization: organization) }
    before { organization.update_column :paid_feature_slugs, ["csv-exports"] } # Stub organization having paid feature

    describe "index" do
      it "renders" 

    end

    describe "show" do
      it "renders" 

      context "not organization export" do
        let(:export) { FactoryGirl.create(:export_organization) }
        it "404s" 

      end
    end

    describe "new" do
      it "renders" 

    end

    describe "destroy" do
      it "renders" 

    end

    describe "create" do
      let(:start_at) { 1454925600 }
      let(:valid_attrs) do
        {
          start_at: "2016-02-08 05:00:00",
          end_at: nil,
          timezone: "America/New York",
          headers: %w[link registered_at manufacturer model registered_by]
        }
      end
      it "creates the expected export" 

    end
  end
end

