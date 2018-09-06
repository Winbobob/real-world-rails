require 'spec_helper'

describe MethodSource do

  describe "source_location (testing 1.8 implementation)" do
    it 'should return correct source_location for a method' 


    it 'should not raise for immediate instance methods' 


    it 'should not raise for immediate methods' 

  end

  before do
    @hello_module_source = "  def hello; :hello_module; end\n"
    @hello_singleton_source = "def $o.hello; :hello_singleton; end\n"
    @hello_source = "def hello; :hello; end\n"
    @hello_comment = "# A comment for hello\n# It spans two lines and is indented by 2 spaces\n"
    @lambda_comment = "# This is a comment for MyLambda\n"
    @lambda_source = "MyLambda = lambda { :lambda }\n"
    @proc_source = "MyProc = Proc.new { :proc }\n"
    @hello_instance_evaled_source = "  def hello_\#{name}(*args)\n    send_mesg(:\#{name}, *args)\n  end\n"
    @hello_instance_evaled_source_2 = "  def \#{name}_two()\n    if 44\n      45\n    end\n  end\n"
    @hello_class_evaled_source = "  def hello_\#{name}(*args)\n    send_mesg(:\#{name}, *args)\n  end\n"
    @hi_module_evaled_source = "  def hi_\#{name}\n    @var = \#{name}\n  end\n"
  end

  it 'should define methods on Method and UnboundMethod and Proc' 


  describe "Methods" do
    it 'should return source for method' 


    it 'should return source for a method defined in a module' 


    it 'should return source for a singleton method as an instance method' 


    it 'should return source for a singleton method' 


    it 'should return a comment for method' 


    # These tests fail because of http://jira.codehaus.org/browse/JRUBY-4576
    unless defined?(RUBY_ENGINE) && RUBY_ENGINE == "jruby"
      it 'should return source for an *_evaled method' 

    end

    it "should raise error for evaled methods that do not pass __FILE__ and __LINE__ + 1 as its arguments" 


    if !is_rbx?
      it 'should raise for C methods' 

    end
  end

  # if RUBY_VERSION =~ /1.9/ || is_rbx?
  describe "Lambdas and Procs" do
    it 'should return source for proc' 


    it 'should return an empty string if there is no comment' 


    it 'should return source for lambda' 


    it 'should return comment for lambda' 

  end
  # end
  describe "Comment tests" do
    before do
      @comment1 = "# a\n# b\n"
      @comment2 = "# a\n# b\n"
      @comment3 = "# a\n#\n# b\n"
      @comment4 = "# a\n# b\n"
      @comment5 = "# a\n# b\n# c\n# d\n"
    end

    it "should correctly extract multi-line comments" 


    it "should correctly strip leading whitespace before comments" 


    it "should keep empty comment lines" 


    it "should ignore blank lines between comments" 


    it "should align all comments to same indent level" 

  end
end

