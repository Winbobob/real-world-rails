require "rails_helper"

RSpec.describe PaymentMailer, type: :mailer do
  describe "delinquent" do
    let(:user) { User.new(email: "to@example.org") }
    let(:mail) { PaymentMailer.delinquent(user) }

    it "emails asking to reactivate" 

  end
end

