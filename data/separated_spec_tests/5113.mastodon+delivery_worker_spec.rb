# frozen_string_literal: true

require 'rails_helper'

describe Pubsubhubbub::DeliveryWorker do
  include RoutingHelper
  subject { described_class.new }

  let(:payload) { 'test' }

  describe 'perform' do
    it 'raises when subscription does not exist' 


    it 'does not attempt to deliver when domain blocked' 


    it 'raises when request fails' 


    it 'updates subscriptions when delivery succeeds' 


    it 'updates subscription without a secret when delivery succeeds' 


    def stub_request_to_respond_with(subscription, code)
      stub_request(:post, 'http://example.com/callback')
        .with(body: payload, headers: expected_headers(subscription))
        .to_return(status: code, body: '', headers: {})
    end

    def expected_headers(subscription)
      {
        'Connection' => 'close',
        'Content-Type' => 'application/atom+xml',
        'Host' => 'example.com',
        'Link' => "<https://#{Rails.configuration.x.local_domain}/api/push>; rel=\"hub\", <https://#{Rails.configuration.x.local_domain}/users/#{subscription.account.username}.atom>; rel=\"self\"",
      }.tap do |basic|
        known_digest = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), subscription.secret.to_s, payload)
        basic.merge('X-Hub-Signature' => "sha1=#{known_digest}") if subscription.secret?
      end
    end
  end
end

