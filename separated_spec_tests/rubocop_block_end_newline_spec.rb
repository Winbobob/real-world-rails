# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::BlockEndNewline do
  subject(:cop) { described_class.new }

  it 'accepts a one-liner' 


  it 'accepts multiline blocks with newlines before the end' 


  it 'registers an offense when multiline block end is not on its own line' 


  it 'registers an offense when multiline block } is not on its own line' 


  it 'autocorrects a do/end block where the end is not on its own line' 


  it 'autocorrects a {} block where the } is not on its own line' 


  it 'autocorrects a {} block where the } is top level code ' \
    'outside of a class' do
    new_source = autocorrect_source(<<-RUBY.strip_indent)
      # frozen_string_literal: true

      test {[
        foo
      ]}
    RUBY

    expect(new_source).to eq(<<-RUBY.strip_indent)
      # frozen_string_literal: true

      test {[
        foo
      ]
      }
    RUBY
  end
end

