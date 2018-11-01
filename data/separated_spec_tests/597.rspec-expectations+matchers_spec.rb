main = self
RSpec.describe RSpec::Matchers do
  include ::RSpec::Support::InSubProcess

  describe ".configuration" do
    it 'returns a memoized configuration instance' 

  end

  it 'can be mixed into `main`' 


  context "when included into a superclass after a subclass has already included it" do
    if RSpec::Support::Ruby.mri? && RUBY_VERSION[0, 3] == '1.9'
      desc_start = "print"
      matcher_method = :output
    else
      desc_start = "does not print"
      matcher_method = :avoid_outputting
    end

    it "#{desc_start} a warning so the user is made aware of the MRI 1.9 bug that can cause infinite recursion" 


    it "does not warn when this is a re-inclusion" 

  end

  describe "#respond_to?" do
    it "handles dynamic matcher methods" 


    it "supports the optional `include_private` arg" 


    it "allows `method` to get dynamic matcher methods", :if => RUBY_VERSION.to_f >= 1.9 do
      expect(method(:be_happy).call).to be_a(be_happy.class)
    end
  end
end

module RSpec
  module Matchers
    RSpec.describe ".is_a_matcher?" do
      it 'does not match BasicObject', :if => RUBY_VERSION.to_f > 1.8 do
        expect(RSpec::Matchers.is_a_matcher?(BasicObject.new)).to eq(false)
      end

      it 'is registered with RSpec::Support' 


      it 'does not match a multi-element array' 

    end

    RSpec.describe "built in matchers" do
      let(:matchers) do
        BuiltIn.constants.map { |n| BuiltIn.const_get(n) }.select do |m|
          m.method_defined?(:matches?) && m.method_defined?(:failure_message)
        end
      end

      specify "they all have defined #=== so they can be composable" do
        missing_threequals = matchers.select do |m|
          m.instance_method(:===).owner == ::Kernel
        end

        # This spec is merely to make sure we don't forget to make
        # a built-in matcher implement `===`. It doesn't check the
        # semantics of that. Use the "an RSpec matcher" shared
        # example group to actually check the semantics.
        expect(missing_threequals).to eq([])
      end

      specify "they all have defined #and and #or so they support compound expectations" do
        noncompound_matchers = matchers.reject do |m|
          m.method_defined?(:and) || m.method_defined?(:or)
        end

        expect(noncompound_matchers).to eq([])
      end

      shared_examples "a well-behaved method_missing hook" do
        include MinitestIntegration

        it "raises a NoMethodError (and not SystemStackError) for an undefined method" 

      end

      describe "RSpec::Matchers method_missing hook", :slow do
        subject { self }

        it_behaves_like "a well-behaved method_missing hook"

        context 'when invoked in a Minitest::Test' do
          subject { Minitest::Test.allocate }
          it_behaves_like "a well-behaved method_missing hook"
        end
      end
    end
  end
end


