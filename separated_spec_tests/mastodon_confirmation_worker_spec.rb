# frozen_string_literal: true

require 'rails_helper'

describe Pubsubhubbub::ConfirmationWorker do
  include RoutingHelper

  subject { described_class.new }

  let!(:alice) { Fabricate(:account, username: 'alice') }
  let!(:subscription) { Fabricate(:subscription, account: alice, callback_url: 'http://example.com/api', confirmed: false, expires_at: 3.days.from_now, secret: nil) }

  describe 'perform' do
    describe 'with subscribe mode' do
      it 'confirms and updates subscription when challenge matches' 


      it 'does not update subscription when challenge does not match' 

    end

    describe 'with unsubscribe mode' do
      it 'confirms and destroys subscription when challenge matches' 


      it 'does not destroy subscription when challenge does not match' 

    end
  end

  def url_for_mode(mode)
    "http://example.com/api?hub.challenge=#{challenge_value}&hub.lease_seconds=863999&hub.mode=#{mode}&hub.topic=https://#{Rails.configuration.x.local_domain}/users/alice.atom"
  end

  def stub_random_value
    allow(SecureRandom).to receive(:hex).and_return(challenge_value)
  end

  def challenge_value
    '1a2s3d4f'
  end

  def http_headers
    { 'Connection' => 'close', 'Host' => 'example.com' }
  end
end

