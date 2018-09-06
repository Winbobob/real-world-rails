# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::EmptyExampleGroup, :config do
  subject(:cop) { described_class.new(config) }

  it 'flags an empty context' 


  it 'flags an empty top level describe' 


  it 'does not flag include_examples' 


  it 'does not flag methods matching example group names' 
        it 'yields a block when given' 

      end
    RUBY
  end

  it 'does not recognize custom include methods by default' 


  context 'when a custom include method is specified' do
    let(:cop_config) do
      { 'CustomIncludeMethods' => %w[it_has_special_behavior] }
    end

    it 'does not flag an otherwise empty example group' 

  end
end

