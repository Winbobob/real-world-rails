# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceBeforeFirstArg, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'AllowForAlignment' => true } }

  context 'for method calls without parentheses' do
    it 'registers an offense for method call with two spaces before the ' \
       'first arg' do
      inspect_source(<<-RUBY.strip_indent)
        something  x
        a.something  y, z
      RUBY
      expect(cop.messages)
        .to eq(['Put one space between the method name and the first ' \
                'argument.'] * 2)
      expect(cop.highlights).to eq(['  ', '  '])
    end

    it 'auto-corrects extra space' 


    it 'registers an offense for method call with no spaces before the '\
       'first arg' do
      inspect_source(<<-RUBY.strip_indent)
        something'hello'
        a.something'hello world'
      RUBY
      expect(cop.messages)
        .to eq(['Put one space between the method name and the first ' \
                'argument.'] * 2)
    end

    it 'auto-corrects missing space' 


    it 'accepts a method call with one space before the first arg' 


    it 'accepts + operator' 


    it 'accepts setter call' 


    it 'accepts multiple space containing line break' 


    context 'when AllowForAlignment is true' do
      it 'accepts method calls with aligned first arguments' 

    end

    context 'when AllowForAlignment is false' do
      let(:cop_config) { { 'AllowForAlignment' => false } }

      it 'does not accept method calls with aligned first arguments' 

    end
  end

  context 'for method calls with parentheses' do
    it 'accepts a method call without space' 


    it 'accepts a method call with space after the left parenthesis' 

  end
end

