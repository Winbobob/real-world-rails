require "spec_helper"

describe Organized::StickersController, type: :controller do
  let(:root_path) { organization_bikes_path(organization_id: organization.to_param) }
  let(:stickers_root_path) { organization_stickers_path(organization_id: organization.to_param) }
  let!(:bike_code) { FactoryGirl.create(:bike_code, organization: organization, code: "partee") }

  before { set_current_user(user) if user.present? }

  context "organization without has_bike_codes" do
    let!(:organization) { FactoryGirl.create(:organization) }
    context "logged in as organization admin" do
      let(:user) { FactoryGirl.create(:organization_admin, organization: organization) }
      describe "index" do
        it "redirects" 

      end
      describe "edit" do
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

  context "organization with has_bike_codes" do
    let!(:organization) { FactoryGirl.create(:organization, has_bike_codes: true) }
    let(:user) { FactoryGirl.create(:organization_member, organization: organization) }

    context "logged in as organization member" do
      describe "index" do
        it "renders" 

        context "with query search" do
          let!(:bike_code_claimed) { FactoryGirl.create(:bike_code, organization: organization, code: "part") }
          let!(:bike_code_no_org) { FactoryGirl.create(:bike_code, code: "part") }
          before { bike_code_claimed.claim(user, FactoryGirl.create(:bike).id) }
          it "renders" 

        end
        context "with bike_query" do
          let!(:bike) { FactoryGirl.create(:bike) }
          let!(:bike_code_claimed) { FactoryGirl.create(:bike_code, organization: organization, code: "part") }
          before { bike_code_claimed.claim(user, bike.id) }
          it "renders" 

        end
      end

      describe "edit" do
        it "renders" 

      end

      describe "update" do
        let(:bike) { FactoryGirl.create(:bike) }
        let(:bike_code) { FactoryGirl.create(:bike_code, bike_id: bike.id, organization_id: organization.id) }
        let(:bike2) { FactoryGirl.create(:bike) }
        it "updates" 

        context "other organization bike_code" do
          let(:bike_code) { FactoryGirl.create(:bike_code, bike_id: bike.id) }
          it "responds with flash error" 

        end
        context "nil bike_id" do
          it "updates and removes the assignment" 

        end
      end
    end
  end
end

