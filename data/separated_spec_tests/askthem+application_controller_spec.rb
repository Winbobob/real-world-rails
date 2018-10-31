require "spec_helper"

describe ApplicationController do
  describe "#staff_member?" do
    context "when not a signed in user" do
      it "returns false" 

    end

    context "when a signed in user" do
      before :each do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      it "returns false when does not have staff member role" 


      context "when user has staff_member role" do
        before do
          @user.add_role :staff_member
        end

        it "returns true" 

      end
    end
  end
end

