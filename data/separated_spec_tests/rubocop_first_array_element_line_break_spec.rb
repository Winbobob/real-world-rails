# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::FirstArrayElementLineBreak do
  subject(:cop) { described_class.new }

  context 'elements listed on the first line' do
    let(:source) do
      <<-RUBY.strip_indent
        a = [:a,
             :b]
      RUBY
    end

    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  context 'word arrays' do
    let(:source) do
      <<-RUBY.strip_indent
        %w(a b
           c d)
      RUBY
    end

    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  context 'array nested in a method call' do
    let(:source) do
      <<-RUBY.strip_indent
        method([:foo,
                :bar])
      RUBY
    end

    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  context 'masgn implicit arrays' do
    let(:source) do
      <<-RUBY.strip_indent
        a, b,
        c = 1,
        2, 3
      RUBY
    end

    let(:correct_source) do
      ['a, b,',
       'c = ',
       '1,',
       '2, 3',
       ''].join("\n")
    end

    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  context 'send implicit arrays' do
    let(:source) do
      <<-RUBY.strip_indent
        a
        .c = 1,
        2, 3
      RUBY
    end

    let(:correct_source) do
      ['a',
       '.c = ',
       '1,',
       '2, 3',
       ''].join("\n")
    end

    it 'detects the offense' 


    it 'autocorrects the offense' 

  end

  it 'ignores properly formatted implicit arrays' 


  it 'ignores elements listed on a single line' 

end

