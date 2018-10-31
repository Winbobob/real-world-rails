require 'spec_helper'

describe ChargeNotificationMailer do
  describe 'send_receipt' do
    subject { ActionMailer::Base.deliveries.last }

    let(:customer) { create(:customer) }
    let(:organization) { create(:organization, thank_you_text: "Thank yew") }
    let!(:charge) { create(:charge, customer: customer, organization: organization)}

    before do
      ChargeNotificationMailer.send_receipt(charge.id).deliver_now
    end

    it 'should send the email' 


    it 'should give the thank you text and other useful info' 


    context 'with a contact_email' do
      let(:organization) { create(:organization, contact_email: 'foo@bar.com') }

      it 'should send from the contact email' 

    end
  end
end

