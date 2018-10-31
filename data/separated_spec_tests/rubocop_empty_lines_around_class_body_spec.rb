# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::EmptyLinesAroundClassBody, :config do
  subject(:cop) { described_class.new(config) }

  let(:extra_begin) { 'Extra empty line detected at class body beginning.' }
  let(:extra_end) { 'Extra empty line detected at class body end.' }
  let(:missing_begin) { 'Empty line missing at class body beginning.' }
  let(:missing_end) { 'Empty line missing at class body end.' }
  let(:missing_def) { 'Empty line missing before first def definition' }
  let(:missing_type) { 'Empty line missing before first class definition' }

  context 'when EnforcedStyle is no_empty_lines' do
    let(:cop_config) { { 'EnforcedStyle' => 'no_empty_lines' } }

    it 'registers an offense for class body starting with a blank' 


    it 'autocorrects class body containing only a blank' 


    it 'registers an offense for class body ending with a blank' 


    it 'registers an offense for singleton class body starting with a blank' 


    it 'autocorrects singleton class body containing only a blank' 


    it 'registers an offense for singleton class body ending with a blank' 

  end

  context 'when EnforcedStyle is empty_lines' do
    let(:cop_config) { { 'EnforcedStyle' => 'empty_lines' } }

    it 'registers an offense for class body not starting or ending with a ' \
       'blank' do
      inspect_source(<<-RUBY.strip_indent)
        class SomeClass
          do_something
        end
      RUBY
      expect(cop.messages).to eq([missing_begin, missing_end])
    end

    it 'ignores classes with an empty body' 


    it 'autocorrects beginning and end' 


    it 'registers an offense for singleton class body not starting or ending ' \
       'with a blank' do
      inspect_source(<<-RUBY.strip_indent)
        class << self
          do_something
        end
      RUBY
      expect(cop.messages).to eq([missing_begin, missing_end])
    end

    it 'ignores singleton classes with an empty body' 


    it 'autocorrects beginning and end for `class << self`' 

  end

  context 'when EnforcedStyle is empty_lines_except_namespace' do
    let(:cop_config) { { 'EnforcedStyle' => 'empty_lines_except_namespace' } }

    context 'when only child is class' do
      it 'requires no empty lines for namespace' 


      it 'registers offence for namespace body starting with a blank' 


      it 'registers offence for namespace body ending with a blank' 


      it 'registers offences for namespaced class body not starting '\
          'with a blank' do
        inspect_source(<<-RUBY.strip_indent)
          class Parent
            class Child
              do_something

            end
          end
        RUBY
        expect(cop.messages).to eq([missing_begin])
      end

      it 'registers offences for namespaced class body not ending '\
          'with a blank' do
        inspect_source(<<-RUBY.strip_indent)
          class Parent
            class Child

              do_something
            end
          end
        RUBY
        expect(cop.messages).to eq([missing_end])
      end

      it 'autocorrects beginning and end' 

    end

    context 'when only child is module' do
      it 'requires no empty lines for namespace' 


      it 'registers offence for namespace body starting with a blank' 


      it 'registers offence for namespace body ending with a blank' 

    end

    context 'when has multiple child classes' do
      it 'requires empty lines for namespace' 


      it 'registers offences for namespace body starting '\
        'and ending without a blank' do
        inspect_source(<<-RUBY.strip_indent)
          class Parent
            class Mom

              do_something

            end
            class Dad

            end
          end
        RUBY
        expect(cop.messages).to eq([missing_begin, missing_end])
      end
    end
  end

  context 'when EnforcedStyle is beginning_only' do
    let(:cop_config) { { 'EnforcedStyle' => 'beginning_only' } }

    it 'ignores empty lines at the beginning of a class' 


    it 'registers an offense for an empty line at the end of a class' 


    it 'autocorrects end' 

  end

  context 'when EnforcedStyle is ending_only' do
    let(:cop_config) { { 'EnforcedStyle' => 'ending_only' } }

    it 'ignores empty lines at the beginning of a class' 


    it 'registers an offense for an empty line at the end of a class' 


    it 'autocorrects end' 

  end

  include_examples 'empty_lines_around_class_or_module_body', 'class'
end

