# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::FirstMethodArgumentLineBreak do
  subject(:cop) { described_class.new }

  context 'args listed on the first line' do
    let(:source) do
      <<-RUBY.strip_indent
        foo(bar,
          baz)
      RUBY
    end

    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  context 'hash arg spanning multiple lines' do
    let(:source) do
      <<-RUBY.strip_indent
        something(3, bar: 1,
        baz: 2)
      RUBY
    end

    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  context 'hash arg without a line break before the first pair' do
    let(:source) do
      <<-RUBY.strip_indent
        something(bar: 1,
        baz: 2)
      RUBY
    end

    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  it 'ignores arguments listed on a single line' 


  it 'ignores arguments without parens' 


  it 'ignores methods without arguments' 

end

