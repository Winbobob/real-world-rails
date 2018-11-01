class MethodOverrideObject
  def method
    :foo
  end
end

class MethodMissingObject < Struct.new(:original)
  undef ==

  def method_missing(name, *args, &block)
    original.__send__ name, *args, &block
  end
end

RSpec.describe "operator matchers", :uses_should do
  describe "should ==" do
    it "delegates message to target" 


    it "returns true on success" 


    it "fails when target.==(actual) returns false" 


    it "works when #method is overriden" 


    it "works when implemented via method_missing" 

  end

  describe "unsupported operators", :if => RUBY_VERSION.to_f == 1.9 do
    it "raises an appropriate error for should != expected" 


    it "raises an appropriate error for should_not != expected" 


    it "raises an appropriate error for should !~ expected" 


    it "raises an appropriate error for should_not !~ expected" 

  end

  describe "should_not ==" do
    it "delegates message to target" 


    it "returns true on success" 


    it "fails when target.==(actual) returns false" 

  end

  describe "should ===" do
    it "delegates message to target" 


    it "fails when target.===(actual) returns false" 

  end

  describe "should_not ===" do
    it "delegates message to target" 


    it "fails when target.===(actual) returns false" 

  end

  describe "should =~" do
    it "delegates message to target" 


    it "fails when target.=~(actual) returns false" 

  end

  describe "should_not =~" do
    it "delegates message to target" 


    it "fails when target.=~(actual) returns false" 

  end

  describe "should >" do
    it "passes if > passes" 


    it "fails if > fails" 

  end

  describe "should >=" do
    it "passes if actual == expected" 


    it "passes if actual > expected" 


    it "fails if > fails" 

  end

  describe "should <" do
    it "passes if < passes" 


    it "fails if > fails" 

  end

  describe "should <=" do
    it "passes if actual == expected" 


    it "passes if actual < expected" 


    it "fails if > fails" 

  end

  describe "OperatorMatcher registry" do
    let(:custom_klass) { Class.new }
    let(:custom_subklass) { Class.new(custom_klass) }

    after {
      RSpec::Matchers::BuiltIn::OperatorMatcher.unregister(custom_klass, "=~")
    }

    it "allows operator matchers to be registered for classes" 


    it "considers ancestors when finding an operator matcher" 


    it "returns nil if there is no matcher registered for a class" 

  end

  describe RSpec::Matchers::BuiltIn::PositiveOperatorMatcher do
    it "works when the target has implemented #send" 

  end

  describe RSpec::Matchers::BuiltIn::NegativeOperatorMatcher do
    it "works when the target has implemented #send" 

  end
end


