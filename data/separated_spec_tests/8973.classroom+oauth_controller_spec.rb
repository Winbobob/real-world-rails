# frozen_string_literal: true

require "rails_helper"

RSpec.describe OauthController, type: :controller do
  let(:user) { classroom_teacher }

  before do
    sign_in_as(user)
  end

  describe "GET #authorize", :vcr do
    before(:each) do
      Timecop.freeze
      get :authorize
    end

    it "redirects to x-github-classroom" 


    it "generates a code that is invalid in 5 minutes" 


    it "generates a code that has correct user id" 


    after(:each) do
      Timecop.return
    end
  end

  describe "GET #access_token", :vcr do
    before do
      sign_out
    end

    context "code param is present" do
      context "valid code param" do
        before do
          Timecop.freeze
          @code = user.api_token
        end

        it "returns access token that expires in 24 hours" 


        after do
          Timecop.return
        end
      end

      context "invalid code param" do
        before do
          @code = "invalid code"
        end

        it "returns not found" 

      end
    end

    context "code param is not present" do
      it "renders 404" 

    end
  end

  private

  def redirect_params
    Rack::Utils.parse_query(URI.parse(response.location).query)
  end

  def redirect_url_without_params
    url = URI.parse(response.location)
    "#{url.scheme}://#{url.host}"
  end
end

