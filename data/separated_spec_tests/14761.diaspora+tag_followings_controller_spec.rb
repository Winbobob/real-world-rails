# frozen_string_literal: true

describe TagFollowingsController, type: :controller do
  describe "#manage" do
    context "not signed in" do
      it "redirects html requests" 


      it "redirects mobile requests" 

    end
    context "signed in" do
      before do
        sign_in alice, scope: :user
      end

      it "redirects html requests" 


      it "does not redirect mobile requests" 

    end
  end
end

