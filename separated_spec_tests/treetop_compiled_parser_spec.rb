require 'spec_helper'

module CompiledParserSpec
  describe Runtime::CompiledParser, "for a grammar with two rules" do
    attr_reader :parser

    testing_grammar %{
      grammar TwoRules
        rule a
          'a'
        end

        rule b
          'bb'
        end
      end
    }

    before do
      @parser = parser_class_under_test.new
    end

    it "allows its root to be specified" 


    it "allows the requirement that all input be consumed to be disabled" 


    it "allows input to be parsed at a given index" 


  end

  describe Runtime::CompiledParser, "for a grammar with a choice between terminals" do
    attr_reader :parser

    testing_grammar %{
      grammar Choice
        rule choice
          'a' / 'b' / 'c'
        end
      end
    }

    before do
      @parser = parser_class_under_test.new
    end

    it "provides #failure_reason, #failure_column, and #failure_line when there is a parse failure" 

  end

  describe Runtime::CompiledParser,  "#terminal_failures" do
    attr_reader:parser

    testing_grammar %{
      grammar SequenceOfTerminals
        rule foo
          'a' 'b' 'c'
        end
      end
    }

    before do
      @parser = parser_class_under_test.new
    end

    it "is reset between parses" 

  end

  describe "a SyntaxNode" do
    attr_reader :parser

    testing_grammar %{
      grammar Alternates
        rule main
          aa &{|s| s[0].elements[0].parent.should == s[0] }
          / ab &{|s| s[0].elements[0].parent.should == s[0] }
        end

        rule aa
          'a' 'a'
        end

        rule ab
          'a' 'b'
        end
      end
    }

    before do
      @parser = parser_class_under_test.new
    end

    it "should have its parent set and reset" 

  end

end

