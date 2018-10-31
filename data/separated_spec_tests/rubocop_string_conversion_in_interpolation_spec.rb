# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::StringConversionInInterpolation do
  subject(:cop) { described_class.new }

  it 'registers an offense for #to_s in interpolation' 


  it 'detects #to_s in an interpolation with several expressions' 


  it 'accepts #to_s with arguments in an interpolation' 


  it 'accepts interpolation without #to_s' 


  it 'does not explode on implicit receiver' 


  it 'does not explode on empty interpolation' 


  it 'autocorrects by removing the redundant to_s' 


  it 'autocorrects implicit receiver by replacing to_s with self' 

end

