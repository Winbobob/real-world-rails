# encoding: UTF-8

require 'rails_helper'

describe 'rate limiter integration' do

  before do
    RateLimiter.enable
    RateLimiter.clear_all!
  end

  after do
    RateLimiter.disable
  end

  it "will clear the token cookie if invalid" 


  it 'can cleanly limit requests and sets a Retry-After header' 

end

