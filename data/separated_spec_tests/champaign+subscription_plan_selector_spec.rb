# frozen_string_literal: true

require 'rails_helper'

module PaymentProcessor
  module Braintree
    describe SubscriptionPlanSelector do
      before do
        stub_const('PaymentProcessor::Clients::Braintree::SubscriptionPlanSelector::SUBSCRIPTION_PLANS', EUR: 'EUR')
      end

      subject { described_class }

      describe '.for_currency' do
        context 'unmatched currency' do
          it 'raises' 

        end

        context 'matched currency' do
          it 'returns merchant account ID' 

        end
      end
    end
  end
end

