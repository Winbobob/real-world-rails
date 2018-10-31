# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::IfUnlessModifier do
  include StatementModifierHelper

  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Metrics/LineLength' => { 'Max' => 80 })
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

  context 'with a named regexp capture on the LHS' do
    it 'does not register an offense' 

  end

  context 'with disabled Layout/Tab cop' do
    shared_examples 'with tabs indentation' do
      let(:source) do
        # Empty lines should make no difference.
        <<-RUBY
						if #{condition}
							#{body}
						end
        RUBY
      end

      let(:body) { 'bbb' }

      context 'it fits on one line' do
        let(:condition) { 'aaa' }

        it 'registers an offense' 

      end

      context "it doesn't fit on one line" do
        let(:condition) { 'aaaa' }

        it "doesn't register an offense" 

      end
    end

    context 'with Layout/Tab: IndentationWidth config' do
      let(:config) do
        RuboCop::Config.new(
          'Layout/IndentationWidth' => {
            'Width' => 1
          },
          'Layout/Tab' => {
            'Enabled' => false,
            'IndentationWidth' => 2
          },
          'Metrics/LineLength' => { 'Max' => 10 + 12 } # 12 is indentation
        )
      end

      it_behaves_like 'with tabs indentation'
    end

    context 'with Layout/IndentationWidth: Width config' do
      let(:config) do
        RuboCop::Config.new(
          'Layout/IndentationWidth' => {
            'Width' => 1
          },
          'Layout/Tab' => {
            'Enabled' => false
          },
          'Metrics/LineLength' => { 'Max' => 10 + 6 } # 6 is indentation
        )
      end

      it_behaves_like 'with tabs indentation'
    end

    context 'without any IndentationWidth config' do
      let(:config) do
        RuboCop::Config.new(
          'Layout/Tab' => {
            'Enabled' => false
          },
          'Metrics/LineLength' => { 'Max' => 10 + 12 } # 12 is indentation
        )
      end

      it_behaves_like 'with tabs indentation'
    end
  end

  context 'when Metrics/LineLength is disabled' do
    let(:config) do
      RuboCop::Config.new(
        'Metrics/LineLength' => {
          'Enabled' => false,
          'Max' => 80
        }
      )
    end

    it 'registers an offense even for a long modifier statement' 

  end
end

