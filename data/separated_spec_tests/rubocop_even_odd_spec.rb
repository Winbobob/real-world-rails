# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::EvenOdd do
  subject(:cop) { described_class.new }

  it 'registers an offense for x % 2 == 0' 


  it 'registers an offense for x % 2 != 0' 


  it 'registers an offense for (x % 2) == 0' 


  it 'registers an offense for (x % 2) != 0' 


  it 'registers an offense for x % 2 == 1' 


  it 'registers an offense for x % 2 != 1' 


  it 'registers an offense for (x % 2) == 1' 


  it 'registers an offense for (x % 2) != 1' 


  it 'registers an offense for (x.y % 2) != 1' 


  it 'registers an offense for (x(y) % 2) != 1' 


  it 'accepts x % 3 == 0' 


  it 'accepts x % 3 != 0' 


  it 'converts x % 2 == 0 to #even?' 


  it 'converts x % 2 != 0 to #odd?' 


  it 'converts (x % 2) == 0 to #even?' 


  it 'converts (x % 2) != 0 to #odd?' 


  it 'converts x % 2 == 1 to odd?' 


  it 'converts x % 2 != 1 to even?' 


  it 'converts (x % 2) == 1 to odd?' 


  it 'converts (y % 2) != 1 to even?' 


  it 'converts (x.y % 2) != 1 to even?' 


  it 'converts (x(y) % 2) != 1 to even?' 


  it 'converts (x._(y) % 2) != 1 to even?' 


  it 'converts (x._(y)) % 2 != 1 to even?' 


  it 'converts x._(y) % 2 != 1 to even?' 


  it 'converts 1 % 2 != 1 to even?' 


  it 'converts complex examples' 

end

