# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::SignalException, :config do
  subject(:cop) { described_class.new(config) }

  context 'when enforced style is `semantic`' do
    let(:cop_config) { { 'EnforcedStyle' => 'semantic' } }

    it 'registers an offense for raise in begin section' 


    it 'registers an offense for raise in def body' 


    it 'registers an offense for fail in rescue section' 


    it 'accepts raise in rescue section' 


    it 'accepts raise in def with multiple rescues' 


    it 'registers an offense for fail in def rescue section' 


    it 'registers an offense for fail in second rescue' 


    it 'registers only offense for one raise that should be fail' 


    it 'accepts raise in def rescue section' 


    it 'accepts `raise` and `fail` with explicit receiver' 


    it 'registers an offense for `raise` and `fail` with `Kernel` as ' \
       'explicit receiver' do
      expect_offense(<<-RUBY.strip_indent)
        def test
          Kernel.raise
                 ^^^^^ Use `fail` instead of `raise` to signal exceptions.
        rescue Exception
          Kernel.fail
                 ^^^^ Use `raise` instead of `fail` to rethrow exceptions.
        end
      RUBY
    end

    it 'registers an offense for raise not in a begin/rescue/end' 


    it 'registers one offense for each raise' 


    it 'is not confused by nested begin/rescue' 


    it 'auto-corrects raise to fail when appropriate' 


    it 'auto-corrects fail to raise when appropriate' 

  end

  context 'when enforced style is `raise`' do
    let(:cop_config) { { 'EnforcedStyle' => 'only_raise' } }

    it 'registers an offense for fail in begin section' 


    it 'registers an offense for fail in def body' 


    it 'registers an offense for fail in rescue section' 


    it 'accepts `fail` if a custom `fail` instance method is defined' 


    it 'accepts `fail` if a custom `fail` singleton method is defined' 


    it 'accepts `fail` with explicit receiver' 


    it 'registers an offense for `fail` with `Kernel` as explicit receiver' 


    it 'auto-corrects fail to raise always' 

  end

  context 'when enforced style is `fail`' do
    let(:cop_config) { { 'EnforcedStyle' => 'only_fail' } }

    it 'registers an offense for raise in begin section' 


    it 'registers an offense for raise in def body' 


    it 'registers an offense for raise in rescue section' 


    it 'accepts `raise` with explicit receiver' 


    it 'registers an offense for `raise` with `Kernel` as explicit receiver' 


    it 'auto-corrects raise to fail always' 

  end
end

