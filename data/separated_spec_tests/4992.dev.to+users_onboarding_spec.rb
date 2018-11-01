require "rails_helper"

RSpec.describe "UsersOnboarding", type: :request do
  let(:user) { create(:user, saw_onboarding: false) }

  before do
    login_as user
  end

  describe "PATCH /onboarding_update" do
    it "updates saw_onboarding boolean" 

  end
end

