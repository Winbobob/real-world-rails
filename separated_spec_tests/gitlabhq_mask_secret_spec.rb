require 'spec_helper'

describe Gitlab::Ci::MaskSecret do
  subject { described_class }

  describe '#mask' do
    it 'masks exact number of characters' 


    it 'masks multiple occurrences' 


    it 'does not mask if not found' 


    it 'does support null token' 


    def mask(value, token)
      subject.mask!(value.dup, token)
    end
  end
end

