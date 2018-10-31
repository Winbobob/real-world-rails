require "rails_helper"

vcr_option = {
  cassette_name: "google_api_request_spec"
}

RSpec.describe "Analytics", type: :request, vcr: vcr_option do
  describe "GET /analytics" do
    context "when signed in as an authorized user" do
      let(:user)                { create(:user, :analytics) }
      let(:article1)            { create(:article, user_id: user.id) }
      let(:article2)            { create(:article, user_id: user.id) }
      let(:ga_double)           { instance_double(GoogleAnalytics) }

      before do
        allow(GoogleAnalytics).to receive(:new).and_return(ga_double)
        allow(ga_double).to receive(:create_service_account_credential).and_return({})
        allow(ga_double).to receive(:get_pageviews) do
          { article1.id.to_s => "0", article2.id.to_s => "0" }
        end
        login_as user
      end

      it "raise ParameterMissing if no proper params is given" 


      it "returns pageviews" 


      it "returns pageviews for super_admins" 


      it "updates article view counts" 

    end
  end
end

