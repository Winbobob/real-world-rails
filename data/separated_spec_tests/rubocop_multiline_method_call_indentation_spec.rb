# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::MultilineMethodCallIndentation do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    merged = RuboCop::ConfigLoader
             .default_configuration['Layout/MultilineMethodCallIndentation']
             .merge(cop_config)
             .merge('IndentationWidth' => cop_indent)
    RuboCop::Config
      .new('Layout/MultilineMethodCallIndentation' => merged,
           'Layout/IndentationWidth' => { 'Width' => indentation_width })
  end
  let(:indentation_width) { 2 }
  let(:cop_indent) { nil } # use indentation width from Layout/IndentationWidth

  shared_examples 'common' do
    it 'accepts indented methods in LHS of []= assignment' 


    it 'accepts indented methods inside and outside a block' 


    it 'accepts indentation relative to first receiver' 


    it 'accepts indented methods in ordinary statement' 


    it 'accepts no extra indentation of third line' 


    it 'accepts indented methods in for body' 


    it 'accepts alignment inside a grouped expression' 


    it 'accepts an expression where the first method spans multiple lines' 


    it 'accepts any indentation of parameters to #[]' 


    it "doesn't fail on unary operators" 


    it "doesn't crash on unaligned multiline lambdas" 

  end

  shared_examples 'common for aligned and indented' do
    it 'accepts even indentation of consecutive lines in typical RSpec code' 


    it 'registers an offense for no indentation of second line' 


    it 'registers an offense for 3 spaces indentation of second line' 


    it 'registers an offense for extra indentation of third line' 


    it 'registers an offense for the emacs ruby-mode 1.1 indentation of an ' \
       'expression in an array' do
      inspect_source(<<-RUBY.strip_margin('|'))
        |  [
        |   a.
        |   b
        |  ]
      RUBY
      expect(cop.messages)
        .to eq(['Use 2 (not 0) spaces for indenting an expression spanning ' \
                'multiple lines.'])
      expect(cop.highlights).to eq(['b'])
    end

    it 'registers an offense for extra indentation of 3rd line in typical ' \
       'RSpec code' do
      inspect_source(<<-RUBY.strip_indent)
        expect { Foo.new }.
          to change { Bar.count }.
              from(1).to(2)
      RUBY
      expect(cop.messages).to eq(['Use 2 (not 6) spaces for indenting an ' \
                                  'expression spanning multiple lines.'])
      expect(cop.highlights).to eq(['from'])
    end

    it 'registers an offense for proc call without a selector' 


    it 'registers an offense for one space indentation of second line' 

  end

  context 'when EnforcedStyle is aligned' do
    let(:cop_config) { { 'EnforcedStyle' => 'aligned' } }

    include_examples 'common'
    include_examples 'common for aligned and indented'

    # We call it semantic alignment when a dot is aligned with the first dot in
    # a chain of calls, and that first dot does not begin its line.
    context 'for semantic alignment' do
      it 'accepts method being aligned with method' 


      it 'accepts method being aligned with method that is an argument' 


      it 'accepts method being aligned with method that is an argument in ' \
         'assignment' do
        inspect_source(['user = authorize scope.includes(:user)',
                        '                      .order(:name)'])
        expect(cop.offenses.empty?).to be(true)
      end

      it 'accepts method being aligned with method in assignment' 


      it 'accepts aligned method even when an aref is in the chain' 


      it 'accepts aligned method even when an aref is first in the chain' 


      it "doesn't fail on a chain of aref calls" 


      it 'accepts aligned method with blocks in operation assignment' 


      it 'accepts 3 aligned methods' 


      it 'registers an offense for unaligned methods' 


      it 'registers an offense for unaligned method in block body' 


      it 'auto-corrects' 

    end

    it 'accepts correctly aligned methods in operands' 


    it 'accepts correctly aligned methods in assignment' 


    it 'accepts aligned methods in if + assignment' 


    it 'accepts indented method when there is nothing to align with' 


    it 'registers an offense for one space indentation of third line' 


    it 'accepts indented and aligned methods in binary operation' 


    it 'accepts aligned methods in if condition' 


    it 'accepts aligned methods in a begin..end block' 


    it 'registers an offense for misaligned methods in if condition' 


    it 'does not check binary operations when string wrapped with backslash' 


    it 'does not check binary operations when string wrapped with +' 


    it 'registers an offense for misaligned method in []= call' 


    it 'registers an offense for misaligned methods in unless condition' 


    it 'registers an offense for misaligned methods in while condition' 


    it 'registers an offense for misaligned methods in until condition' 


    it 'accepts aligned method in return' 


    it 'accepts aligned method in assignment + block + assignment' 


    it 'accepts aligned methods in assignment' 


    it 'registers an offense for misaligned methods in local variable ' \
       'assignment' do
      inspect_source(<<-RUBY.strip_indent)
        a = b.c.
         d
      RUBY
      expect(cop.messages).to eq(['Align `d` with `b.c.` on line 1.'])
      expect(cop.highlights).to eq(['d'])
    end

    it 'accepts aligned methods in constant assignment' 


    it 'accepts aligned methods in operator assignment' 


    it 'registers an offense for unaligned methods in assignment' 


    it 'auto-corrects' 

  end

  shared_examples 'both indented* styles' do
    # We call it semantic alignment when a dot is aligned with the first dot in
    # a chain of calls, and that first dot does not begin its line. But for the
    # indented style, it doesn't come into play.
    context 'for possible semantic alignment' do
      it 'accepts indented methods' 

    end
  end

  context 'when EnforcedStyle is indented_relative_to_receiver' do
    let(:cop_config) { { 'EnforcedStyle' => 'indented_relative_to_receiver' } }

    include_examples 'common'
    include_examples 'both indented* styles'

    it 'accepts correctly indented methods in operation' 


    it 'accepts indentation of consecutive lines in typical RSpec code' 


    it 'registers an offense for no indentation of second line' 


    it 'registers an offense for extra indentation of 3rd line in typical ' \
       'RSpec code' do
      inspect_source(<<-RUBY.strip_indent)
        expect { Foo.new }.
          to change { Bar.count }.
              from(1).to(2)
      RUBY
      expect(cop.messages).to eq(['Indent `from` 2 spaces more than `change ' \
                                  '{ Bar.count }` on line 2.'])
      expect(cop.highlights).to eq(['from'])
    end

    it 'registers an offense for proc call without a selector' 


    it 'registers an offense for one space indentation of second line' 


    it 'registers an offense for 3 spaces indentation of second line' 


    it 'registers an offense for extra indentation of third line' 


    it 'registers an offense for the emacs ruby-mode 1.1 indentation of an ' \
       'expression in an array' do
      inspect_source(<<-RUBY.strip_margin('|'))
        |  [
        |   a.
        |   b
        |  ]
      RUBY
      expect(cop.messages)
        .to eq(['Indent `b` 2 spaces more than `a` on line 2.'])
      expect(cop.highlights).to eq(['b'])
    end

    it 'auto-corrects' 

  end

  context 'when EnforcedStyle is indented' do
    let(:cop_config) { { 'EnforcedStyle' => 'indented' } }

    include_examples 'common'
    include_examples 'common for aligned and indented'
    include_examples 'both indented* styles'

    it 'accepts correctly indented methods in operation' 


    it 'registers an offense for one space indentation of third line' 


    it 'accepts indented methods in if condition' 


    it 'registers an offense for aligned methods in if condition' 


    it 'accepts normal indentation of method parameters' 


    it 'accepts any indentation of method parameters' 


    it 'accepts normal indentation inside grouped expression' 


    [
      %w[an if],
      %w[an unless],
      %w[a while],
      %w[an until]
    ].each do |article, keyword|
      it "accepts double indentation of #{keyword} condition" 


      it "registers an offense for a 2 space indentation of #{keyword} " \
         'condition' do
        inspect_source(<<-RUBY.strip_indent)
          #{keyword} receiver
            .nil? &&
            !args.empty?
          end
        RUBY
        expect(cop.highlights).to eq(['.nil?'])
        expect(cop.messages).to eq(['Use 4 (not 2) spaces for indenting a ' \
                                    "condition in #{article} `#{keyword}` " \
                                    'statement spanning multiple lines.'])
      end

      it "accepts indented methods in #{keyword} body" 

    end

    %w[unless if].each do |keyword|
      it "accepts special indentation of return #{keyword} condition" 

    end

    it 'registers an offense for wrong indentation of for expression' 


    it 'accepts special indentation of for expression' 


    it 'accepts indentation of assignment' 


    it 'registers an offense for correct + unrecognized style' 


    it 'registers an offense for aligned operators in assignment' 


    it 'auto-corrects' 


    context 'when indentation width is overridden for this cop' do
      let(:cop_indent) { 7 }

      it 'accepts indented methods' 


      it 'accepts correctly indented methods in operation' 


      it 'accepts indented methods in if condition' 


      it 'accepts indentation of assignment' 


      [
        %w[an if],
        %w[an unless],
        %w[a while],
        %w[an until]
      ].each do |article, keyword|
        it "accepts indentation of #{keyword} condition which is offset " \
           'by a single normal indentation step' do
          # normal code indentation is 2 spaces, and we have configured
          # multiline method indentation to 7 spaces
          # so in this case, 9 spaces are required
          inspect_source(<<-RUBY.strip_indent)
            #{keyword} receiver.
                     nil? &&
                     !args.empty?
            end
          RUBY
          expect(cop.messages.empty?).to be(true)
        end

        it "registers an offense for a 4 space indentation of #{keyword} " \
           'condition' do
          inspect_source(<<-RUBY.strip_indent)
            #{keyword} receiver
                .nil? &&
                !args.empty?
            end
          RUBY
          expect(cop.highlights).to eq(['.nil?'])
          expect(cop.messages).to eq(['Use 9 (not 4) spaces for indenting a ' \
                                      "condition in #{article} `#{keyword}` " \
                                      'statement spanning multiple lines.'])
        end

        it "accepts indented methods in #{keyword} body" 

      end
    end
  end
end

