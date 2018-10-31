require 'spec_helper'

module GrammarSpec
  module Bar
  end

  describe "a grammar" do
    testing_grammar %{
      grammar Foo
              # This comment should not cause a syntax error, nor should the following empty one
              #
        include GrammarSpec::Bar

        rule foo
          bar / baz
        end

        rule bar
          'bar' 'bar'
        end

        rule baz
          'baz' 'baz'
        end
      end
    }

    it "parses matching input" 


    it "fails if it does not parse all input" 


    it "mixes in included modules" 

  end
end

