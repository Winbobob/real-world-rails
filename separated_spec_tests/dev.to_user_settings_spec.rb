require "rails_helper"

RSpec.describe "UserSettings", type: :request do
  let(:user) { create(:user) }

  describe "GET /settings/:tab" do
    context "when not signed-in" do
      it "returns not_foudn" 

    end

    context "when signed-in" do
      before do
        login_as user
      end

      it "renders various settings tabs properly" 


      it "doesn't let user access membership if user has no monthly_dues" 


      it "allows user with monthly_dues to access membership" 

    end
  end

  describe "PUT /update/:id" do
    before do
      login_as user
    end

    it "updates summary" 


    it "updates username to too short username" 

  end
end

