# frozen_string_literal: true

require 'rails_helper'

describe Pubsubhubbub::UnsubscribeService, type: :service do
  describe '#call' do
    subject { described_class.new }

    context 'with a nil account' do
      it 'returns an invalid topic status' 

    end

    context 'with a valid account' do
      let(:account) { Fabricate(:account) }

      it 'returns a valid topic status and does not run confirm when no subscription' 


      it 'returns a valid topic status and does run confirm when there is a subscription' 

    end

    def invalid_topic_status
      ['Invalid topic URL', 422]
    end

    def valid_topic_status
      ['', 202]
    end
  end
end

