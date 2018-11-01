# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::Not, :config do
  subject(:cop) { described_class.new(config) }

  it 'registers an offense for not' 


  it 'does not register an offense for !' 


  it 'auto-corrects "not" with !' 


  it 'auto-corrects "not" followed by parens with !' 


  it 'uses the reverse operator when `not` is applied to a comparison' 


  it 'parenthesizes when `not` would change the meaning of a binary exp' 


  it 'parenthesizes when `not` is applied to a ternary op' 


  it 'parenthesizes when `not` is applied to and' 


  it 'parenthesizes when `not` is applied to or' 

end

