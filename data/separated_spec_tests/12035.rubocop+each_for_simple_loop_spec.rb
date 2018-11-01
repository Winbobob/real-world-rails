# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::EachForSimpleLoop do
  subject(:cop) { described_class.new }

  OFFENSE_MSG = 'Use `Integer#times` for a simple loop ' \
                'which iterates a fixed number of times.'.freeze

  it 'registers offense for inclusive end range' 


  it 'registers offense for exclusive end range' 


  it 'registers offense for exclusive end range with do ... end syntax' 


  it 'registers an offense for range not starting with zero' 


  it 'does not register offense if range startpoint is not constant' 


  it 'does not register offense if range endpoint is not constant' 


  it 'does not register offense for inline block with parameters' 


  it 'does not register offense for multiline block with parameters' 


  it 'does not register offense for character range' 


  context 'when using an inclusive range' do
    it 'autocorrects the source with inline block' 


    it 'autocorrects the source with multiline block' 


    it 'autocorrects the range not starting with zero' 


    it 'does not autocorrect range not starting with zero and using param' 

  end

  context 'when using an exclusive range' do
    it 'autocorrects the source with inline block' 


    it 'autocorrects the source with multiline block' 


    it 'autocorrects the range not starting with zero' 


    it 'does not autocorrect range not starting with zero and using param' 

  end
end

