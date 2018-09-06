require 'rails_helper'

describe UserSession do
  describe '#create' do
    it 'bootstraps using User object' 


    it 'persists cdx_token' 

  end

  describe '#cdx' do
    it 'merges multiple responses' 


    it '#signature_response' 

  end

  describe '#new' do
    it 'finds user via token' 

  end

  describe '#get + #set' do
    it 'persists arbitrary values' 


    it 'sets multiple, gets singular' 

  end

  describe '#expire' do
    it 'zaps the session from the store' 


    it 'respects class-level ttl' 

  end

  describe '#touch' do
    it 'resets the updated_at value' 

  end

  def expect_redis_to_have_key(key)
    expect(UserSession.redis.get(key)).to_not be_nil
  end
end

