# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::UnneededCondition do
  subject(:cop) { described_class.new }

  context 'when regular condition (if)' do
    it 'registers no offense' 


    it 'registers no offense for elsif' 


    context 'when condition and if_branch are same' do
      it 'registers an offense' 


      context 'when else_branch is complex' do
        it 'registers no offense' 

      end

      context 'when using elsif branch' do
        it 'registers no offense' 

      end

      context 'when using modifier if' do
        it 'registers an offense' 

      end

      context 'when using ternary if in `else` branch' do
        it 'registers no offense' 

      end
    end

    describe '#autocorrection' do
      it 'auto-corrects offense' 


      it 'auto-corrects multiline sendNode offense' 


      it 'auto-corrects one-line node offense' 


      it 'auto-corrects modifier nodes offense' 


      it 'auto-corrects modifer if statements' 


      it 'auto-corrects when using `<<` method higher precedence ' \
         'than `||` operator' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          ary << if foo
                   foo
                 else
                   bar
                 end
        RUBY

        expect(new_source).to eq(<<-RUBY.strip_indent)
          ary << (foo || bar)
        RUBY
      end
    end
  end

  context 'when ternary expression (?:)' do
    it 'registers no offense' 


    context 'when condition and if_branch are same' do
      it 'registers an offense' 

    end

    describe '#autocorrection' do
      it 'auto-corrects vars' 


      it 'auto-corrects nested vars' 


      it 'auto-corrects class vars' 


      it 'auto-corrects functions' 

    end
  end
end

