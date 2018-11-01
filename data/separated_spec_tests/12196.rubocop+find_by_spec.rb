# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::FindBy do
  subject(:cop) { described_class.new }

  it 'registers an offense when using `#first`' 


  it 'registers an offense when using `#take`' 


  it 'does not register an offense when using find_by' 


  it 'autocorrects where.take to find_by' 


  it 'does not autocorrect where.first' 

end

