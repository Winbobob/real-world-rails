require "spec_helper"

describe Organized::BulkImportsController, type: :controller do
  let(:root_path) { organization_bikes_path(organization_id: organization.to_param) }
  let(:bulk_import) { FactoryGirl.create(:bulk_import, organization: organization) }

  before { set_current_user(user) if user.present? }

  context "organization without show_bulk_import" do
    let!(:organization) { FactoryGirl.create(:organization) }
    context "not logged in" do
      let(:user) { nil }
      it "redirects" 

    end

    context "logged in as organization admin" do
      let(:user) { FactoryGirl.create(:organization_admin, organization: organization) }
      describe "index" do
        it "redirects" 

      end
      describe "new" do
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

      describe "new" do
        it "renders" 

      end
    end
  end

  context "organization with show_bulk_import" do
    let!(:organization) { FactoryGirl.create(:organization, show_bulk_import: true) }
    context "logged in as organization member" do
      let(:user) { FactoryGirl.create(:organization_member, organization: organization) }
      describe "index" do
        it "redirects" 

      end
      describe "new" do
        it "redirects" 

      end
      describe "show" do
        it "redirects" 

      end
    end
    context "logged_in_as_organization_admin" do
      let(:user) { FactoryGirl.create(:organization_admin, organization: organization) }
      describe "index" do
        it "renders" 

      end

      describe "new" do
        it "renders" 

      end

      describe "show" do
        it "redirects" 

        context "not organizations bulk_import" do
          let(:bulk_import) { FactoryGirl.create(:bulk_import) }
          it "redirects" 

        end
      end
      describe "create" do
        let(:file) { Rack::Test::UploadedFile.new(File.open(File.join("public", "import_all_optional_fields.csv"))) }
        context "valid create" do
          let(:bulk_import_params) { { file: file, organization_id: 392, no_notify: "1" } }
          it "creates" 

        end
        context "API create" do
          let(:organization) { FactoryGirl.create(:organization_with_auto_user, show_bulk_import: true, api_access_approved: true) }
          let(:user) { nil }
          context "invalid API token" do
            it "returns JSON message" 

          end
          context "valid" do
            it "returns JSON message" 

          end
        end
      end
    end
  end
end

