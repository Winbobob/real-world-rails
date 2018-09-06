# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::IfInsideElse do
  subject(:cop) { described_class.new }

  it 'catches an if node nested inside an else' 


  it 'catches an if..else nested inside an else' 


  it 'catches a modifier if nested inside an else' 


  it "isn't offended if there is a statement following the if node" 


  it "isn't offended if there is a statement preceding the if node" 


  it "isn't offended by if..elsif..else" 


  it 'ignores unless inside else' 


  it 'ignores if inside unless' 


  it 'ignores nested ternary expressions' 


  it 'ignores ternary inside if..else' 

end

