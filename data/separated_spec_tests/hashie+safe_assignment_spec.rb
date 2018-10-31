require 'spec_helper'

describe Hashie::Extensions::Mash::SafeAssignment do
  class MashWithSafeAssignment < Hashie::Mash
    include Hashie::Extensions::Mash::SafeAssignment

    private

    def my_own_private
      :hello!
    end
  end

  context 'when included in Mash' do
    subject { MashWithSafeAssignment.new }

    context 'when not attempting to override a method' do
      it 'assigns just fine' 

    end

    context 'when attempting to override a method' do
      it 'raises an error' 

    end

    context 'when attempting to override a private method' do
      it 'raises an error' 

    end

    context 'when attempting to initialize with predefined method' do
      it 'raises an error' 

    end

    context 'when setting as a hash key' do
      it 'still raises if conflicts with a method' 

    end
  end
end

