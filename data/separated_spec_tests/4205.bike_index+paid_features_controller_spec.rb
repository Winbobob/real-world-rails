require "spec_helper"

describe Admin::PaidFeaturesController, type: :controller do
  let(:subject) { FactoryGirl.create(:paid_feature) }
  include_context :logged_in_as_super_admin
  let(:passed_params) { { amount: 222.22, description: "Some really long description or wahtttt", details_link: "https://example.com" } }
  let(:full_params) { passed_params.merge(kind: "custom_one_time", name: "another name stuff") }

  describe "index" do
    it "renders" 

  end

  describe "edit" do
    it "renders" 

  end

  describe "new" do
    it "renders" 

  end

  describe "update" do
    let!(:original_name) { subject.name }
    let!(:original_kind) { subject.kind }
    it "updates available attributes" 

    context "locked paid_feature" do
      let(:subject) { FactoryGirl.create(:paid_feature, is_locked: true) }
      it "does not update locked attributes" 

    end
  end

  describe "create" do
    it "succeeds" 

  end
end

