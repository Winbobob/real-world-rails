module YieldHelpers
  # these helpers are prefixed with an underscore to prevent
  # collisions with the matchers (some of which have the same names)
  def _dont_yield
  end

  def _yield_with_no_args
    yield
  end

  def _yield_with_args(*args)
    yield(*args)
  end
end

class InstanceEvaler

  def yield_with_no_args(&block)
    instance_exec(&block)
  end

  def yield_with_args(*args, &block)
    instance_exec(*args, &block)
  end

  def each_arg(*args, &block)
    args.each do |arg|
      instance_exec(arg, &block)
    end
  end
end

RSpec.describe "yield_control matcher" do
  include YieldHelpers
  extend  YieldHelpers

  it_behaves_like "an RSpec matcher",
      :valid_value => lambda { |b| _yield_with_no_args(&b) },
      :invalid_value => lambda { |b| _dont_yield(&b) },
      :failure_message_uses_no_inspect => true do
    let(:matcher) { yield_control }
  end

  it 'has a description' 


  describe "expect {...}.to yield_control" do
    it 'passes if the block yields, regardless of the number of yielded arguments or the number of yields' 


    it 'passes if the block yields using instance_exec' 


    it 'fails if the block does not yield' 


    it 'does not return a meaningful value from the block' 


    context "with exact count" do
      it 'fails if the block yields wrong number of times' 


      it 'passes if the block yields the specified number of times' 

    end

    context "with at_least count" do
      it 'passes if the block yields the given number of times' 


      it 'passes if the block yields more times' 


      it 'allows :once, :twice, and :thrice to be passed as counts' 


      it 'fails if the block yields too few times' 

    end

    context "with at_most count" do
      it 'passes if the block yields the given number of times' 


      it 'passes if the block yields fewer times' 


      it 'allows :once, :twice, and :thrice to be passed as counts' 


      it 'fails if the block yields too many times' 

    end
  end

  describe "expect {...}.not_to yield_control" do
    it 'passes if the block does not yield' 


    it 'fails if the block does yield' 


    it 'fails if the expect block does not accept an argument', :if => (RUBY_VERSION.to_f > 1.8) do
      expect {
        expect { }.not_to yield_control
      }.to raise_error(/expect block must accept an argument/)
    end

    it 'still works when the block uses an arg splat' 


    it 'raises an error if the expect block arg is not passed to a method as a block' 

  end
end

RSpec.describe "yield_with_no_args matcher" do
  include YieldHelpers
  extend  YieldHelpers

  it_behaves_like "an RSpec matcher",
      :valid_value => lambda { |b| _yield_with_no_args(&b) },
      :invalid_value => lambda { |b| _yield_with_args(1, &b) } do
    let(:matcher) { yield_with_no_args }
  end

  it 'has a description' 


  it 'does not return a meaningful value from the block' 


  describe "expect {...}.to yield_with_no_args" do
    it 'passes if the block yields with no args' 


    it 'passes if the block yields with no args using instance_exec' 


    it 'fails if the block does not yield' 


    it 'fails if the block yields with args' 


    it 'fails if the block yields with arg false' 


    it 'raises an error if it yields multiple times' 

  end

  describe "expect {...}.not_to yield_with_no_args" do
    it "passes if the block does not yield" 


    it "passes if the block yields with args" 


    it "fails if the block yields with no args" 


    it 'fails if the expect block does not accept an argument', :if => (RUBY_VERSION.to_f > 1.8) do
      expect {
        expect { }.not_to yield_with_no_args
      }.to raise_error(/expect block must accept an argument/)
    end

    it 'raises an error if the expect block arg is not passed to a method as a block' 

  end
end

RSpec.describe "yield_with_args matcher" do
  include YieldHelpers
  extend  YieldHelpers

  it_behaves_like "an RSpec matcher",
      :valid_value => lambda { |b| _yield_with_args(1, &b) },
      :invalid_value => lambda { |b| _yield_with_args(2, &b) } do
    let(:matcher) { yield_with_args(1) }
  end

  it 'has a description' 


  it 'does not return a meaningful value from the block' 


  describe "expect {...}.to yield_with_args" do
    it 'passes if the block yields with arguments' 


    it 'passes if the matchers match at yield time only' 


    it 'fails if the block does not yield' 


    it 'fails if the block yields with no arguments' 


    it 'fails if the matchers match at return time only' 


    it 'raises an error if it yields multiple times' 

  end

  describe "expect {...}.not_to yield_with_args" do
    it 'fails if the block yields with arguments' 


    it 'fails if the matchers match at yield time only' 


    it 'passes if the block does not yield' 


    it 'passes if the block yields with no arguments' 


    it 'passes if the matchers match at return time only' 


    it 'fails if the expect block does not accept an argument', :if => (RUBY_VERSION.to_f > 1.8) do
      expect {
        expect { }.not_to yield_with_args
      }.to raise_error(/expect block must accept an argument/)
    end

    it 'raises an error if the expect block arg is not passed to a method as a block' 

  end

  describe "expect {...}.to yield_with_args(3, 17)" do
    it 'passes if the block yields with the given arguments' 


    it 'passes if the block yields with the given arguments using instance_exec' 


    it 'fails if the block does not yield' 


    it 'fails if the block yields with no arguments' 


    it 'fails if the block yields with different arguments' 

  end

  describe "expect {...}.to yield_with_args(matcher, matcher)" do
    it 'passes when the matchers match the args' 


    it 'provides a description' 


    it 'fails with a useful error message when the matchers do not match the args' 

  end

  describe "expect {...}.not_to yield_with_args(3, 17)" do
    it 'passes if the block yields with different arguments' 


    it 'fails if the block yields with the given arguments' 

  end

  describe "expect {...}.not_to yield_with_args(matcher, matcher)" do
    it 'passes when the matchers do not match the args' 


    it 'fails with a useful error message when the matchers do not match the args' 

  end

  describe "expect {...}.to yield_with_args( false )" do
    it 'passes if the block yields with the given arguments' 


    it 'passes if the block yields with the given arguments using instance_exec' 


    it 'fails if the block does not yield' 


    it 'fails if the block yields with no arguments' 


    it 'fails if the block yields with different arguments' 

  end

  describe "expect {...}.to yield_with_args(/reg/, /ex/)" do
    it "passes if the block yields strings matching the regexes" 


    it "fails if the block yields strings that do not match the regexes" 

  end

  describe "expect {...}.to yield_with_args(String, Integer)" do
    it "passes if the block yields objects of the given classes" 


    it "passes if the block yields the given classes" 


    it "fails if the block yields objects of different classes" 

  end
end

RSpec.describe "yield_successive_args matcher" do
  include YieldHelpers
  extend  YieldHelpers

  it_behaves_like "an RSpec matcher",
      :valid_value => lambda { |b| [1, 2].each(&b) },
      :invalid_value => lambda { |b| [3, 4].each(&b) } do
    let(:matcher) { yield_successive_args(1, 2) }
  end

  it 'has a description' 


  it 'does not return a meaningful value from the block' 


  it "works correctly when the method yields multiple args each time (passing case)" 


  it "works correctly when the method yields multiple args each time (failing case)" 


  describe "expect {...}.to yield_successive_args([:a, 1], [:b, 2])" do
    it 'passes when the block successively yields the given args' 


    it 'passes if matched at yield time only' 


    it 'fails when the block does not yield that many times' 


    it 'fails when the block yields the right number of times but with different arguments' 


    it 'fails if matched at return time only' 

  end

  describe "expect {...}.to yield_successive_args(1, 2, 3)" do
    it 'passes when the block successively yields the given args' 


    it 'passes when the block successively yields the given args using instance_exec' 


    it 'fails when the block does not yield the expected args' 

  end

  describe "expect {...}.to yield_successive_args(matcher, matcher)" do
    it 'passes when the successively yielded args match the matchers' 


    it 'fails when the successively yielded args do not match the matchers' 


    it 'provides a description' 

  end

  describe "expect {...}.not_to yield_successive_args(1, 2, 3)" do
    it 'passes when the block does not yield' 


    it 'passes when the block yields the wrong number of times' 


    it 'passes when the block yields the wrong arguments' 


    it 'fails when the block yields the given arguments' 


    it 'fails if the expect block does not accept an argument', :if => (RUBY_VERSION.to_f > 1.8) do
      expect {
        expect { }.not_to yield_successive_args(1, 2, 3)
      }.to raise_error(/expect block must accept an argument/)
    end

    it 'raises an error if the expect block arg is not passed to a method as a block' 

  end

  describe "expect {...}.not_to yield_successive_args(matcher, matcher)" do
    it 'passes when the successively yielded args do not match the matchers' 


    it 'passes when the successively yielded args do not match the matchers (at yield time only)' 


    it 'fails when the successively yielded args match the matchers' 


    it 'fails when the successively yielded args match the matchers (at yield time only)' 

  end

  describe "expect {...}.to yield_successive_args(String, Integer)" do
    it "passes if the block successively yields objects of the given classes" 


    it "passes if the block yields the given classes" 


    it "fails if the block yields objects of different classes" 

  end
end


