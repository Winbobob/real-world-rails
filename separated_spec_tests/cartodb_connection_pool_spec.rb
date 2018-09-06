require_relative '../../spec_helper'

describe CartoDB::ConnectionPool do
  before(:all) do
    @max_pool_size = ConnectionPool::MAX_POOL_SIZE
    ConnectionPool::MAX_POOL_SIZE = 2
  end

  after(:all) do
    ConnectionPool::MAX_POOL_SIZE = @max_pool_size
  end

  before(:each) do
    # Need to close the connections because there might be more than the new maximum already in the pool
    $pool.close_connections!
  end

  after(:each) do
    @users.map(&:destroy) if @users
  end

  def database_object_count
    GC.start
    ObjectSpace.each_object(Sequel::Postgres::Database).count
  end

  def user_object_count
    GC.start
    ObjectSpace.each_object(User).count
  end

  def pool_contains?(connection)
    $pool.all.values.map { |a| a[:connection] }.include?(connection)
  end

  describe '#eviction_policy' do
    it 'evicts older connection (LRU)' 

  end

  describe '#user_databases' do
    it 'does not leak user databases' 

  end
end

