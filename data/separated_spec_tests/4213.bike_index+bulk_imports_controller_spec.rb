require "spec_helper"

describe Admin::BulkImportsController do
  let(:user) { FactoryGirl.create(:admin) }
  before do
    set_current_user(user)
  end

  describe "index" do
    let!(:bulk_import) { FactoryGirl.create(:bulk_import) }
    it "renders" 

  end

  describe "show" do
    let!(:bulk_import) { FactoryGirl.create(:bulk_import) }
    it "renders" 

  end

  describe "new" do
    it "renders" 

  end

  describe "create" do
    context "valid create" do
      let(:organization) { FactoryGirl.create(:organization) }
      let(:file) { Rack::Test::UploadedFile.new(File.open(File.join("public", "import_all_optional_fields.csv"))) }
      let(:valid_attrs) { { file: file, organization_id: organization.id, no_notify: "1" } }
      it "creates" 

    end
  end
end

