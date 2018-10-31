# frozen_string_literal: true

require 'rails_helper'

describe Pubsubhubbub::SubscribeService, type: :service do
  describe '#call' do
    subject { described_class.new }
    let(:user_account) { Fabricate(:account) }

    context 'with a nil account' do
      it 'returns the invalid topic status results' 

    end

    context 'with an invalid callback url' do
      it 'returns invalid callback status when callback is blank' 

      it 'returns invalid callback status when callback is not a URI' 

    end

    context 'with a blocked domain in the callback' do
      it 'returns callback not allowed' 

    end

    context 'with a valid account and callback' do
      it 'returns success status and confirms subscription' 

    end
  end

  def service_call(account: user_account, callback: 'https://callback.host', secret: 'asdf', lease_seconds: 3600)
    subject.call(account, callback, secret, lease_seconds)
  end

  def invalid_topic_status
    ['Invalid topic URL', 422]
  end

  def invalid_callback_status
    ['Invalid callback URL', 422]
  end

  def not_allowed_callback_status
    ['Callback URL not allowed', 403]
  end

  def success_status
    ['', 202]
  end
end

