RSpec.describe Hyrax::Admin::AppearancesController, type: :controller, singletenant: true do
  before { sign_in user }
  routes { Hyrax::Engine.routes }

  context 'with an unprivileged user' do
    let(:user) { create(:user) }

    describe "GET #show" do
      it "denies the request" 

    end

    describe "PUT #update" do
      it "denies the request" 

    end
  end

  context 'with an administrator' do
    let(:user) { create(:admin) }

    describe "GET #show" do
      it "assigns the requested site as @site" 

    end

    describe "PUT #update" do
      let(:hyrax) { routes.url_helpers }

      context "with valid params" do
        let(:valid_attributes) do
          { banner_image: "image.jpg" }
        end

        it "sets a banner image" 


        it "redirects to the site" 

      end

      context "with invalid params" do
        let(:invalid_attributes) do
          { banner_image: "" }
        end

        it "re-renders the 'show' template" 

      end
    end
  end
end

