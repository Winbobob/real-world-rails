RSpec.describe "expect(...).to respond_to(:sym)" do
  it_behaves_like "an RSpec matcher", :valid_value => "s", :invalid_value => 5 do
    let(:matcher) { respond_to(:upcase) }
  end

  it "passes if target responds to :sym" 


  it "fails if target does not respond to :sym" 

end

RSpec.describe "expect(...).to respond_to(:sym).with(1).argument" do
  it "passes if target responds to :sym with 1 arg" 


  it "passes if target responds to any number of arguments" 


  it "passes if target responds to one or more arguments" 


  it "fails if target does not respond to :sym" 


  it "fails if :sym expects 0 args" 


  it "fails if :sym expects 2 args" 


  it "fails if :sym expects 2 or more args" 


  it "still works if target has overridden the method method" 

end

RSpec.describe "expect(...).to respond_to(message1, message2)" do
  it "passes if target responds to both messages" 


  it "fails if target does not respond to first message" 


  it "fails if target does not respond to second message" 


  it "fails if target does not respond to either message" 

end

RSpec.describe "expect(...).to respond_to(:sym).with(2).arguments" do
  it "passes if target responds to :sym with 2 args" 


  it "passes if target responds to any number of arguments" 


  it "passes if target responds to one or more arguments" 


  it "passes if target responds to two or more arguments" 


  it "fails if target does not respond to :sym" 


  it "fails if :sym expects 0 args" 


  it "fails if :sym expects 1 args" 


  it "fails if :sym expects 3 or more args" 

end

RSpec.describe "expect(...).to respond_to(:sym).with(1..2).arguments" do
  it "passes if target responds to any number of arguments" 


  it "passes if target responds to one or more arguments" 


  it "passes if target responds to one or two arguments" 


  it "passes if target responds to one to three arguments" 


  it "fails if target does not respond to :sym" 


  it "fails if :sym expects 0 args" 


  it "fails if :sym expects 1 args" 


  it "fails if :sym expects 2 args" 


  it "fails if :sym expects 3 or more args" 

end

RSpec.describe "expect(...).to respond_to(:sym).with_unlimited_arguments" do
  it "passes if target responds to any number of arguments" 


  it "passes if target responds to a minimum number of arguments" 


  it "fails if target does not respond to :sym" 


  it "fails if :sym expects a minimum number of arguments" 


  it "fails if :sym expects a limited number of arguments" 

end

RSpec.describe "expect(...).not_to respond_to(:sym)" do
  it "passes if target does not respond to :sym" 


  it "fails if target responds to :sym" 

end

RSpec.describe "expect(...).not_to respond_to(:sym).with(1).argument" do
  it "fails if target responds to :sym with 1 arg" 


  it "fails if target responds to :sym with any number of args" 


  it "fails if target responds to :sym with one or more args" 


  it "passes if target does not respond to :sym" 


  it "passes if :sym expects 0 args" 


  it "passes if :sym expects 2 args" 


  it "passes if :sym expects 2 or more args" 

end

RSpec.describe "expect(...).not_to respond_to(message1, message2)" do
  it "passes if target does not respond to either message1 or message2" 


  it "fails if target responds to message1 but not message2" 


  it "fails if target responds to message2 but not message1" 


  it "fails if target responds to both message1 and message2" 

end

RSpec.describe "expect(...).not_to respond_to(:sym).with(2).arguments" do
  it "fails if target responds to :sym with 2 args" 


  it "fails if target responds to :sym with any number args" 


  it "fails if target responds to :sym with one or more args" 


  it "fails if target responds to :sym with two or more args" 


  it "passes if target does not respond to :sym" 


  it "passes if :sym expects 0 args" 


  it "passes if :sym expects 2 args" 


  it "passes if :sym expects 3 or more args" 

end

RSpec.describe "expect(...).not_to respond_to(:sym).with(1..2).arguments" do
  it "fails if target responds to :sym with one or two args" 


  it "fails if target responds to :sym with any number args" 


  it "fails if target responds to :sym with one or more args" 


  it "passes if target does not respond to :sym" 


  it "passes if :sym expects 0 args" 


  it "passes if :sym expects 1 arg" 


  it "passes if :sym expects 2 args" 


  it "passes if :sym expects 3 or more args" 

end

RSpec.describe "expect(...).not_to respond_to(:sym).with_unlimited_arguments" do
  it "fails if target responds to :sym with any number args" 


  it "passes if target does not respond to :sym" 


  it "passes if :sym expects a limited number of arguments" 


  it "passes if :sym expects a minimum number of arguments" 

end

if RSpec::Support::RubyFeatures.kw_args_supported?
  RSpec.describe "expect(...).to respond_to(:sym).with_keywords(:foo, :bar)" do
    it 'passes if target responds to :sym with specified optional keywords' 


    it 'passes if target responds to :sym with any keywords' 


    it "fails if target does not respond to :sym" 


    it "fails if :sym does not expect specified keywords" 


    it "fails if :sym does not expect many specified keywords" 


    if RSpec::Support::RubyFeatures.required_kw_args_supported?
      it "passes if target responds to :sym with specified required keywords" 


      it "passes if target responds to :sym with keyword arg splat" 


      it "fails if :sym expects specified optional keywords but expects missing required keywords" 


      it "fails if target responds to :sym with keyword arg splat but missing required keywords" 

    end
  end

  RSpec.describe "expect(...).to respond_to(:sym).with(2).arguments.and_keywords(:foo, :bar)" do
    it "passes if target responds to :sym with 2 args and specified optional keywords" 


    it "passes if target responds to :sym with any number of arguments and specified optional keywords" 


    it "passes if target responds to :sym with one or more arguments and specified optional keywords" 


    it "passes if target responds to :sym with two or more arguments and specified optional keywords" 


    it "fails if target does not respond to :sym" 


    it "fails if :sym expects 1 argument" 


    it "fails if :sym does not expect specified keywords" 


    if RSpec::Support::RubyFeatures.required_kw_args_supported?
      it "passes if target responds to :sym with 2 args and specified required keywords" 


      it "passes if target responds to :sym with 2 args and keyword arg splat" 


      it "fails if :sym expects 2 arguments and specified optional keywords but expects missing required keywords" 

    end
  end

  RSpec.describe "expect(...).to respond_to(:sym).with_any_keywords" do
    it "passes if target responds to any keywords" 


    it "fails if target does not respond to :sym" 


    it "fails if :sym expects a limited set of keywords" 


    if RSpec::Support::RubyFeatures.required_kw_args_supported?
      it "fails if :sym expects missing required keywords" 

    end
  end

  RSpec.describe "expect(...).not_to respond_to(:sym).with_keywords(:foo, :bar)" do
    it "fails if target responds to :sym with specified optional keywords" 


    it "fails if target responds to :sym with any keywords" 


    it "passes if target does not respond to :sym" 


    it "passes if :sym does not expect specified keywords" 


    if RSpec::Support::RubyFeatures.required_kw_args_supported?
      it "fails if target responds to :sym with specified required keywords" 


      it "fails if target responds to :sym with keyword arg splat" 


      it "passes if :sym expects missing required keywords" 

    end
  end

  RSpec.describe "expect(...).not_to respond_to(:sym).with(2).arguments.and_keywords(:foo, :bar)" do
    it "fails if target responds to :sym with 2 args and specified optional keywords" 


    it "fails if target responds to :sym with any number of arguments and specified optional keywords" 


    it "fails if target responds to :sym with one or more arguments and specified optional keywords" 


    it "fails if target responds to :sym with two or more arguments and specified optional keywords" 


    it "passes if target does not respond to :sym" 


    it "passes if :sym expects 1 argument" 


    it "passes if :sym does not expect specified keywords" 


    if RSpec::Support::RubyFeatures.required_kw_args_supported?
      it "fails if target responds to :sym with 2 args and specified required keywords" 


      it "fails if target responds to :sym with 2 args and keyword arg splat" 


      it "passes if :sym expects 2 arguments and specified optional keywords but expects missing required keywords" 

    end
  end

  RSpec.describe "expect(...).not_to respond_to(:sym).with_any_keywords" do
    it "fails if target responds to any keywords" 


    it "passes if target does not respond to :sym" 


    it "passes if :sym expects a limited set of keywords" 


    if RSpec::Support::RubyFeatures.required_kw_args_supported?
      it "passes if :sym expects missing required keywords" 

    end
  end
end

