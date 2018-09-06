describe CommentsController do
  describe "permission checking" do
    let(:proposal) { create(:proposal, :with_parallel_approvers, :with_observers) }
    let(:params) do
      { proposal_id: proposal.id, comment: { comment_text: "Some comment" } }
    end

    context "requester comments" do
      it "allows the requester to comment" 


      it "sends a comment email to approvers and observers", :email do
        login_as(proposal.requester)

        expect do
          post :create, params
        end.to change { deliveries.length }.from(0).to(4)
      end
    end

    context "comment fails to save" do
      it "shows a helpful error messsage" 

    end

    it "allows an approver to comment" 


    it "allows an observer to comment" 


    it "allows a delegate to comment and adds delegate as observer" 


    it "does not allow others to comment" 

  end
end

