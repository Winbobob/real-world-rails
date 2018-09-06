# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::MultilineOperationIndentation do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    merged = RuboCop::ConfigLoader
             .default_configuration['Layout/MultilineOperationIndentation']
             .merge(cop_config)
             .merge('IndentationWidth' => cop_indent)
    RuboCop::Config
      .new('Layout/MultilineOperationIndentation' => merged,
           'Layout/IndentationWidth' => { 'Width' => indentation_width })
  end
  let(:indentation_width) { 2 }
  let(:cop_indent) { nil } # use indentation width from Layout/IndentationWidth

  shared_examples 'common' do
    it 'accepts indented operands in ordinary statement' 


    it 'accepts indented operands inside and outside a block' 


    it 'registers an offense for no indentation of second line' 


    it 'registers an offense for one space indentation of second line' 


    it 'does not check method calls' 


    it 'registers an offense for three spaces indentation of second line' 


    it 'registers an offense for extra indentation of third line' 


    it 'registers an offense for the emacs ruby-mode 1.1 indentation of an ' \
       'expression in an array' do
      inspect_source(<<-RUBY.strip_margin('|'))
        |  [
        |   a +
        |   b
        |  ]
      RUBY
      expect(cop.messages).to eq(['Use 2 (not 0) spaces for indenting an ' \
                                  'expression spanning multiple lines.'])
      expect(cop.highlights).to eq(['b'])
    end

    it 'accepts indented operands in an array' 


    it 'accepts two spaces indentation in assignment of local variable' 


    it 'accepts two spaces indentation in assignment of array element' 


    it 'accepts two spaces indentation of second line' 


    it 'accepts no extra indentation of third line' 


    it 'accepts indented operands in for body' 


    it 'accepts alignment inside a grouped expression' 


    it 'accepts an expression where the first operand spans multiple lines' 


    it 'accepts any indentation of parameters to #[]' 


    it 'registers an offense for an unindented multiline operation that is ' \
       'the left operand in another operation' do
      inspect_source(<<-RUBY.strip_indent)
        a +
        b < 3
      RUBY
      expect(cop.messages).to eq(['Use 2 (not 0) spaces for indenting an ' \
                                  'expression spanning multiple lines.'])
      expect(cop.highlights).to eq(['b'])
    end
  end

  context 'when EnforcedStyle is aligned' do
    let(:cop_config) { { 'EnforcedStyle' => 'aligned' } }

    include_examples 'common'

    it 'accepts aligned operands in if condition' 


    it 'registers an offense for indented operands in if condition' 


    it 'accepts indented code on LHS of equality operator' 


    it 'accepts indented operands inside block + assignment' 


    it 'accepts indented operands with ternary operators' 


    it 'registers an offense for indented second part of string' 


    it 'registers an offense for indented operand in second argument' 


    it 'registers an offense for misaligned string operand when the first ' \
       'operand has backslash continuation' do
      inspect_source(['def f',
                      "  flash[:error] = 'Here is a string ' \\",
                      "                  'That spans' <<",
                      "    'multiple lines'",
                      'end'])
      expect(cop.messages).to eq(['Align the operands of an expression in an ' \
                                  'assignment spanning multiple lines.'])
      expect(cop.highlights).to eq(["'multiple lines'"])
    end

    it 'registers an offense for misaligned string operand when plus is used' 


    it 'registers an offense for misaligned operands in unless condition' 


    [
      %w[an if],
      %w[an unless],
      %w[a while],
      %w[an until]
    ].each do |article, keyword|
      it "registers an offense for misaligned operands in #{keyword} " \
         'condition' do
        inspect_source(<<-RUBY.strip_indent)
          #{keyword} a or
              b
            something
          end
        RUBY
        expect(cop.messages).to eq(['Align the operands of a condition in ' \
                                    "#{article} `#{keyword}` statement " \
                                    'spanning multiple lines.'])
        expect(cop.highlights).to eq(['b'])
        expect(cop.config_to_allow_offenses)
          .to eq('EnforcedStyle' => 'indented')
      end
    end

    it 'accepts aligned operands in assignment' 


    it 'accepts aligned or:ed operands in assignment' 


    it 'registers an offense for unaligned operands in op-assignment' 


    it 'auto-corrects' 

  end

  context 'when EnforcedStyle is indented' do
    let(:cop_config) { { 'EnforcedStyle' => 'indented' } }

    include_examples 'common'

    it 'accepts indented operands in if condition' 


    it 'registers an offense for aligned operands in if condition' 


    it 'accepts the indentation of a broken string' 


    it 'accepts normal indentation of method parameters' 


    it 'accepts any indentation of method parameters' 


    it 'accepts normal indentation inside grouped expression' 


    it 'registers an offense for aligned code on LHS of equality operator' 


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
          #{keyword} receiver.nil? &&
            !args.empty? &&
            BLACKLIST.include?(method_name)
          end
        RUBY
        expect(cop.highlights).to eq(['!args.empty?',
                                      'BLACKLIST.include?(method_name)'])
        expect(cop.messages).to eq(['Use 4 (not 2) spaces for indenting a ' \
                                    "condition in #{article} `#{keyword}` " \
                                    'statement spanning multiple lines.'] * 2)
      end

      it "accepts indented operands in #{keyword} body" 

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
      let(:cop_indent) { 6 }

      it 'accepts indented operands in if condition' 


      [
        %w[an if],
        %w[an unless],
        %w[a while],
        %w[an until]
      ].each do |article, keyword|
        it "accepts indentation of #{keyword} condition which is offset " \
           'by a single normal indentation step' do
          # normal code indentation is 2 spaces, and we have configured
          # multiline method indentation to 6 spaces
          # so in this case, 8 spaces are required
          inspect_source(<<-RUBY.strip_indent)
            #{keyword} receiver.nil? &&
                    !args.empty? &&
                    BLACKLIST.include?(method_name)
            end
            #{keyword} receiver.
                    nil?
            end
          RUBY
          expect(cop.messages.empty?).to be(true)
        end

        it "registers an offense for a 4 space indentation of #{keyword} " \
           'condition' do
          inspect_source(<<-RUBY.strip_indent)
            #{keyword} receiver.nil? &&
                !args.empty? &&
                BLACKLIST.include?(method_name)
            end
          RUBY
          expect(cop.highlights).to eq(['!args.empty?',
                                        'BLACKLIST.include?(method_name)'])
          expect(cop.messages).to eq(['Use 8 (not 4) spaces for indenting a ' \
                                      "condition in #{article} `#{keyword}` " \
                                      'statement spanning multiple lines.'] * 2)
        end

        it "accepts indented operands in #{keyword} body" 

      end

      it 'auto-corrects' 

    end
  end
end

