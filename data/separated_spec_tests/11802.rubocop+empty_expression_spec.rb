# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::EmptyExpression do
  subject(:cop) { described_class.new }

  context 'when used as a standalone expression' do
    it 'registers an offense' 


    context 'with nested empty expressions' do
      it 'registers an offense' 

    end
  end

  context 'when used in a condition' do
    it 'registers an offense inside `if`' 


    it 'registers an offense inside `elseif`' 


    it 'registers an offense inside `case`' 


    it 'registers an offense inside `when`' 


    it 'registers an offense in the condition of a ternary operator' 


    it 'registers an offense in the return value of a ternary operator' 

  end

  context 'when used as a return value' do
    it 'registers an offense in the return value of a method' 


    it 'registers an offense in the return value of a condition' 


    it 'registers an offense in the return value of a case statement' 

  end

  context 'when used as an assignment' do
    it 'registers an offense for the assigned value' 

  end
end

