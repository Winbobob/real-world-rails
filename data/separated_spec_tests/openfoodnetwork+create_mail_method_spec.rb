require 'spec_helper'

describe CreateMailMethod do
  describe '#call' do
    let(:mail_method) { Spree::MailMethod.create(environment: 'test') }
    let(:mail_settings) { instance_double(Spree::Core::MailSettings) }
    let(:attributes) do
      { preferred_smtp_username: "smtp_username", environment: "test" }
    end

    before do
      allow(Spree::MailMethod)
        .to receive(:create).with(environment: 'test').and_return(mail_method)
      allow(Spree::Core::MailSettings).to receive(:init) { mail_settings }
    end

    context 'unit' do
      before do
        allow(mail_method).to receive(:update_attributes).with(attributes)
      end

      it 'creates a new MailMethod' 


      it 'updates the MailMethod' 


      it 'initializes the mail settings' 

    end

    context 'integration' do
      it 'updates the mail method attributes' 

    end
  end
end

