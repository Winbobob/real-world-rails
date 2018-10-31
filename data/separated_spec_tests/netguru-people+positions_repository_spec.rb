require 'spec_helper'

describe PositionsRepository do
  subject { described_class }

  describe '#primary' do
    let!(:primary_positions) { create_list(:position, 3, :primary) }
    let!(:positions) { create_list(:position, 5) }

    it 'returns only positions with primary set to true' 


    it 'returns no data when no primary positions' 

  end
end

