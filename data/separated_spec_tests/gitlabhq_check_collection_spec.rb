require 'spec_helper'

describe Gitlab::CrossProjectAccess::CheckCollection do
  subject(:collection) { described_class.new }

  describe '#add_collection' do
    it 'merges the checks of 2 collections' 

  end

  describe '#should_run?' do
    def fake_check(run, skip)
      check = double("Check: run=#{run} - skip={skip}")
      allow(check).to receive(:should_run?).and_return(run)
      allow(check).to receive(:should_skip?).and_return(skip)
      allow(check).to receive(:skip).and_return(skip)

      check
    end

    it 'returns true if one of the check says it should run' 


    it 'returns false if one of the check says it should be skipped' 

  end
end

