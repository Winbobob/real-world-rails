# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Force do
  subject(:force) { described_class.new(cops) }

  let(:cops) { [double('cop1'), double('cop2')] }

  describe '.force_name' do
    it 'returns the class name without namespace' 

  end

  describe '#run_hook' do
    it 'invokes a hook in all cops' 


    it 'does not invoke a hook if the cop does not respond to the hook' 

  end
end

