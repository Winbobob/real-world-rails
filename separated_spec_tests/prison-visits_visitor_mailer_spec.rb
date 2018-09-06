require 'rails_helper'

RSpec.describe VisitorMailer do
  subject! { described_class }

  before do
    ActionMailer::Base.deliveries.clear
    allow_any_instance_of(VisitorMailer).to receive(:smtp_domain).and_return('example.com')
    Prison.find('Rochester').lead_days = 0
  end

  around do |example|
    Timecop.freeze(Time.zone.local(2013, 7, 4)) do
      example.run
    end
  end

  let(:email) {
    ParsedEmail.parse(
      from: "visitor@example.com",
      to: 'test@example.com',
      text: "some text",
      charsets: { to: "UTF-8", html: "utf-8", subject: "UTF-8", from: "UTF-8", text: "utf-8" }.to_json,
      subject: "important email"
    )
  }

  let :confirmation do
    Confirmation.new(message: 'A message', outcome: 'slot_0')
  end

  let :confirmation_canned_response do
    Confirmation.new(outcome: 'slot_0', vo_number: '5551234')
  end

  let :confirmation_canned_response_remand do
    Confirmation.new(outcome: 'slot_0', vo_number: 'none')
  end

  let :confirmation_unlisted_visitors do
    Confirmation.new(vo_number: '5551234', outcome: 'slot_0', visitor_not_listed: true, unlisted_visitors: ['Joan;Harris'])
  end

  let :confirmation_banned_visitors do
    Confirmation.new(vo_number: '5551234', outcome: 'slot_0', visitor_banned: true, banned_visitors: ['Joan;Harris'])
  end

  let :confirmation_closed_visit do
    Confirmation.new(vo_number: '5551234', outcome: 'slot_0', closed_visit: true)
  end

  let :confirmation_no_slot_available do
    Confirmation.new(message: 'A message', outcome: Confirmation::NO_SLOT_AVAILABLE)
  end

  let :confirmation_not_on_contact_list do
    Confirmation.new(message: 'A message', outcome: Confirmation::NOT_ON_CONTACT_LIST)
  end

  let :rejection_prisoner_incorrect do
    Confirmation.new(outcome: Confirmation::PRISONER_INCORRECT)
  end

  let :rejection_prisoner_not_present do
    Confirmation.new(outcome: Confirmation::PRISONER_NOT_PRESENT)
  end

  let :rejection_prisoner_no_allowance do
    Confirmation.new(outcome: Confirmation::NO_ALLOWANCE)
  end

  let :rejection_prisoner_no_allowance_vo_renew do
    Confirmation.new(outcome: Confirmation::NO_ALLOWANCE, no_vo: true, renew_vo: '2014-11-29')
  end

  let :rejection_prisoner_no_allowance_pvo_renew do
    Confirmation.new(outcome: Confirmation::NO_ALLOWANCE, no_vo: true, renew_vo: '2014-11-29', no_pvo: true, renew_pvo: '2014-11-17')
  end

  let :rejection_visitor_not_listed do
    Confirmation.new(visitor_not_listed: true, unlisted_visitors: ['Joan;Harris'])
  end

  let :rejection_visitor_banned do
    Confirmation.new(visitor_banned: true, banned_visitors: ['Joan;Harris'])
  end

  let(:confirmation_no_vos_left) { Confirmation.new(message: 'A message', outcome: Confirmation::NO_VOS_LEFT) }
  let(:noreply_address) { Mail::Field.new('from', "Prison Visits Booking <no-reply@example.com> (Unattended)") }
  let(:visitor_address) { Mail::Field.new('to', "Mark Harris <visitor@example.com>") }
  let(:prison_email) { 'pvb.RCI@maildrop.dsd.io' }
  let(:prison_address) { Mail::Field.new('reply-to', prison_email) }
  let(:token) { MESSAGE_ENCRYPTOR.encrypt_and_sign(sample_visit) }

  it_behaves_like 'a mailer that ensures content transfer encoding is quoted printable'

  it "relays e-mails via sendgrid" 


  it "delivers an automated response" 


  shared_examples 'an email without spam and bounce reset checks' do
    it 'makes no attempt at resets' 

  end

  context "when booking is successful" do
    it_behaves_like 'an email without spam and bounce reset checks' do
      let(:email) { subject.booking_confirmation_email(sample_visit, confirmation, token) }
    end

    it "sends out an e-mail with a reference number" 


    it "sends out an e-mail with no reference number for remand prisoners" 


    it "sends out an e-mail with the list of visitors not on the approved visitor list" 


    it "sends out an e-mail with the list of banned visitors" 


    it "sends out an e-mail notifying visitors that it is a closed visit" 


    it "sends out an e-mail with the List-Unsubscribe header set" 

  end

  context "sends out an unsuccessful e-mail with a date in the subject" do
    it_behaves_like 'an email without spam and bounce reset checks' do
      let(:email) { subject.booking_rejection_email(sample_visit, confirmation_no_slot_available) }
    end

    it "because of a slot not being available" 


    it "because of a visitor not being on a contact list (legacy)" 


    it "because the prisoner details are incorrect" 


    it "because the prisoner is not at the prison" 


    it "because the prisoner has no allowance" 


    it "because the prisoner has no allowance and a VO renewal date is specified" 


    it "because the prisoner has no allowance and a PVO renewal date is specified" 


    it "because a visitor is not on the list (canned response)" 


    it "because a visitor is banned" 

  end

  context "booking receipt is sent" do
    before do
      # TODO: I dislike this as a solution, but seem unable to persist any changes to
      # Prison#lead_days when it is being accessed via the Visit model (at the time of
      # writing, Prison is a Virtus model.
      allow_any_instance_of(PrisonSchedule).to receive(:days_lead_time).
        and_return(double('days', zero?: true))
    end

    it "attempts spam and bounce resets" 


    it "with a date in the subject" 

  end

  it "sends an e-mail to the person who requested a booking" 

end

