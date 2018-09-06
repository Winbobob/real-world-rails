# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::EachWithObject do
  subject(:cop) { described_class.new }

  it 'finds inject and reduce with passed in and returned hash' 


  it 'correctly autocorrects' 


  it 'correctly autocorrects with return value only' 


  it 'ignores inject and reduce with passed in, but not returned hash' 


  it 'ignores inject and reduce with empty body' 


  it 'ignores inject and reduce with condition as body' 


  it 'ignores inject and reduce passed in symbol' 


  it 'does not blow up for reduce with no arguments' 


  it 'ignores inject/reduce with assignment to accumulator param in block' 


  context 'when a simple literal is passed as initial value' do
    it 'ignores inject/reduce' 

  end
end

