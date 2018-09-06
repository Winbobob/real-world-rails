# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::UnneededInterpolation do
  subject(:cop) { described_class.new }

  it 'registers an offense for "#{1 + 1}"' 


  it 'registers an offense for "%|#{1 + 1}|"' 


  it 'registers an offense for "%Q(#{1 + 1})"' 


  it 'registers an offense for "#{1 + 1; 2 + 2}"' 


  it 'registers an offense for "#{@var}"' 


  it 'registers an offense for "#@var"' 


  it 'registers an offense for "#{@@var}"' 


  it 'registers an offense for "#@@var"' 


  it 'registers an offense for "#{$var}"' 


  it 'registers an offense for "#$var"' 


  it 'registers an offense for "#{$1}"' 


  it 'registers an offense for "#$1"' 


  it 'registers an offense for "#{$+}"' 


  it 'registers an offense for "#$+"' 


  it 'registers an offense for "#{var}"' 


  it 'registers an offense for ["#{@var}"]' 


  it 'accepts strings with characters before the interpolation' 


  it 'accepts strings with characters after the interpolation' 


  it 'accepts strings implicitly concatenated with a later string' 


  it 'accepts strings implicitly concatenated with an earlier string' 


  it 'accepts strings that are part of a %W()' 


  it 'autocorrects "#{1 + 1; 2 + 2}"' 


  it 'autocorrects "#@var"' 


  it 'autocorrects "#{var}"' 


  it 'autocorrects "#{@var}"' 

end

