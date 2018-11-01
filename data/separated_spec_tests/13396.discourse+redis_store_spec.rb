require 'rails_helper'
require 'cache'

describe "Redis Store" do

  let :cache do
    Cache.new(namespace: 'foo')
  end

  let :store do
    DiscourseRedis.new_redis_store
  end

  before(:each) do
    cache.redis.del "key"
    store.delete "key"
  end

  it "can store stuff" 


  it "doesn't collide with our Cache" 


  it "can be cleared without clearing our cache" 


end

