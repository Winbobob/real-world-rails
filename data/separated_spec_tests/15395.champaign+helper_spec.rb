# frozen_string_literal: true

require 'rails_helper'

describe PaymentProcessor::GoCardless::Helper do
  describe '.next_available_date' do
    subject { PaymentProcessor::GoCardless::Helper }

    context 'day has not passed' do
      it 'returns current month' 

    end

    context 'day is today' do
      it 'returns with following month' 

    end

    context 'day has passed' do
      it 'returns with following month' 

    end

    context 'invalid day' do
      it 'raises argument error' 

    end
  end
end

