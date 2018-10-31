# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Metrics::LineLength, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Max' => 80, 'IgnoredPatterns' => nil } }

  it "registers an offense for a line that's 81 characters wide" 


  it 'highlights excessive characters' 


  it "accepts a line that's 80 characters wide" 


  it 'registers an offense for long line before __END__ but not after' 


  context 'when AllowURI option is enabled' do
    let(:cop_config) { { 'Max' => 80, 'AllowURI' => true } }

    context 'and all the excessive characters are part of an URL' do
      it 'accepts the line' 


      context 'and the URL is wrapped in single quotes' do
        it 'accepts the line' 

      end

      context 'and the URL is wrapped in double quotes' do
        it 'accepts the line' 

      end
    end

    context 'and the excessive characters include a complete URL' do
      it 'registers an offense for the line' 

    end

    context 'and the excessive characters include part of an URL ' \
            'and another word' do
      it 'registers an offense for the line' 

    end

    context 'and an error other than URI::InvalidURIError is raised ' \
            'while validating an URI-ish string' do
      let(:cop_config) do
        { 'Max' => 80, 'AllowURI' => true, 'URISchemes' => %w[LDAP] }
      end

      let(:source) { <<-RUBY }
        xxxxxxxxxxxxxxxxxxxxxxxxxxxxzxxxxxxxxxxx = LDAP::DEFAULT_GROUP_UNIQUE_MEMBER_LIST_KEY
      RUBY

      it 'does not crash' 

    end

    context 'and the URL does not have a http(s) scheme' do
      let(:source) { <<-RUBY }
        xxxxxxxxxxxxxxxxxxxxxxxxxxxxzxxxxxxxxxxx = 'otherprotocol://a.very.long.line.which.violates.LineLength/sadf'
      RUBY

      it 'rejects the line' 


      context 'and the scheme has been configured' do
        let(:cop_config) do
          { 'Max' => 80, 'AllowURI' => true, 'URISchemes' => %w[otherprotocol] }
        end

        it 'does not register an offense' 

      end
    end
  end

  context 'when IgnoredPatterns option is set' do
    let(:cop_config) do
      {
        'Max' => 18,
        'IgnoredPatterns' => ['^\s*test\s', /^\s*def\s+test_/]
      }
    end

    let(:source) do
      <<-RUBY.strip_indent
        class ExampleTest < TestCase
          test 'some really long test description which exceeds length' do
          end
          def test_some_other_long_test_description_which_exceeds_length
          end
        end
      RUBY
    end

    it 'accepts long lines matching a pattern but not other long lines' 

  end

  context 'when AllowHeredoc option is enabled' do
    let(:cop_config) { { 'Max' => 80, 'AllowHeredoc' => true } }

    let(:source) { <<-RUBY }
      <<-SQL
        SELECT posts.id, posts.title, users.name FROM posts LEFT JOIN users ON posts.user_id = users.id;
      SQL
    RUBY

    it 'accepts long lines in heredocs' 


    context 'when the source has no AST' do
      let(:source) { '# this results in AST being nil' }

      it 'does not crash' 

    end

    context 'and only certain heredoc delimiters are whitelisted' do
      let(:cop_config) do
        { 'Max' => 80, 'AllowHeredoc' => %w[SQL OK], 'IgnoredPatterns' => [] }
      end

      let(:source) { <<-RUBY }
        foo(<<-DOC, <<-SQL, <<-FOO)
          1st offense: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
          \#{<<-OK}
            no offense (whitelisted): Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
          OK
          2nd offense: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        DOC
          no offense (whitelisted): Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
          \#{<<-XXX}
            no offense (nested inside whitelisted): Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
          XXX
          no offense (whitelisted): Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        SQL
          3rd offense: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
          \#{<<-SQL}
            no offense (whitelisted): Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
          SQL
          4th offense: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        FOO
      RUBY

      it 'rejects long lines in heredocs with not whitelisted delimiters' 

    end
  end

  context 'when AllowURI option is disabled' do
    let(:cop_config) { { 'Max' => 80, 'AllowURI' => false } }

    context 'and all the excessive characters are part of an URL' do
      it 'registers an offense for the line' 

    end
  end

  context 'when IgnoreCopDirectives is disabled' do
    let(:cop_config) { { 'Max' => 80, 'IgnoreCopDirectives' => false } }

    context 'and the source is acceptable length' do
      let(:acceptable_source) { 'a' * 80 }

      context 'with a trailing Rubocop directive' do
        let(:cop_directive) { ' # rubcop:disable Metrics/SomeCop' }
        let(:source) { acceptable_source + cop_directive }

        it 'registers an offense for the line' 


        it 'highlights the excess directive' 

      end

      context 'with an inline comment' do
        let(:excess_comment) { ' ###' }
        let(:source) { acceptable_source + excess_comment }

        it 'highlights the excess comment' 

      end
    end

    context 'and the source is too long and has a trailing cop directive' do
      let(:excess_with_directive) { 'b # rubocop:disable Metrics/AbcSize' }
      let(:source) { 'a' * 80 + excess_with_directive }

      it 'highlights the excess source and cop directive' 

    end
  end

  context 'when IgnoreCopDirectives is enabled' do
    let(:cop_config) { { 'Max' => 80, 'IgnoreCopDirectives' => true } }

    context 'and the Rubocop directive is excessively long' do
      let(:source) { <<-RUBY }
        # rubocop:disable Metrics/SomeReallyLongMetricNameThatShouldBeMuchShorterAndNeedsANameChange
      RUBY

      it 'accepts the line' 

    end

    context 'and the Rubocop directive causes an excessive line length' do
      let(:source) { <<-RUBY }
        def method_definition_that_is_just_under_the_line_length_limit(foo, bar) # rubocop:disable Metrics/AbcSize
          # complex method
        end
      RUBY

      it 'accepts the line' 


      context 'and has explanatory text' do
        let(:source) { <<-RUBY }
          def method_definition_that_is_just_under_the_line_length_limit(foo) # rubocop:disable Metrics/AbcSize inherently complex!
            # complex
          end
        RUBY

        it 'does not register an offense' 

      end
    end

    context 'and the source is too long' do
      let(:source) { 'a' * 80 + 'bcd' + ' # rubocop:enable Style/ClassVars' }

      it 'registers an offense for the line' 


      it 'highlights only the non-directive part' 


      context 'and the source contains non-directive # as comment' do
        let(:source) { <<-RUBY }
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa # bbbbbbbbbbbbbb # rubocop:enable Style/ClassVars'
        RUBY

        it 'registers an offense for the line' 


        it 'highlights only the non-directive part' 

      end

      context 'and the source contains non-directive #s as non-comment' do
        let(:source) { <<-RUBY }
          LARGE_DATA_STRING_PATTERN = %r{\A([A-Za-z0-9\+\/#]*\={0,2})#([A-Za-z0-9\+\/#]*\={0,2})#([A-Za-z0-9\+\/#]*\={0,2})\z} # rubocop:disable LineLength
        RUBY

        it 'registers an offense for the line' 


        it 'highlights only the non-directive part' 

      end
    end
  end

  context 'affecting by IndentationWidth from Layout\Tab' do
    shared_examples 'with tabs indentation' do
      it "registers an offense for a line that's including 2 tab with size 2" \
         ' and 28 other characters' do
        inspect_source("\t\t" + '#' * 28)
        expect(cop.offenses.size).to eq(1)
        expect(cop.offenses.first.message).to eq('Line is too long. [32/30]')
        expect(cop.config_to_allow_offenses)
          .to eq(exclude_limit: { 'Max' => 32 })
      end

      it 'highlights excessive characters' 


      it "accepts a line that's including 1 tab with size 2" \
         ' and 28 other characters' do
        expect_no_offenses("\t" + '#' * 28)
      end
    end

    context 'without AllowURI option' do
      let(:config) do
        RuboCop::Config.new(
          'Layout/IndentationWidth' => {
            'Width' => 1
          },
          'Layout/Tab' => {
            'Enabled' => false,
            'IndentationWidth' => 2
          },
          'Metrics/LineLength' => {
            'Max' => 30
          }
        )
      end

      it_behaves_like 'with tabs indentation'
    end

    context 'with AllowURI option' do
      let(:config) do
        RuboCop::Config.new(
          'Layout/IndentationWidth' => {
            'Width' => 1
          },
          'Layout/Tab' => {
            'Enabled' => false,
            'IndentationWidth' => 2
          },
          'Metrics/LineLength' => {
            'Max' => 30,
            'AllowURI' => true
          }
        )
      end

      it_behaves_like 'with tabs indentation'

      it "accepts a line that's including URI" 


      it "accepts a line that's including URI and exceeds by 1 char" 


      it "accepts a line that's including URI with text" 


      it "accepts a line that's including URI in quotes with text" 

    end
  end
end

