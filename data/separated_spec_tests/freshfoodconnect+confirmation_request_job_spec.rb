require "rails_helper"

describe ConfirmationRequestJob do
  describe ".perform_now" do
    context "when the Donation has not yet been requested" do
      it "sends a confirmation request email" 

    end

    context "when the Donation has already been requested" do
      it "does nothing" 

    end
  end

  def stub_confirmation_mailer(donation:)
    mail = double(deliver_now: true)

    allow(DonationsMailer).
      to receive(:request_confirmation).
      with(donation: donation).
      and_return(mail)

    mail
  end
end

