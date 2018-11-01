describe ObservationCreator do
  describe "#run" do
    it "creates a new observation for the user id and proposal id passed in" 


    context "with an adder but no reason" do
      it "sends an observer added email", :email do
        proposal = create(:proposal)
        observer = create(:user)
        adder = create(:user)

        expect {
          ObservationCreator.new(
            observer: observer,
            proposal_id: proposal.id,
            observer_adder: adder
          ).run
        }.to change { deliveries.length }.from(0).to(1)

      end

      it "does not add a comment" 

    end

    context "with a reason and an adder" do
      it "adds an update comment mentioning the reason" 


      it "sends a comment email", :email do
        proposal = create(:proposal)
        observer = create(:user)
        adder = create(:user)
        reason = "my mate, innit"

        expect {
          ObservationCreator.new(
            observer: observer,
            proposal_id: proposal.id,
            reason: reason,
            observer_adder: adder
          ).run
        }.to change { deliveries.length }.from(0).to(1)
      end
    end

    context "with an adder and no reason" do
      it "does not add a comment" 

    end
  end
end

