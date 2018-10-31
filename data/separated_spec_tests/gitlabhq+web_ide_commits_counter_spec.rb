# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::WebIdeCommitsCounter, :clean_gitlab_redis_shared_state do
  describe '.increment' do
    it 'increments the web ide commits counter by 1' 

  end

  describe '.total_count' do
    it 'returns the total amount of web ide commits' 

  end
end

