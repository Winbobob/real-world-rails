# frozen_string_literal: true

RSpec.describe RuboCop::Cop::InternalAffairs::UselessMessageAssertion do
  subject(:cop) { described_class.new }

  it 'registers an offense for specs that assert using the MSG' 
      it 'uses described_class::MSG to specify the expected message' 

    RUBY
  end

  it 'registers an offense for described_class::MSG in let' 


  it 'does not register an offense for an assertion about the message' 
      it 'has a good message' 

    RUBY
  end
end

