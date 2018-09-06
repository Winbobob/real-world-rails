# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::FloatOutOfRange do
  subject(:cop) { described_class.new }

  it 'does not register an offense for 0.0' 


  it 'does not register an offense for tiny little itty bitty floats' 


  it 'does not register an offense for respectably sized floats' 


  context 'on whopping big floats which tip the scales' do
    let(:source) { '9.9999e999' }

    it 'registers an offense' 

  end

  context 'on floats so close to zero that nobody can tell the difference' do
    let(:source) { '1.0e-400' }

    it 'registers an offense' 

  end
end

