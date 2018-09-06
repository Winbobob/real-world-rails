# frozen_string_literal: true

require 'rails_helper'

describe ContactFormController, type: :controller do
  routes { Sufia::Engine.routes }

  let(:parameters) do
    {
      'category' => 'General inquiry or request',
      'name' => 'Jane Doe',
      'email' => 'jzd123@psu.edu',
      'subject' => 'Test subject',
      'message' => 'Test message'
    }
  end

  context 'when ReCaptcha is enabled' do
    before { Recaptcha.configuration.skip_verify_env.delete('test') }

    after  { Recaptcha.configuration.skip_verify_env.push('test') }

    # rubocop:disable Rails/HttpPositionalArguments
    it 'prevents the message from being sent' 

    # rubocop:enable Rails/HttpPositionalArguments
  end

  context 'when ReCaptcha is not enabled' do
    let(:mock_mailer) { instance_double('ActionMailer::MessageDelivery') }

    # rubocop:disable Rails/HttpPositionalArguments
    it 'sends the message' 

    # rubocop:enable Rails/HttpPositionalArguments
  end
end

