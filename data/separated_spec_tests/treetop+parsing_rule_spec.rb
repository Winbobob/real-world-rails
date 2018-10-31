require 'spec_helper'

module ParsingRuleSpec
  describe "a grammar with one parsing rule" do

    testing_grammar %{
      grammar Foo
        rule bar
          "baz"
        end
      end
    }

    it "stores and retrieves nodes in its node cache" 

  end
  
  
  describe "a grammar with choice that uses the cache and has a subsequent expression" do    
    testing_grammar %{
      grammar Logic
        rule expression
          value_plus
          /
          value
        end

        rule value_plus
          value "something else"
        end

        rule value
          [a-z]
          /
          "foobar" # the subsequent expression that needs cached.interval.end
        end
      end
    }
    
    it "parses a single-character value and generates a node from the cache" 

  end
end

