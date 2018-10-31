# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::PercentLiteralDelimiters, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'PreferredDelimiters' => { 'default' => '[]' } }
  end

  context '`default` override' do
    let(:cop_config) do
      {
        'PreferredDelimiters' => {
          'default' => '[]',
          '%' => '()'
        }
      }
    end

    it 'allows all preferred delimiters to be set with one key' 


    it 'allows individual preferred delimiters to override `default`' 

  end

  context 'invalid cop config' do
    let(:cop_config) { { 'PreferredDelimiters' => { 'foobar' => '()' } } }

    it 'raises an error when invalid configuration is specified' 

  end

  context '`%` interpolated string' do
    it 'does not register an offense for preferred delimiters' 


    it 'registers an offense for other delimiters' 


    it 'does not register an offense for other delimiters ' \
       'when containing preferred delimiter characters' do
      expect_no_offenses(<<-RUBY.strip_indent)
        %([string])
      RUBY
    end

    it 'registers an offense for other delimiters ' \
       'when containing preferred delimiter characters in interpolation' do
      expect_offense(<<-'RUBY'.strip_indent)
        %(#{[1].first})
        ^^^^^^^^^^^^^^^ `%`-literals should be delimited by `[` and `]`.
      RUBY
    end
  end

  context '`%q` string' do
    it 'does not register an offense for preferred delimiters' 


    it 'registers an offense for other delimiters' 


    it 'does not register an offense for other delimiters ' \
       'when containing preferred delimiter characters' do
      expect_no_offenses(<<-RUBY.strip_indent)
        %q([string])
      RUBY
    end
  end

  context '`%Q` interpolated string' do
    it 'does not register an offense for preferred delimiters' 


    it 'registers an offense for other delimiters' 


    it 'does not register an offense for other delimiters ' \
       'when containing preferred delimiter characters' do
      expect_no_offenses(<<-RUBY.strip_indent)
        %Q([string])
      RUBY
    end

    it 'registers an offense for other delimiters ' \
       'when containing preferred delimiter characters in interpolation' do
      expect_offense(<<-'RUBY'.strip_indent)
        %Q(#{[1].first})
        ^^^^^^^^^^^^^^^^ `%Q`-literals should be delimited by `[` and `]`.
      RUBY
    end
  end

  context '`%w` string array' do
    it 'does not register an offense for preferred delimiters' 


    it 'does not register an offense for preferred delimiters ' \
       'with a pairing delimiters' do
      expect_no_offenses('%w(\(some words\))')
    end

    it 'does not register an offense for preferred delimiters ' \
       'with only a closing delimiter' do
      expect_no_offenses('%w(only closing delimiter charapter\))')
    end

    it 'does not register an offense for preferred delimiters ' \
       'with not a pairing delimiter' do
      expect_no_offenses('%w|\|not pairirng delimiter|')
    end

    it 'registers an offense for other delimiters' 


    it 'does not register an offense for other delimiters ' \
       'when containing preferred delimiter characters' do
      expect_no_offenses('%w([some] [words])')
    end
  end

  context '`%W` interpolated string array' do
    it 'does not register an offense for preferred delimiters' 


    it 'registers an offense for other delimiters' 


    it 'does not register an offense for other delimiters ' \
       'when containing preferred delimiter characters' do
      expect_no_offenses('%W([some] [words])')
    end

    it 'registers an offense for other delimiters ' \
       'when containing preferred delimiter characters in interpolation' do
      expect_offense(<<-'RUBY'.strip_indent)
        %W(#{[1].first})
        ^^^^^^^^^^^^^^^^ `%W`-literals should be delimited by `[` and `]`.
      RUBY
    end
  end

  context '`%r` interpolated regular expression' do
    it 'does not register an offense for preferred delimiters' 


    it 'registers an offense for other delimiters' 


    it 'does not register an offense for other delimiters ' \
       'when containing preferred delimiter characters' do
      expect_no_offenses('%r([regexp])')
    end

    it 'registers an offense for other delimiters ' \
       'when containing preferred delimiter characters in interpolation' do
      expect_offense(<<-'RUBY'.strip_indent)
        %r(#{[1].first})
        ^^^^^^^^^^^^^^^^ `%r`-literals should be delimited by `[` and `]`.
      RUBY
    end
  end

  context '`%i` symbol array' do
    it 'does not register an offense for preferred delimiters' 


    it 'registers an offense for other delimiters' 

  end

  context '`%I` interpolated symbol array' do
    it 'does not register an offense for preferred delimiters' 


    it 'registers an offense for other delimiters' 


    it 'registers an offense for other delimiters ' \
       'when containing preferred delimiter characters in interpolation' do
      expect_offense(<<-'RUBY'.strip_indent)
        %I(#{[1].first})
        ^^^^^^^^^^^^^^^^ `%I`-literals should be delimited by `[` and `]`.
      RUBY
    end
  end

  context '`%s` symbol' do
    it 'does not register an offense for preferred delimiters' 


    it 'registers an offense for other delimiters' 

  end

  context '`%x` interpolated system call' do
    it 'does not register an offense for preferred delimiters' 


    it 'registers an offense for other delimiters' 


    it 'does not register an offense for other delimiters ' \
       'when containing preferred delimiter characters' do
      expect_no_offenses('%x([command])')
    end

    it 'registers an offense for other delimiters ' \
       'when containing preferred delimiter characters in interpolation' do
      expect_offense(<<-'RUBY'.strip_indent)
        %x(#{[1].first})
        ^^^^^^^^^^^^^^^^ `%x`-literals should be delimited by `[` and `]`.
      RUBY
    end
  end

  context 'auto-correct' do
    it 'fixes a string' 


    it 'fixes a string with no content' 


    it 'fixes a string array' 


    it 'fixes a string array in a scope' 


    it 'fixes a regular expression' 


    it 'fixes a string with interpolation' 


    it 'fixes a regular expression with interpolation' 


    it 'fixes a regular expression with option' 


    it 'preserves line breaks when fixing a multiline array' 


    it 'preserves indentation when correcting a multiline array' 


    it 'preserves irregular indentation when correcting a multiline array' 


    shared_examples 'escape characters' do |percent_literal|
      it "corrects #{percent_literal} with \\n in it" 


      it "corrects #{percent_literal} with \\t in it" 

    end

    it_behaves_like('escape characters', '%')
    it_behaves_like('escape characters', '%q')
    it_behaves_like('escape characters', '%Q')
    it_behaves_like('escape characters', '%s')
    it_behaves_like('escape characters', '%w')
    it_behaves_like('escape characters', '%W')
    it_behaves_like('escape characters', '%x')
    it_behaves_like('escape characters', '%r')
    it_behaves_like('escape characters', '%i')
  end
end

