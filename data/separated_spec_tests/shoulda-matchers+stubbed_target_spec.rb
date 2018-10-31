require 'unit_spec_helper'

describe Shoulda::Matchers::Independent::DelegateMethodMatcher::StubbedTarget do
  subject(:target) { described_class.new(:stubbed_method) }

  describe '#has_received_method?' do
    it 'returns true when the method has been called on the target' 


    it 'returns false when the method has not been called on the target' 

  end

  describe '#has_received_arguments?' do
    context 'method is called with specified arguments' do
      it 'returns true' 

    end

    context 'method is not called with specified arguments' do
      it 'returns false' 

    end

    context 'method is called with arguments in incorrect order' do
      it 'returns false' 

    end
  end
end

