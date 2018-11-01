require 'spec_helper'

class MockOperation
  def self.mock_calculation(arg1 = 1, arg2 = 2)
    arg1 + arg2
  end

  def self.mock_calculation2(arg1 = 2, arg2 = 3)
    arg1 + arg2
  end
end

class CachedMockOperation
  include Genome::Extensions::HasCacheableQuery
  cache_query :mock_calculation, 'cached_mock'
  cache_query :mock_calculation2, 'cached_mock2'
  def self.mock_calculation(arg1 = 1, arg2 = 2)
    arg1 + arg2
  end

  def self.mock_calculation2(arg1 = 2, arg2 = 3)
    arg1 + arg2
  end
end

class UnorderedMockOperation
  include Genome::Extensions::HasCacheableQuery
  def self.mock_calculation(arg1 = 1, arg2 = 2)
    arg1 + arg2
  end
  cache_query :mock_calculation, 'unordered_cached_mock'
end

describe 'HasCacheableQuery concern' do

  before :each do
    Rails.cache.clear
    @cached = CachedMockOperation
    @uncached = MockOperation
    @unordered = UnorderedMockOperation
  end

  it 'should define a method called cache_query on the class it is mixed in to' 


  it 'should produce the same result as a method that is not cached' 


  it 'should cache the result of the query' 


  it 'should cache results differently given different argument lists' 


  it 'should cache different methods with different keys when given them' 


  it 'should work regardless of the order of method definition vs the cache_query call' 

end

