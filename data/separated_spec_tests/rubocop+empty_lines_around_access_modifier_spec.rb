# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::EmptyLinesAroundAccessModifier do
  subject(:cop) { described_class.new }

  %w[private protected public module_function].each do |access_modifier|
    it "requires blank line before #{access_modifier}" 


    it "requires blank line after #{access_modifier}" 


    it "ignores comment line before #{access_modifier}" 


    it "ignores #{access_modifier} inside a method call" 


    it "ignores #{access_modifier} deep inside a method call" 


    it "ignores #{access_modifier} with a right-hand-side condition" 


    it "autocorrects blank line before #{access_modifier}" 


    it 'autocorrects blank line after #{access_modifier}' 


    it 'autocorrects blank line after #{access_modifier} with comment' 


    it 'accepts missing blank line when at the beginning of class' 


    it 'accepts missing blank line when at the beginning of module' 


    it 'accepts missing blank line when at the beginning of sclass' 


    it 'accepts missing blank line when specifying a superclass ' \
       'that breaks the line' do
      expect_no_offenses(<<-RUBY.strip_indent)
        class Foo <
              Bar
          #{access_modifier}

          def do_something
          end
        end
      RUBY
    end

    it 'accepts missing blank line when specifying `self` ' \
       'that breaks the line' do
      expect_no_offenses(<<-RUBY.strip_indent)
        class <<
              self
          #{access_modifier}

          def do_something
          end
        end
      RUBY
    end

    it 'accepts missing blank line when at the beginning of file' \
       'when specifying a superclass that breaks the line' do
      expect_no_offenses(<<-RUBY.strip_indent)
        #{access_modifier}

        def do_something
        end
      RUBY
    end

    it "requires blank line after, but not before, #{access_modifier} " \
       'when at the beginning of class/module' do
      inspect_source(<<-RUBY.strip_indent)
        class Test
          #{access_modifier}
          def test
          end
        end
      RUBY
      expect(cop.offenses.size).to eq(1)
      expect(cop.messages)
        .to eq(["Keep a blank line after `#{access_modifier}`."])
    end

    context 'at the beginning of block' do
      context 'for blocks defined with do' do
        it 'accepts missing blank line' 


        it 'accepts missing blank line with arguments' 


        it "requires blank line after, but not before, #{access_modifier}" 

      end

      context 'for blocks defined with {}' do
        it 'accepts missing blank line' 


        it 'accepts missing blank line with arguments' 

      end
    end

    it 'accepts missing blank line when at the end of block' 


    it 'requires blank line when next line started with end' 


    it 'recognizes blank lines with DOS style line endings' 

  end
end

