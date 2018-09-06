require 'spec_helper'

describe Gitlab::ActionRateLimiter do
  let(:redis) { double('redis') }
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:key) { [user, project] }
  let(:cache_key) { "action_rate_limiter:test_action:user:#{user.id}:project:#{project.id}" }

  subject { described_class.new(action: :test_action, expiry_time: 100) }

  before do
    allow(Gitlab::Redis::Cache).to receive(:with).and_yield(redis)
  end

  it 'increases the throttle count and sets the expire time' 


  it 'returns true if the key is throttled' 

end

