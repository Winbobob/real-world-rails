# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::LineEndConcatenation do
  subject(:cop) { described_class.new }

  it 'registers an offense for string concat at line end' 


  it 'registers an offense for string concat with << at line end' 


  it 'registers an offense for string concat with << and \ at line ends' 


  it 'registers an offense for dynamic string concat at line end' 


  it 'registers an offense for dynamic string concat with << at line end' 


  it 'registers multiple offenses when there are chained << methods' 


  it 'registers multiple offenses when there are chained concatenations' 


  it 'registers multiple offenses when there are chained concatenations' \
     'combined with << calls' do
    inspect_source(['top = "test#{x}" <<',
                    '"top" +',
                    '"foo" <<',
                    '"bar"'])
    expect(cop.offenses.size).to eq(3)
  end

  it 'accepts string concat on the same line' 


  it 'accepts string concat with a return value of method on a string' 


  it 'accepts string concat with a return value of method on an interpolated ' \
     'string' do
    source = <<-RUBY
      x3a = 'x' +
        "\#{'a' + "\#{3}"}".reverse
    RUBY
    inspect_source(source)
    expect(cop.offenses.empty?).to be(true)
  end

  it 'accepts string concat at line end when followed by comment' 


  it 'accepts string concat at line end when followed by a comment line' 


  it 'accepts string concat at line end when % literals are involved' 


  it 'accepts string concat at line end for special strings like __FILE__' 


  it 'registers offenses only for the appropriate lines in chained concats' 


  it 'autocorrects in the simple case by replacing + with \\' 


  # The "central auto-correction engine" can't handle intermediate states where
  # the code has syntax errors, so it's important to fix the trailing
  # whitespace in this cop.
  it 'autocorrects a + with trailing whitespace to \\' 


  it 'autocorrects a + with \\ to just \\' 


  it 'autocorrects for chained concatenations and << calls' 


  it 'autocorrects only the lines that should be autocorrected' 

end

