# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::DateTime do
  subject(:cop) { described_class.new }

  it 'registers an offense when using DateTime for current time' 


  it 'registers an offense when using ::DateTime for current time' 


  it 'registers an offense when using DateTime for modern date' 


  it 'does not register an offense when using Time for current time' 


  it 'does not register an offense when using Date for modern date' 


  it 'does not register an offense when using DateTime for historic date' 


  it 'does not register an offense when using DateTime in another namespace' 

end

