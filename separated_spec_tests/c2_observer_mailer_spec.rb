describe ObserverMailer, :email do
  include MailerSpecHelper

  describe "#observer_added_notification" do
    it "sends to the observer" 


    it "excludes who they were added by, if not available" 


    it "includes the reason, if there is one" 


    it "does not include reason text if there is not one" 

  end

  describe "#observer_removed_notification" do
    it "sends to the observer" 

  end

  describe "#proposal_complete" do
    let(:mail) { ObserverMailer.proposal_complete(observer, proposal) }

    it_behaves_like "a proposal email"
  end

  private

  def proposal
    @proposal ||= create(:proposal)
  end

  def observer
    @observer ||= create(:observation).user
  end
end

