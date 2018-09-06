# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PrecomputeFeedService, type: :service do
  subject { PrecomputeFeedService.new }

  describe 'call' do
    let(:account) { Fabricate(:account) }
    it 'fills a user timeline with statuses' 


    it 'does not raise an error even if it could not find any status' 


    it 'filters statuses' 

  end
end

