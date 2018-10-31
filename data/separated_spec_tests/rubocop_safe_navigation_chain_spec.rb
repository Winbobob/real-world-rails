# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::SafeNavigationChain, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'Whitelist' => %w[present? blank? try presence] }
  end

  shared_examples :accepts do |name, code|
    it "accepts usages of #{name}" 

  end

  context 'TargetRubyVersion >= 2.3', :ruby23 do
    [
      ['ordinary method chain', 'x.foo.bar.baz'],
      ['ordinary method chain with argument', 'x.foo(x).bar(y).baz(z)'],
      ['method chain with safe navigation only', 'x&.foo&.bar&.baz'],
      ['method chain with safe navigation only with argument',
       'x&.foo(x)&.bar(y)&.baz(z)'],
      ['safe navigation at last only', 'x.foo.bar&.baz'],
      ['safe navigation at last only with argument', 'x.foo(x).bar(y)&.baz(z)'],
      ['safe navigation with == operator', 'x&.foo == bar'],
      ['safe navigation with === operator', 'x&.foo === bar'],
      ['safe navigation with || operator', 'x&.foo || bar'],
      ['safe navigation with && operator', 'x&.foo && bar'],
      ['safe navigation with | operator', 'x&.foo | bar'],
      ['safe navigation with & operator', 'x&.foo & bar'],
      ['safe navigation with `nil?` method', 'x&.foo.nil?'],
      ['safe navigation with `present?` method', 'x&.foo.present?'],
      ['safe navigation with `blank?` method', 'x&.foo.blank?'],
      ['safe navigation with `try` method', 'a&.b.try(:c)'],
      ['safe navigation with assignment method', 'x&.foo = bar'],
      ['safe navigation with self assignment method', 'x&.foo += bar']
    ].each do |name, code|
      include_examples :accepts, name, code
    end

    it 'registers an offense for ordinary method call exists after ' \
      'safe navigation method call' do
      expect_offense(<<-RUBY.strip_indent)
        x&.foo.bar
              ^^^^ Do not chain ordinary method call after safe navigation operator.
      RUBY
    end

    it 'registers an offense for ordinary method call exists after ' \
      'safe navigation method call with an argument' do
      expect_offense(<<-RUBY.strip_indent)
        x&.foo(x).bar(y)
                 ^^^^^^^ Do not chain ordinary method call after safe navigation operator.
      RUBY
    end

    it 'registers an offense for ordinary method chain exists after ' \
      'safe navigation method call' do
      expect_offense(<<-RUBY.strip_indent)
        something
        x&.foo.bar.baz
              ^^^^^^^^ Do not chain ordinary method call after safe navigation operator.
      RUBY
    end

    it 'registers an offense for ordinary method chain exists after ' \
      'safe navigation method call with an argument' do
      expect_offense(<<-RUBY.strip_indent)
        x&.foo(x).bar(y).baz(z)
                 ^^^^^^^^^^^^^^ Do not chain ordinary method call after safe navigation operator.
      RUBY
    end

    it 'registers an offense for ordinary method chain exists after ' \
      'safe navigation method call with a block-pass' do
      expect_offense(<<-RUBY.strip_indent)
        something
        x&.select(&:foo).bar
                        ^^^^ Do not chain ordinary method call after safe navigation operator.
      RUBY
    end

    it 'registers an offense for ordinary method chain exists after ' \
      'safe navigation method call with a block' do
      expect_offense(<<-RUBY.strip_indent)
        something
        x&.select { |x| foo(x) }.bar
                                ^^^^ Do not chain ordinary method call after safe navigation operator.
      RUBY
    end

    it 'registers an offense for safe navigation with < operator' 


    it 'registers an offense for safe navigation with > operator' 


    it 'registers an offense for safe navigation with <= operator' 


    it 'registers an offense for safe navigation with >= operator' 


    it 'registers an offense for safe navigation with + operator' 


    it 'registers an offense for safe navigation with [] operator' 


    it 'registers an offense for safe navigation with []= operator' 


    context 'proper highlighting' do
      it 'when there are methods before' 


      it 'when there are methods after' 


      it 'when in a method' 


      it 'when in a begin' 


      it 'when used with a modifier if' 

    end
  end
end

