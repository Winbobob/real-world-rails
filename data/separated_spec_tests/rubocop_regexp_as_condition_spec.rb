# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::RegexpAsCondition do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense for a regexp literal in `if` condition' 


  it 'does not register an offense for a regexp literal outside conditions' 


  it 'does not register an offense for a regexp literal with `=~` operator' 

end

