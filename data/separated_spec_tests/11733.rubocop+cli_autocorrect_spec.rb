# frozen_string_literal: true

RSpec.describe RuboCop::CLI, :isolated_environment do
  include_context 'cli spec behavior'

  subject(:cli) { described_class.new }

  before do
    RuboCop::ConfigLoader.default_configuration = nil
  end

  it 'does not correct ExtraSpacing in a hash that would be changed back' 


  it 'does not correct SpaceAroundOperators in a hash that would be ' \
     'changed back' do
    create_file('.rubocop.yml', <<-YAML.strip_indent)
      Style/HashSyntax:
        EnforcedStyle: hash_rockets

      Layout/AlignHash:
        EnforcedHashRocketStyle: table
    YAML
    source = <<-RUBY.strip_indent
      a = { 1=>2, a => b }
      hash = {
        :alice => {
          :age  => 23,
          :role => 'Director'
        },
        :bob   => {
          :age  => 25,
          :role => 'Consultant'
        }
      }
    RUBY
    create_file('example.rb', source)
    expect(cli.run(['--auto-correct'])).to eq(1)

    # 1=>2 is changed to 1 => 2. The rest is unchanged.
    # SpaceAroundOperators leaves it to AlignHash when the style is table.
    expect(IO.read('example.rb')).to eq(<<-RUBY.strip_indent)
      a = { 1 => 2, a => b }
      hash = {
        :alice => {
          :age  => 23,
          :role => 'Director'
        },
        :bob   => {
          :age  => 25,
          :role => 'Consultant'
        }
      }
    RUBY
  end

  describe 'trailing comma cops' do
    let(:source) do
      <<-RUBY.strip_indent
        func({
          @abc => 0,
          @xyz => 1
        })
        func(
          {
            abc: 0
          }
        )
        func(
          {},
          {
            xyz: 1
          }
        )
      RUBY
    end

    let(:config) do
      {
        'Style/TrailingCommaInArguments' => {
          'EnforcedStyleForMultiline' => comma_style
        },
        'Style/TrailingCommaInArrayLiteral' => {
          'EnforcedStyleForMultiline' => comma_style
        },
        'Style/TrailingCommaInHashLiteral' => {
          'EnforcedStyleForMultiline' => comma_style
        },
        'Style/BracesAroundHashParameters' =>
          braces_around_hash_parameters_config
      }
    end

    before do
      create_file('example.rb', source)
      create_file('.rubocop.yml', YAML.dump(config))
    end

    shared_examples 'corrects offenses without producing a double comma' do
      it 'corrects TrailingCommaInLiteral and TrailingCommaInArguments ' \
         'without producing a double comma' do
        cli.run(['--auto-correct'])

        expect(IO.read('example.rb'))
          .to eq(expected_corrected_source)

        expect($stderr.string).to eq('')
      end
    end

    context 'when the style is `comma`' do
      let(:comma_style) do
        'comma'
      end

      context 'and Style/BracesAroundHashParameters is disabled' do
        let(:braces_around_hash_parameters_config) do
          {
            'Enabled' => false,
            'AutoCorrect' => false,
            'EnforcedStyle' => 'braces'
          }
        end

        let(:expected_corrected_source) do
          <<-RUBY.strip_indent
            func({
                   @abc => 0,
                   @xyz => 1,
                 })
            func(
              {
                abc: 0,
              },
            )
            func(
              {},
              {
                xyz: 1,
              },
            )
          RUBY
        end

        include_examples 'corrects offenses without producing a double comma'
      end

      context 'and BracesAroundHashParameters style is `no_braces`' do
        let(:braces_around_hash_parameters_config) do
          {
            'EnforcedStyle' => 'no_braces'
          }
        end

        let(:expected_corrected_source) do
          <<-RUBY.strip_indent
            func(
              @abc => 0,
              @xyz => 1,
            )
            func(
              abc: 0,
            )
            func(
              {},
              xyz: 1,
            )
          RUBY
        end

        include_examples 'corrects offenses without producing a double comma'
      end

      context 'and BracesAroundHashParameters style is `context_dependent`' do
        let(:braces_around_hash_parameters_config) do
          {
            'EnforcedStyle' => 'context_dependent'
          }
        end

        let(:expected_corrected_source) do
          <<-RUBY.strip_indent
            func(
              @abc => 0,
              @xyz => 1,
            )
            func(
              abc: 0,
            )
            func(
              {},
              {
                xyz: 1,
              },
            )
          RUBY
        end

        include_examples 'corrects offenses without producing a double comma'
      end
    end

    context 'when the style is `consistent_comma`' do
      let(:comma_style) do
        'consistent_comma'
      end

      context 'and Style/BracesAroundHashParameters is disabled' do
        let(:braces_around_hash_parameters_config) do
          {
            'Enabled' => false,
            'AutoCorrect' => false,
            'EnforcedStyle' => 'braces'
          }
        end

        let(:expected_corrected_source) do
          <<-RUBY.strip_indent
            func({
                   @abc => 0,
                   @xyz => 1,
                 },)
            func(
              {
                abc: 0,
              },
            )
            func(
              {},
              {
                xyz: 1,
              },
            )
          RUBY
        end

        include_examples 'corrects offenses without producing a double comma'
      end

      context 'and BracesAroundHashParameters style is `no_braces`' do
        let(:braces_around_hash_parameters_config) do
          {
            'EnforcedStyle' => 'no_braces'
          }
        end

        let(:expected_corrected_source) do
          <<-RUBY.strip_indent
            func(
              @abc => 0,
              @xyz => 1,
            )
            func(
              abc: 0,
            )
            func(
              {},
              xyz: 1,
            )
          RUBY
        end

        include_examples 'corrects offenses without producing a double comma'
      end

      context 'and BracesAroundHashParameters style is `context_dependent`' do
        let(:braces_around_hash_parameters_config) do
          {
            'EnforcedStyle' => 'context_dependent'
          }
        end

        let(:expected_corrected_source) do
          <<-RUBY.strip_indent
            func(
              @abc => 0,
              @xyz => 1,
            )
            func(
              abc: 0,
            )
            func(
              {},
              {
                xyz: 1,
              },
            )
          RUBY
        end

        include_examples 'corrects offenses without producing a double comma'
      end
    end
  end

  context 'space_inside_bracket cops' do
    let(:source) do
      <<-RUBY.strip_indent
        [ a[b], c[ d ], [1, 2] ]
        foo[[ 3, 4 ], [5, 6] ]
      RUBY
    end

    let(:config) do
      {
        'Layout/SpaceInsideArrayLiteralBrackets' => {
          'EnforcedStyle' => array_style
        },
        'Layout/SpaceInsideReferenceBrackets' => {
          'EnforcedStyle' => reference_style
        }
      }
    end

    before do
      create_file('example.rb', source)
      create_file('.rubocop.yml', YAML.dump(config))
    end

    shared_examples 'corrects offenses' do
      it 'corrects SpaceInsideArrayLiteralBrackets and ' \
         'SpaceInsideReferenceBrackets' do
        cli.run(['--auto-correct'])

        expect(IO.read('example.rb'))
          .to eq(corrected_source)

        expect($stderr.string).to eq('')
      end
    end

    context 'when array style is space & reference style is no space' do
      let(:array_style) { 'space' }
      let(:reference_style) { 'no_space' }

      let(:corrected_source) do
        <<-RUBY.strip_indent
          [ a[b], c[d], [ 1, 2 ] ]
          foo[[ 3, 4 ], [ 5, 6 ]]
        RUBY
      end

      include_examples 'corrects offenses'
    end

    context 'when array style is no_space & reference style is space' do
      let(:array_style) { 'no_space' }
      let(:reference_style) { 'space' }

      let(:corrected_source) do
        <<-RUBY.strip_indent
          [a[ b ], c[ d ], [1, 2]]
          foo[ [3, 4], [5, 6] ]
        RUBY
      end

      include_examples 'corrects offenses'
    end

    context 'when array style is compact & reference style is no_space' do
      let(:array_style) { 'compact' }
      let(:reference_style) { 'no_space' }

      let(:corrected_source) do
        <<-RUBY.strip_indent
          [ a[b], c[d], [ 1, 2 ]]
          foo[[ 3, 4 ], [ 5, 6 ]]
        RUBY
      end

      include_examples 'corrects offenses'
    end

    context 'when array style is compact & reference style is space' do
      let(:array_style) { 'compact' }
      let(:reference_style) { 'space' }

      let(:corrected_source) do
        <<-RUBY.strip_indent
          [ a[ b ], c[ d ], [ 1, 2 ]]
          foo[ [ 3, 4 ], [ 5, 6 ] ]
        RUBY
      end

      include_examples 'corrects offenses'
    end
  end

  it 'corrects IndentationWidth, RedundantBegin, and ' \
     'RescueEnsureAlignment offenses' do
    source = <<-RUBY.strip_indent
      def verify_section
            begin
            scroll_down_until_element_exists
            rescue StandardError
              scroll_down_until_element_exists
              end
      end
    RUBY
    create_file('example.rb', source)
    expect(cli.run(['--auto-correct'])).to eq(0)
    corrected = <<-RUBY.strip_indent
      def verify_section
        scroll_down_until_element_exists
      rescue StandardError
        scroll_down_until_element_exists
      end
    RUBY
    expect(IO.read('example.rb')).to eq(corrected)
  end

  it 'corrects LineEndConcatenation offenses leaving the ' \
     'UnneededInterpolation offense unchanged' do
    # If we change string concatenation from plus to backslash, the string
    # literal that follows must remain a string literal.
    source = <<-'RUBY'.strip_indent
      puts 'foo' +
           "#{bar}"
      puts 'a' +
        'b'
      "#{c}"
    RUBY
    create_file('example.rb', source)
    expect(cli.run(['--auto-correct'])).to eq(0)
    corrected = ["puts 'foo' \\",
                 '     "#{bar}"',
                 # Expressions that need correction from only one of these cops
                 # are corrected as expected.
                 "puts 'a' \\",
                 "     'b'",
                 'c.to_s',
                 ''].join("\n")
    expect(IO.read('example.rb')).to eq(corrected)
  end

  describe 'caching' do
    let(:cache) { double('cache', 'valid?' => true, 'load' => cached_offenses) }
    let(:source) { %(puts "Hi"\n) }

    before do
      allow(RuboCop::ResultCache).to receive(:new) { cache }
      create_file('example.rb', source)
    end

    context 'with no offenses in the cache' do
      let(:cached_offenses) { [] }

      it "doesn't correct offenses" 

    end

    context 'with an offense in the cache' do
      let(:cached_offenses) { ['Style/StringLiterals: ...'] }

      it 'corrects offenses' 

    end
  end

  %i[line_count_based semantic braces_for_chaining].each do |style|
    context "when BlockDelimiters has #{style} style" do
      it 'corrects SpaceBeforeBlockBraces, SpaceInsideBlockBraces offenses' 

    end
  end

  it 'corrects InitialIndentation offenses' 


  it 'corrects UnneededCopDisableDirective offenses' 


  it 'corrects RedundantBegin offenses and fixes indentation etc' 


  it 'corrects Tab and IndentationConsistency offenses' 
        it 'returns http success' 

        describe 'admin user' do
          before(:each) do
          end
        end
      end
    RUBY
    expect(IO.read('example.rb')).to eq(corrected)
  end

  it 'corrects IndentationWidth and IndentationConsistency offenses' 
                  it "returns http success" 

              describe "admin user" do
                   before(:each) do
                  end
              end
          end
      end
    RUBY
    create_file('example.rb', source)
    expect(cli.run(['--auto-correct'])).to eq(0)
    corrected = <<-RUBY.strip_indent
      require 'spec_helper'
      describe ArticlesController do
        render_views
        describe \"GET 'index'\" do
          it 'returns http success' 

          describe 'admin user' do
            before(:each) do
            end
          end
        end
      end
    RUBY
    expect(IO.read('example.rb')).to eq(corrected)
  end

  it 'corrects SymbolProc and SpaceBeforeBlockBraces offenses' 


  it 'corrects only IndentationWidth without crashing' 


  it 'corrects complicated cases conservatively' 


  it 'honors Exclude settings in individual cops' 


  it 'corrects code with indentation problems' 


  it 'can change block comments and indent them' 


  it 'can correct two problems with blocks' 


  it 'can handle spaces when removing braces' 


  # A case where two cops, EmptyLinesAroundBody and EmptyLines, try to
  # remove the same line in autocorrect.
  it 'can correct two empty lines at end of class body' 


  # A case where WordArray's correction can be clobbered by
  # AccessModifierIndentation's correction.
  it 'can correct indentation and another thing' 


  # A case where the same cop could try to correct an offense twice in one
  # place.
  it 'can correct empty line inside special form of nested modules' 


  it 'can correct single line methods' 


  # In this example, the auto-correction (changing "fail" to "raise")
  # creates a new problem (alignment of parameters), which is also
  # corrected automatically.
  it 'can correct a problems and the problem it creates' 


  # Thanks to repeated auto-correction, we can get rid of the trailing
  # spaces, and then the extra empty line.
  it 'can correct two problems in the same place' 


  it 'can correct MethodDefParentheses and other offense' 


  it 'can correct WordArray and SpaceAfterComma offenses' 


  it 'can correct SpaceAfterComma and HashSyntax offenses' 


  it 'can correct HashSyntax and SpaceAroundOperators offenses' 


  it 'can correct HashSyntax when --only is used' 


  it 'can correct TrailingBlankLines and TrailingWhitespace offenses' 


  it 'can correct MethodCallWithoutArgsParentheses and EmptyLiteral offenses' 


  it 'can correct IndentHash offenses with separator style' 


  it 'does not say [Corrected] if correction was avoided' 


  it 'does not hang SpaceAfterPunctuation and SpaceInsideParens' 


  it 'does not hang SpaceAfterPunctuation and ' \
     'SpaceInsideArrayLiteralBrackets' do
    create_file('example.rb', 'puts [1, ]')
    Timeout.timeout(10) do
      expect(cli.run(%w[--auto-correct])).to eq(0)
    end
    expect($stderr.string).to eq('')
    expect(IO.read('example.rb')).to eq("puts [1]\n")
  end

  it 'can be disabled for any cop in configuration' 


  it 'handles different SpaceInsideBlockBraces and ' \
     'SpaceInsideHashLiteralBraces' do
    create_file('example.rb', <<-RUBY.strip_indent)
      {foo: bar,
       bar: baz,}
      foo.each {bar;}
    RUBY
    create_file('.rubocop.yml', <<-YAML.strip_indent)
      Layout/SpaceInsideBlockBraces:
        EnforcedStyle: space
      Layout/SpaceInsideHashLiteralBraces:
        EnforcedStyle: no_space
      Style/TrailingCommaInHashLiteral:
        EnforcedStyleForMultiline: consistent_comma
    YAML
    expect(cli.run(%w[--auto-correct])).to eq(1)
    expect($stderr.string).to eq('')
    expect(IO.read('example.rb')).to eq(<<-RUBY.strip_indent)
      {foo: bar,
       bar: baz,}
      foo.each { bar; }
    RUBY
  end

  it 'corrects BracesAroundHashParameters offenses leaving the ' \
     'MultilineHashBraceLayout offense unchanged' do
    create_file('example.rb', <<-RUBY.strip_indent)
      def method_a
        do_something({ a: 1,
        })
      end
    RUBY

    expect($stderr.string).to eq('')
    expect(cli.run(%w[--auto-correct])).to eq(0)
    expect(IO.read('example.rb')).to eq(<<-RUBY.strip_indent)
      def method_a
        do_something(a: 1)
      end
    RUBY
  end
end

