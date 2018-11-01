require "spec_helper"

describe BikeCodesController do
  describe "update" do
    let(:bike_code) { FactoryGirl.create(:bike_code) }
    let(:bike) { FactoryGirl.create(:bike) }
    context "no user" do
      it "responds with 401" 

    end
    context "user present" do
      include_context :logged_in_as_user
      it "succeeds" 

      context "bikeindex url" do
        it "succeeds" 

      end
      context "bike not found" do
        it "shows error message" 

      end
      context "code not found" do
        it "responds with 404" 

      end
      context "already claimed bike" do
        let(:bike_code) { FactoryGirl.create(:bike_code, bike_id: bike.id) }
        let(:bike2) { FactoryGirl.create(:bike) }
        it "responds with flash error" 

        context "organized" do
          let(:organization) { FactoryGirl.create(:organization) }
          let(:user) { FactoryGirl.create(:organization_member, organization: organization) }
          let(:bike_code) { FactoryGirl.create(:bike_code, bike_id: bike.id, organization: organization) }
          it "succeeds" 

        end
      end
    end
  end
end

