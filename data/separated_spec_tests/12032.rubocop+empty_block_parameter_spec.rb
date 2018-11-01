# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::EmptyBlockParameter do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense for an empty block parameter with do-end wtyle' 


  it 'registers an offense for an empty block parameter with {} style' 


  it 'registers an offense for an empty block parameter with super' 


  it 'auto-corrects for do-end style' 


  it 'auto-corrects for {} style' 


  it 'auto-corrects for a keyword lambda' 


  it 'accepts a block that is do-end style without parameter' 


  it 'accepts a block that is {} style without parameter' 


  it 'accepts a non-empty block parameter with do-end style' 


  it 'accepts a non-empty block parameter with {} style' 


  it 'accepts an empty block parameter with a lambda' 

end

