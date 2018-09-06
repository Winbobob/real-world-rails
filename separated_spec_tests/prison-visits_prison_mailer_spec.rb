require 'rails_helper'

RSpec.describe PrisonMailer do
  before :each do
    ActionMailer::Base.deliveries.clear
    allow_any_instance_of(PrisonMailer).to receive(:smtp_domain).and_return('example.com')
  end

  let :email do
    ParsedEmail.parse({
        from: "nonexistent@hmps.gsi.gov.uk",
        to: 'test@example.com',
        text: "some text",
        charsets: {to: "UTF-8", html: "utf-8", subject: "UTF-8", from: "UTF-8", text: "utf-8"}.to_json,
        subject: "important email"
    })
  end

  it_behaves_like 'a mailer that ensures content transfer encoding is quoted printable'

  it "relays e-mails via GSI" 


  it "delivers an automated response" 


  let! :subject do
    PrisonMailer
  end

  let :confirmation_with_slot do
    Confirmation.new(message: 'A message', outcome: 'slot_0', vo_number: '1234567')
  end

  let :confirmation_without_slot do
    Confirmation.new(message: 'A message', outcome: Confirmation::NO_SLOT_AVAILABLE)
  end

  let :confirmation_not_on_contact_list do
    Confirmation.new(message: 'A message', outcome: Confirmation::NOT_ON_CONTACT_LIST)
  end

  let :confirmation_no_vos_left do
    Confirmation.new(message: 'A message', outcome: Confirmation::NO_VOS_LEFT)
  end

  context 'first visitor has smoke test details' do
    let(:smoke_test_email) { 'smoke-tests@example.com' }

    let(:smoke_test_visit) do
      sample_visit.tap do |visit|
        visit.visitors.first.email = smoke_test_email
      end
    end

    before do
      allow_any_instance_of(MailUtilities::SmokeTestEmailCheck).
        to receive(:matches?).and_return true
    end

    it 'alters the mail settings to not send to the prison' 

  end

  context "always" do
    it "sends an e-mail with the prisoner name in the subject" 


    it "sends an e-mail with a long link to the confirmation page" 


    it "sends a booking receipt to a prison to create an audit trail" 


    it "sends an e-mail to rochester functional mailbox" 


    it "sends an cancellation notification to a prison so it can be removed from NOMIS" 


    it "sends an e-mail with a link over https" 


    it "uses its own configuration (GSI)" 

  end
end

