describe "proposals" do
  include EnvVarSpecHelper
  include ReturnToHelper

  describe "DISABLE_CLIENT_SLUGS" do
    it "disallows any request for disabled client_slug" 

  end

  describe "GET /proposals/:id" do
    it "can be viewed by a delegate" 

  end

  describe "POST /proposals/:id/complete" do
    def expect_status(proposal, status, app_status)
      proposal.reload
      proposal.steps.each do |approval|
        expect(approval.status).to eq(app_status)
      end
      expect(proposal.status).to eq(status)
    end

    it "fails if not signed in" 


    it "fails if user is not involved with the request" 


    it "succeeds as a delegate" 


    context "signed in as the approver" do
      let(:proposal) { create(:proposal, :with_approver) }
      let(:approver) { proposal.approvers.first }

      before do
        login_as(approver)
      end

      it "updates the status of the Proposal" 


      describe "version number" do
        it "works if the version matches" 


        it "fails if the versions don't match" 

      end
    end

    context "using a token" do
      let(:proposal) { create(:proposal, :with_approver) }
      let(:step) { proposal.individual_steps.first }
      let(:token) { create(:api_token, step: step) }

      it "supports token auth" 


      it "marks the token as used" 


      it "fails for delegate without login, redirects automatically after login" 

    end
  end
end

