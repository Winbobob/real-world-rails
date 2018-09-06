require 'spec_helper'

describe Gitlab::GithubImport::Caching, :clean_gitlab_redis_cache do
  describe '.read' do
    it 'reads a value from the cache' 


    it 'returns nil if the cache key does not exist' 


    it 'refreshes the cache key if a value is present' 


    it 'does not refresh the cache key if a value is empty' 

  end

  describe '.read_integer' do
    it 'returns an Integer' 


    it 'returns nil if no value was found' 

  end

  describe '.write' do
    it 'writes a value to the cache and returns the written value' 

  end

  describe '.set_add' do
    it 'adds a value to a set' 

  end

  describe '.set_includes?' do
    it 'returns false when the key does not exist' 


    it 'returns false when the value is not present in the set' 


    it 'returns true when the set includes the given value' 

  end

  describe '.write_multiple' do
    it 'sets multiple keys' 

  end

  describe '.expire' do
    it 'sets the expiration time of a key' 

  end
end

