require 'spec_helper'

describe Gitlab::Lazy do
  let(:dummy) { double(:dummy) }

  context 'when not calling any methods' do
    it 'does not call the supplied block' 

  end

  context 'when calling a method on the object' do
    it 'lazy loads the value returned by the block' 

  end

  describe '#respond_to?' do
    it 'returns true for a method defined on the wrapped object' 


    it 'returns false for a method not defined on the wrapped object' 

  end
end

