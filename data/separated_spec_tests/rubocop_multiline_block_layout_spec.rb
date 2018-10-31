# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::MultilineBlockLayout do
  subject(:cop) { described_class.new }

  it 'registers an offense for missing newline in do/end block w/o params' 


  it 'registers an offense for missing newline in {} block w/o params' 


  it 'registers an offense for missing newline in do/end block with params' 


  it 'registers an offense for missing newline in {} block with params' 


  it 'does not register an offense for one-line do/end blocks' 


  it 'does not register an offense for one-line {} blocks' 


  it 'does not register offenses when there is a newline for do/end block' 


  it 'does not error out when the block is empty' 


  it 'does not register offenses when there is a newline for {} block' 


  it 'registers offenses for lambdas as expected' 


  it 'registers offenses for new lambda literal syntax as expected' 


  it 'registers an offense for line-break before arguments' 


  it 'registers an offense for line-break before arguments with empty block' 


  it 'registers an offense for line-break within arguments' 


  it 'auto-corrects a do/end block with params that is missing newlines' 


  it 'auto-corrects a do/end block with a mult-line body' 


  it 'auto-corrects a {} block with params that is missing newlines' 


  it 'autocorrects in more complex case with lambda and assignment, and '\
     'aligns the next line two spaces out from the start of the block' do
    src = <<-RUBY.strip_indent
      x = -> (y) { foo
        bar
      }
    RUBY

    new_source = autocorrect_source(src)

    expect(new_source).to eq(['x = -> (y) { ',
                              '      foo',
                              '  bar',
                              '}',
                              ''].join("\n"))
  end

  it 'auto-corrects a line-break before arguments' 


  it 'auto-corrects a line-break before arguments with empty block' 


  it 'auto-corrects a line-break within arguments' 


  it 'auto-corrects a line break within destructured arguments' 


  it "doesn't move end keyword in a way which causes infinite loop " \
     'in combination with Style/BlockEndNewLine' do
    new_source = autocorrect_source(<<-RUBY.strip_indent)
      def f
        X.map do |(a,
        b)|
        end
      end
    RUBY
    expect(new_source).to eq(<<-RUBY.strip_indent)
      def f
        X.map do |(a, b)|
        end
      end
    RUBY
  end
end

