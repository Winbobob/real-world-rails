require 'active_record'
require 'support/api_constraints_spec_helper'
require_relative '../../lib/api_constraints'

describe ApiConstraints do
  let(:request) { double :request }

  describe '#matches?' do
    it 'matches requests including the versioned vendor mime type' 


    it 'matches requests for other specified versions' 


    it 'matches requests in the wrong format' 

  end
end

