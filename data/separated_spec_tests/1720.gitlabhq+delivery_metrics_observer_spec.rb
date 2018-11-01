require 'spec_helper'

describe Gitlab::Email::Hook::DeliveryMetricsObserver do
  let(:email) do
    ActionMailer::Base.mail(to: 'test@example.com',
                            from: 'info@example.com',
                            body: 'hello')
  end

  context 'when email has been delivered' do
    it 'increments both email delivery metrics' 

  end

  context 'when email has not been delivered due to an error' do
    before do
      allow(email.delivery_method).to receive(:deliver!)
        .and_raise(StandardError, 'Some SMTP error')
    end

    it 'increments only delivery attempt metric' 

  end
end

