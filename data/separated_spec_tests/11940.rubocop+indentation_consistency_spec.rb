# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::IndentationConsistency, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'EnforcedStyle' => 'normal' } }

  context 'with top-level code' do
    it 'accepts an empty expression string interpolation' 

  end

  context 'with if statement' do
    it 'registers an offense for bad indentation in an if body' 


    it 'registers an offense for bad indentation in an else body' 


    it 'registers an offense for bad indentation in an elsif body' 


    it 'autocorrects bad indentation' 


    it 'accepts a one line if statement' 


    it 'accepts a correctly aligned if/elsif/else/end' 


    it 'accepts if/elsif/else/end laid out as a table' 


    it 'accepts if/then/else/end laid out as another table' 


    it 'accepts if/elsif/else/end with fullwidth characters' 


    it 'accepts an empty if' 


    it 'accepts an if in assignment with end aligned with variable' 


    it 'accepts an if/else in assignment with end aligned with variable' 


    it 'accepts an if/else in assignment with end aligned with variable ' \
       'and chaining after the end' do
      expect_no_offenses(<<-RUBY.strip_indent)
        var = if a
          0
        else
          1
        end.abc.join("")
      RUBY
    end

    it 'accepts an if/else in assignment with end aligned with variable ' \
       'and chaining with a block after the end' do
      expect_no_offenses(<<-RUBY.strip_indent)
        var = if a
          0
        else
          1
        end.abc.tap {}
      RUBY
    end

    it 'accepts an if in assignment with end aligned with if' 


    it 'accepts an if/else in assignment with end aligned with if' 


    it 'accepts an if/else in assignment on next line with end aligned ' \
       'with if' do
      expect_no_offenses(<<-RUBY.strip_indent)
        var =
          if a
            0
          else
            1
          end
      RUBY
    end

    it 'accepts an if/else branches with rescue clauses' 

  end

  context 'with unless' do
    it 'registers an offense for bad indentation in an unless body' 


    it 'accepts an empty unless' 

  end

  context 'with case' do
    it 'registers an offense for bad indentation in a case/when body' 


    it 'registers an offense for bad indentation in a case/else body' 


    it 'accepts correctly indented case/when/else' 


    it 'accepts case/when/else laid out as a table' 


    it 'accepts case/when/else with then beginning a line' 


    it 'accepts indented when/else plus indented body' 

  end

  context 'with while/until' do
    it 'registers an offense for bad indentation in a while body' 


    it 'registers an offense for bad indentation in begin/end/while' 


    it 'registers an offense for bad indentation in an until body' 


    it 'accepts an empty while' 

  end

  context 'with for' do
    it 'registers an offense for bad indentation in a for body' 


    it 'accepts an empty for' 

  end

  context 'with def/defs' do
    it 'registers an offense for bad indentation in a def body' 


    it 'registers an offense for bad indentation in a defs body' 


    it 'accepts an empty def body' 


    it 'accepts an empty defs body' 

  end

  context 'with class' do
    context 'with rails style configured' do
      let(:cop_config) { { 'EnforcedStyle' => 'rails' } }

      it 'accepts different indentation in different visibility sections' 

    end

    context 'with normal style configured' do
      it 'registers an offense for bad indentation in a class body' 


      it 'accepts an empty class body' 


      it 'accepts indented public, protected, and private' 


      it 'registers an offense for bad indentation in def but not for ' \
         'outdented public, protected, and private' do
        expect_offense(<<-RUBY.strip_indent)
          class Test
          public

            def e
            end

          protected

            def f
            end

          private

           def g
           ^^^^^ Inconsistent indentation detected.
           end
          end
        RUBY
      end
    end
  end

  context 'with module' do
    it 'registers an offense for bad indentation in a module body' 


    it 'accepts an empty module body' 


    it 'registers an offense for bad indentation of private methods' 


    context 'even when there are no public methods' do
      it 'still registers an offense for bad indentation of private methods' 

    end
  end

  context 'with block' do
    it 'registers an offense for bad indentation in a do/end body' 


    it 'registers an offense for bad indentation in a {} body' 


    it 'accepts a correctly indented block body' 


    it 'accepts an empty block body' 


    it 'does not auto-correct an offense within another offense' 
                    it "returns success" 

                describe "admin user" do
                     before(:each) do
                    end
                end
            end
        end
      RUBY
      expect(cop.offenses.map(&:line)).to eq [4, 7] # Two offenses are found.

      # The offense on line 4 is corrected, affecting lines 4 to 11.
      expect(corrected).to eq <<-RUBY.strip_indent
        require 'spec_helper'
        describe ArticlesController do
          render_views
          describe \"GET 'index'\" do
                  it "returns success" 

              describe "admin user" do
                   before(:each) do
                  end
              end
          end
        end
      RUBY
    end
  end
end

