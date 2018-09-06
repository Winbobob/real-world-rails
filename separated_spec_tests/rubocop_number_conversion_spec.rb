# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::NumberConversion do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  context 'registers an offense' do
    it 'when using `#to_i`' 


    it 'when using `#to_i` for integer' 


    it 'when using `#to_f`' 


    it 'when using `#to_c`' 


    it 'when `#to_i` called on a variable' 


    it 'when `#to_i` called on a hash value' 


    it 'when `#to_i` called on a variable on a array' 

  end

  context 'does not register an offense' do
    it 'when using Integer() with integer' 


    it 'when using Float()' 


    it 'when using Complex()' 

  end
end

