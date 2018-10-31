# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::IfUnlessModifier do
  include StatementModifierHelper

  subject(:cop) { described_class.new(config) }

  let(:config) do
    hash = { 'Metrics/LineLength' => { 'Max' => 80 } }
    RuboCop::Config.new(hash)
  end

  context 'multiline if that fits on one line' do
    let(:source) do
      # Empty lines should make no difference.
      <<-RUBY.strip_indent
        if #{condition}
          #{body}

        end
      RUBY
    end

    let(:condition) { 'a' * 38 }
    let(:body) { 'b' * 38 }

    it 'registers an offense' 


    it 'does auto-correction' 


    context 'and has two statements separated by semicolon' do
      it 'accepts' 

    end
  end

  context 'multiline if that fits on one line with comment on first line' do
    let(:source) do
      <<-RUBY.strip_indent
        if a # comment
          b
        end
      RUBY
    end

    it 'registers an offense' 


    it 'does auto-correction and preserves comment' 

  end

  context 'multiline if that fits on one line with comment near end' do
    it 'accepts' 

  end

  context 'short multiline if near an else etc' do
    let(:source) do
      <<-RUBY.strip_indent
        if x
          y
        elsif x1
          y1
        else
          z
        end
        n = a ? 0 : 1
        m = 3 if m0

        if a
          b
        end
      RUBY
    end

    it 'registers an offense' 


    it 'does auto-correction' 

  end

  it "accepts multiline if that doesn't fit on one line" 


  it 'accepts multiline if whose body is more than one line' 


  context 'multiline unless that fits on one line' do
    let(:source) do
      <<-RUBY.strip_indent
        unless a
          b
        end
      RUBY
    end

    it 'registers an offense' 


    it 'does auto-correction' 

  end

  it 'accepts code with EOL comment since user might want to keep it' 


  it 'accepts if-else-end' 


  it 'accepts an empty condition' 


  it 'accepts if/elsif' 


  context 'with implicit match conditional' do
    let(:source) do
      <<-RUBY.strip_margin('|')
        |  if #{conditional}
        |    #{body}
        |  end
      RUBY
    end

    let(:body) { 'b' * 36 }

    context 'when a multiline if fits on one line' do
      let(:conditional) { "/#{'a' * 36}/" }

      it 'registers an offense' 


      it 'does auto-correction' 

    end

    context "when a multiline if doesn't fit on one line" do
      let(:conditional) { "/#{'a' * 37}/" }

      it 'accepts' 

    end
  end

  it 'accepts if-end followed by a chained call' 


  it "doesn't break if-end when used as RHS of local var assignment" 


  it "doesn't break if-end when used as RHS of instance var assignment" 


  it "doesn't break if-end when used as RHS of class var assignment" 


  it "doesn't break if-end when used as RHS of constant assignment" 


  it "doesn't break if-end when used as RHS of binary arithmetic" 


  it 'accepts if-end when used as LHS of binary arithmetic' 


  context 'if-end is argument to a parenthesized method call' do
    it "doesn't add redundant parentheses" 

  end

  context 'if-end is argument to a non-parenthesized method call' do
    it 'adds parentheses so as not to change meaning' 

  end

  context 'if-end with conditional as body' do
    it 'accepts' 

  end

  context 'unless-end with conditional as body' do
    it 'accepts' 

  end
end

