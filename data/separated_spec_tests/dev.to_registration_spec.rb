require "rails_helper"

RSpec.describe "Registrations", type: :request do
  let(:user) { create(:user) }

  describe "GET /enter" do
    context "when not logged in" do
      it "shows the sign in page" 

    end

    context "when logged in" do
      it "redirects to /dashboard" 

    end
  end
end

