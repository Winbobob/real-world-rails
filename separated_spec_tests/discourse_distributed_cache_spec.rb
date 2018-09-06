require 'rails_helper'
require 'distributed_cache'

describe DistributedCache do

  before :all do
    @bus = MessageBus::Instance.new
    @bus.configure(backend: :memory)
    @manager = DistributedCache::Manager.new(@bus)
  end

  after :all do
    @bus.destroy
  end

  def cache(name)
    DistributedCache.new(name, manager: @manager)
  end

  let! :cache1 do
    cache("test")
  end

  let! :cache2 do
    cache("test")
  end

  it 'allows us to store Set' 


  it 'does not leak state across caches' 


  it 'allows coerces symbol keys to strings' 


  it 'sets other caches' 


  it 'deletes from other caches' 


  it 'clears cache on request' 


end

