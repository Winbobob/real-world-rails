describe CancelationMailer, :email do

  describe "#cancelation_notification" do
    let(:proposal) { create(:proposal) }
    let(:user) { create(:user) }
    let(:mail) { CancelationMailer.cancelation_notification(
      recipient: user,
      canceler: user,
      proposal: proposal
    ) }

    it_behaves_like "a proposal email"

    it "includes the cancelation reason" 

  end

  describe "#cancelation_confirmation" do
    let(:proposal) { create(:proposal) }
    let(:user) { create(:user) }
    let(:mail) { CancelationMailer.cancelation_confirmation(
      canceler: user,
      proposal: proposal
    ) }

    it_behaves_like "a proposal email"

    it "includes the cancelation reason" 

  end

  describe "#fiscal_cancelation" do
    it "sends cancelation email for fiscal-year cleanup" 

  end
end

