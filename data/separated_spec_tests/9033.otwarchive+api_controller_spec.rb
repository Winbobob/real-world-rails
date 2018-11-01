# frozen_string_literal: true
require "spec_helper"

describe Admin::ApiController do
  include LoginMacros
  include RedirectExpectationHelper

  describe "GET #index" do
    let(:params) { {} }

    context "where there is no user or admin logged in" do
      it "redirects to the homepage with a notice" 

    end

    context "where user is not an admin" do
      let(:user) { FactoryGirl.create(:user) }

      before do
        fake_login_known_user(user)
      end

      it "redirects to the homepage with a notice" 

    end

    context "where admin is logged in" do
      render_views
      let(:admin) { FactoryGirl.create(:admin) }

      before do
        fake_login_admin(admin)
      end

      let(:api_key_prefixes) { %w(a b c) }
      let!(:api_keys) do
        api_key_prefixes.each do |p|
          FactoryGirl.create(:api_key, name: "#{p}_key")
        end
      end

      context "where no query params are set" do
        it "returns a successful response with all api keys" 

      end

      context "where query params are set" do
        let(:params) { { query: "a_key" } }
        it "returns a successful response with a filtered list of api keys" 

      end
    end
  end

  describe "GET #new" do
    context "where an admin is logged in" do
      let(:admin) { FactoryGirl.create(:admin) }

      before do
        fake_login_admin(admin)
      end
      it "responds with the new api key form" 

    end
  end

  describe "POST #create" do
    context "where an admin is logged in" do
      let(:admin) { FactoryGirl.create(:admin) }
      let(:params) { {} }

      before do
        fake_login_admin(admin)
      end

      context "with an api key param" do
        let(:api_key_name) { "api_key" }
        let(:api_key_params) { { name: api_key_name } }
        let(:params) { { api_key: api_key_params } }

        it "redirects to the homepage and notifies of the success" 

      end

      context "without an api key param" do
        it "shows the new api view" 

      end

      context "the save was unsuccessful" do
        let(:api_key_name) { "api_key" }
        let(:api_key_params) { { name: api_key_name } }
        let(:params) { { api_key: api_key_params } }

        before do
          allow_any_instance_of(ApiKey).to receive(:save).and_return(false)
        end

        it "shows the new api view" 

      end

      context "cancel_button is present" do
        let(:params) { { cancel_button: "Cancel" } }

        it "redirects to index" 

      end
    end
  end

  describe "GET #edit" do
    context "where an admin is logged in" do
      let(:admin) { FactoryGirl.create(:admin) }

      before do
        fake_login_admin(admin)
      end

      context "where the api key exists" do
        render_views
        let!(:api_key) { FactoryGirl.create(:api_key, name: "api_key") }

        it "populates the form with the api key" 

      end

      context "where the api key can't be found" do
        it "raises an error" 

      end
    end
  end

  describe "POST #update" do
    context "where an admin is logged in" do
      let(:admin) { FactoryGirl.create(:admin) }

      before do
        fake_login_admin(admin)
      end

      context "where the api key exists" do
        let(:api_key) { FactoryGirl.create(:api_key) }
        let(:new_name) { "new_name" }
        let(:params) do
          {
            id: api_key.id,
            api_key: { name: new_name }
          }
        end

        context "where the update is successful" do
          it "updates the api key and redirects to index" 

        end

        context "where the update is unsuccessful" do
          before do
            allow_any_instance_of(ApiKey).to receive(:update_attributes).and_return(false)
          end

          it "shows the edit view" 

        end
      end

      context "where the api key doesn't exist" do
        it "raises an error" 

      end

      context "cancel_button is true" do
        let(:api_key_id) { 123 }
        let!(:api_key) { FactoryGirl.create(:api_key, id: api_key_id) }

        it "redirects to index" 

      end
    end
  end

  describe "POST #destroy" do
    context "where an admin is logged in" do
      let(:admin) { FactoryGirl.create(:admin) }

      before do
        fake_login_admin(admin)
      end

      context "where the api key exists" do
        let(:api_key_id) { 123 }
        let!(:api_key) { FactoryGirl.create(:api_key, id: api_key_id) }

        it "destroys the api key, then redirects to edit" 

      end

      context "where the api key doesn't exist" do
        it "raises an error" 

      end
    end
  end
end

