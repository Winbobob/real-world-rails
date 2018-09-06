describe ObservationsController do
  describe "#create" do
    let (:proposal) { create(:proposal) }

    it "requires an email address" 


    it "gracefully warns on duplicates" 

  end

  describe "#destroy" do
    let (:proposal) { create(:proposal, :with_observers) }
    let (:observation) { proposal.observations.first }

    it "redirect with a notice when successful" 


    it "responds with a warning if unsuccessful" 

  end
end

