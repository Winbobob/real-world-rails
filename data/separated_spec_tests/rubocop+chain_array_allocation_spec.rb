# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::ChainArrayAllocation, :config do
  subject(:cop) { described_class.new(config) }

  def generate_message(method_one, method_two)
    "Use `#{method_one}...#{method_two}!` instead of `#{method_one}"\
    "...#{method_two}`."
  end

  shared_examples 'map_and_flat' do |method, method_two|
    it "registers an offense when calling #{method}...#{method_two}" 

  end

  describe 'configured to only warn when flattening one level' do
    it_behaves_like('map_and_flat', 'map', 'flatten')
  end

  describe 'Methods that require an argument' do
    it 'first' 

  end

  describe 'methods that only return an array with no block' do
    it 'zip' 

  end
end

