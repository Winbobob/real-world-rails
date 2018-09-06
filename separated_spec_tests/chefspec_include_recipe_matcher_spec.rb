require 'spec_helper'

describe ChefSpec::Matchers::IncludeRecipeMatcher do
  let(:chef_run) { double('chef run', run_context: { loaded_recipes: %w(one two three) }) }
  subject { described_class.new('one::default') }

  describe '#failure_message' do
    it 'has the right value' 

  end

  describe '#failure_message_when_negated' do
    it 'has the right value' 

  end

  describe '#description' do
    it 'has the right value' 

  end

  it 'matches when the recipe is included' 


  it 'does not match when the recipe is not included' 

end

