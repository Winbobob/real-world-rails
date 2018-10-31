require 'rails_helper'
require_dependency 'jobs/base'

describe Jobs::Heartbeat do
  after do
    Discourse.disable_readonly_mode
  end

  it "still enqueues heartbeats in readonly mode" 

end

