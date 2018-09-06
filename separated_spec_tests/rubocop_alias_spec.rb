# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::Alias, :config do
  subject(:cop) { described_class.new(config) }

  context 'when EnforcedStyle is prefer_alias_method' do
    let(:cop_config) { { 'EnforcedStyle' => 'prefer_alias_method' } }

    it 'registers an offense for alias with symbol args' 


    it 'autocorrects alias with symbol args' 


    it 'registers an offense for alias with bareword args' 


    it 'autocorrects alias with bareword args' 


    it 'does not register an offense for alias_method' 


    it 'does not register an offense for alias with gvars' 


    it 'does not register an offense for alias in an instance_eval block' 

  end

  context 'when EnforcedStyle is prefer_alias' do
    let(:cop_config) { { 'EnforcedStyle' => 'prefer_alias' } }

    it 'registers an offense for alias with symbol args' 


    it 'autocorrects alias with symbol args' 


    it 'does not register an offense for alias with bareword args' 


    it 'registers an offense for alias_method at the top level' 


    it 'autocorrects alias_method at the top level' 


    it 'registers an offense for alias_method in a class block' 


    it 'autocorrects alias_method in a class block' 


    it 'registers an offense for alias_method in a module block' 


    it 'autocorrects alias_method in a module block' 


    it 'does not register an offense for alias_method with explicit receiver' 


    it 'does not register an offense for alias_method in a method def' 


    it 'does not register an offense for alias_method in self.method def' 


    it 'does not register an offense for alias_method in a block' 


    it 'does not register an offense for alias_method with non-literal '\
       'argument' do
      expect_no_offenses(<<-RUBY.strip_indent)
        alias_method :bar, FOO
      RUBY
    end

    it 'does not register an offense for alias_method with non-literal ' \
       'argument' do
      expect_no_offenses(<<-RUBY.strip_indent)
        alias_method :baz, foo.bar
      RUBY
    end

    it 'does not register an offense for alias in an instance_eval block' 

  end
end

