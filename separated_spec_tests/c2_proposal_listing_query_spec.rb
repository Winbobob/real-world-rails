describe ProposalListingQuery do
  let(:params) { ActionController::Parameters.new }
  let(:user) { create(:user) }

  describe "when the user is a requester" do
    [:pending, :completed, :canceled].each do |status|
      describe "##{status}" do
        it "ignores app admin role and only returns the user's Proposals" 


        context "with an arbitrary client" do
          before do
            user.update_attribute(:client_slug, "ncr")
            user.add_role('client_admin')
          end

          it "ignores client_admin role and only displays the user's Proposals" 

        end
      end
    end
  end

  describe "#pending_review" do
    context "when the user is an approver" do
      context "and the current waiting step lists you as user" do
        it "returns the proposal" 

      end

      context "and you have already completed the proposal, but it is not complete" do
        it "does not return the proposal" 

      end

      context "and the step listing you as user is not the current waiting step" do
        it "does not return the proposal" 

      end
    end

    context "when the user is a purchaser" do
      context "and the current waiting step lists you as purchaser" do
        it "returns the proposal" 

      end
    end
  end
end

