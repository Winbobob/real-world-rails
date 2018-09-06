require_relative '../helper'

describe "find-method" do
  MyKlass = Class.new do
    def hello
      "timothy"
    end
    def goodbye
      "jenny"
    end
    def tea_tim?
      "timothy"
    end
    def tea_time?
      "polly"
    end
  end

  describe "find matching methods by name regex (-n option)" do
    it "should find a method by regex" 


    it "should NOT match a method that does not match the regex" 

  end

  describe "find matching methods by content regex (-c option)" do
    it "should find a method by regex" 


    it "should NOT match a method that does not match the regex" 

  end

  it "should work with badly behaved constants" 


  it "should escape regexes correctly" 

end

