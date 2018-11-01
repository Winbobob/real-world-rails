require 'spec_helper'

module RepeatedSubruleSpec
  describe "a repeated subrule" do
    testing_grammar %{
      grammar Foo
        rule foo
          a:'a' space b:'b' space 'cc'
        end

        rule space
          ' '
        end
      end
    }
  
    it "should produce a parser having sequence-numbered node accessor methods" 

  end
end

