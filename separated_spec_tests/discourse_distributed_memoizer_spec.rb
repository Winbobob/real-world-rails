require 'rails_helper'
require_dependency 'distributed_memoizer'

describe DistributedMemoizer do

  before do
    $redis.del(DistributedMemoizer.redis_key("hello"))
    $redis.del(DistributedMemoizer.redis_lock_key("hello"))
    $redis.unwatch
  end

  # NOTE we could use a mock redis here, but I think it makes sense to test the real thing
  # let(:mock_redis) { MockRedis.new }

  def memoize(&block)
    DistributedMemoizer.memoize("hello", duration = 120, &block)
  end

  it "returns the value of a block" 


  it "return the old value once memoized" 


  it "memoizes correctly when used concurrently" 


end

