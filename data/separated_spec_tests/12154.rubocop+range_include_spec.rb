# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::RangeInclude do
  subject(:cop) { described_class.new }

  it 'autocorrects (a..b).include? without parens' 


  it 'autocorrects (a...b).include? without parens' 


  it 'autocorrects (a..b).include? with parens' 


  it 'autocorrects (a...b).include? with parens' 


  it 'formats the error message correctly for (a..b).include? 1' 

end

