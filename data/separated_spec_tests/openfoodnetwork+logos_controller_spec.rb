require "spec_helper"

module Api
  describe LogosController, type: :controller do
    include AuthenticationWorkflow

    let(:admin_user) { create(:admin_user) }
    let(:enterprise_owner) { create(:user) }
    let(:enterprise) { create(:enterprise, owner: enterprise_owner ) }
    let(:enterprise_manager) { create(:user, enterprise_limit: 10, enterprises: [enterprise]) }
    let(:other_enterprise_owner) { create(:user) }
    let(:other_enterprise) { create(:enterprise, owner: other_enterprise_owner ) }
    let(:other_enterprise_manager) { create(:user, enterprise_limit: 10, enterprises: [other_enterprise]) }

    describe "removing logo" do
      image_path = File.open(Rails.root.join("app", "assets", "images", "logo-black.png"))
      let(:image) { Rack::Test::UploadedFile.new(image_path, "image/png") }

      let(:enterprise) { create(:enterprise, owner: enterprise_owner, logo: image) }

      before do
        allow(controller).to receive(:spree_current_user) { current_user }
      end

      context "as manager" do
        let(:current_user) { enterprise_manager }

        it "removes logo" 


        context "when logo does not exist" do
          let(:enterprise) { create(:enterprise, owner: enterprise_owner, logo: nil) }

          it "responds with error" 

        end
      end

      context "as owner" do
        let(:current_user) { enterprise_owner }

        it "allows removal of logo" 

      end

      context "as super admin" do
        let(:current_user) { admin_user }

        it "allows removal of logo" 

      end

      context "as manager of other enterprise" do
        let(:current_user) { other_enterprise_manager }

        it "does not allow removal of logo" 

      end

      context "as owner of other enterprise" do
        let(:current_user) { other_enterprise_owner }

        it "does not allow removal of logo" 

      end
    end
  end
end

