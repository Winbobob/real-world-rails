# frozen_string_literal: true

describe InvitationCodesController, type: :controller do
  describe "#show" do
    it "redirects to the root page if the invitation code is invalid" 


    context "valid invitation code" do
      let(:invitation_token) { alice.invitation_code.token }

      it "redirects logged out users to the sign in page" 


      it "redirects logged in users the the inviters page" 

    end
  end
end

