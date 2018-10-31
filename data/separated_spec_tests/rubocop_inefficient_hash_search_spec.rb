# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::InefficientHashSearch do
  subject(:cop) { described_class.new(config) }

  shared_examples :correct_behavior do |expected|
    let(:expected_key_method) { expected == :short ? 'key?' : 'has_key?' }
    let(:expected_value_method) { expected == :short ? 'value?' : 'has_value?' }

    it 'registers an offense when a hash literal receives `keys.include?`' 


    it 'registers an offense when an existing hash receives `keys.include?`' 


    it 'registers an offense when a hash literal receives `values.include?`' 


    it 'registers an offense when a hash variable receives `values.include?`' 


    it 'finds no offense when a `keys` array variable receives `include?`' 


    it 'finds no offense when a `values` array variable receives `include?` ' 


    describe 'autocorrect' do
      context 'when using `keys.include?`' do
        it 'corrects to `key?` or `has_key?`' 


        it 'corrects when hash is not a literal' 


        it 'gracefully handles whitespace' 

      end

      context 'when using `values.include?`' do
        it 'corrects to `value?` or `has_value?`' 


        it 'corrects when hash is not a literal' 


        it 'gracefully handles whitespace' 

      end
    end
  end

  context 'when config is empty' do
    let(:config) { RuboCop::Config.new }

    it_behaves_like :correct_behavior, :short
  end

  context 'when config enforces short hash methods' do
    let(:config) do
      RuboCop::Config.new(
        'AllCops' => {
          'Style/PreferredHashMethods' => {
            'EnforcedStyle' => 'short', 'Enabled' => true
          }
        }
      )
    end

    it_behaves_like :correct_behavior, :short
  end

  context 'when config specifies long hash methods but is not enabled' do
    let(:config) do
      RuboCop::Config.new(
        'AllCops' => {
          'Style/PreferredHashMethods' => {
            'EnforcedStyle' => 'long', 'Enabled' => false
          }
        }
      )
    end

    it_behaves_like :correct_behavior, :short
  end

  context 'when config enforces long hash methods' do
    let(:config) do
      RuboCop::Config.new(
        'AllCops' => {
          'Style/PreferredHashMethods' => {
            'EnforcedStyle' => 'long', 'Enabled' => true
          }
        }
      )
    end

    it_behaves_like :correct_behavior, :long
  end
end

