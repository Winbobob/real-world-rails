require 'spec_helper'

describe Gitlab::CrossProjectAccess do
  let(:super_class) { Class.new }
  let(:descendant_class) { Class.new(super_class) }
  let(:current_instance) { described_class.new }

  before do
    allow(described_class).to receive(:instance).and_return(current_instance)
  end

  describe '#add_check' do
    it 'keeps track of the properties to check' 


    it 'builds the check correctly' 


    it 'merges the checks of a parent class into existing checks of a subclass' 


    it 'merges the existing checks of a superclass into the checks of a subclass' 

  end

  describe '#find_check' do
    it 'returns a check when it was defined for a superclass' 


    it 'caches the result for a subclass' 


    it 'returns the checks for the closest class if there are more checks available' 

  end
end

