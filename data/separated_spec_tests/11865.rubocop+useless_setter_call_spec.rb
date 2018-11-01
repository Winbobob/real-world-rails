# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UselessSetterCall do
  subject(:cop) { described_class.new }

  context 'with method ending with setter call on local object' do
    it 'registers an offense' 

  end

  context 'with singleton method ending with setter call on local object' do
    it 'registers an offense' 

  end

  context 'with method ending with square bracket setter on local object' do
    it 'registers an offense' 

  end

  context 'with method ending with ivar assignment' do
    it 'accepts' 

  end

  context 'with method ending with setter call on ivar' do
    it 'accepts' 

  end

  context 'with method ending with setter call on argument' do
    it 'accepts' 

  end

  context 'when a lvar contains an object passed as argument ' \
          'at the end of the method' do
    it 'accepts the setter call on the lvar' 

  end

  context 'when a lvar contains an object passed as argument ' \
          'by multiple-assignment at the end of the method' do
    it 'accepts the setter call on the lvar' 

  end

  context 'when a lvar does not contain any object passed as argument ' \
          'with multiple-assignment at the end of the method' do
    it 'registers an offense' 

  end

  context 'when a lvar possibly contains an object passed as argument ' \
          'by logical-operator-assignment at the end of the method' do
    it 'accepts the setter call on the lvar' 

  end

  context 'when a lvar does not contain any object passed as argument ' \
          'by binary-operator-assignment at the end of the method' do
    it 'registers an offense' 

  end

  context 'when a lvar declared as an argument ' \
          'is no longer the passed object at the end of the method' do
    it 'registers an offense for the setter call on the lvar' 

  end

  context 'when a lvar contains a local object instantiated with literal' do
    it 'registers an offense for the setter call on the lvar' 

  end

  context 'when a lvar contains a non-local object returned by a method' do
    it 'accepts' 

  end

  it 'is not confused by operators ending with =' 


  it 'handles exception assignments without exploding' 

end

