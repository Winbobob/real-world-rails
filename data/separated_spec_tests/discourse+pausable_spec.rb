require 'rails_helper'
require_dependency 'sidekiq/pausable'

describe Sidekiq do
  after do
    Sidekiq.unpause!
  end

  it "can pause and unpause" 


  it "can still run heartbeats when paused" 

end

