require 'rspec/support'
require 'rspec/support/method_signature_verifier'

module RSpec
  module Support
    describe 'verifying methods' do
      let(:signature) { MethodSignature.new(test_method) }

      def valid_non_kw_args?(arity)
        described_class.new(signature, [nil] * arity).valid?
      end

      def valid?(*args)
        described_class.new(signature, args).valid?
      end

      def error_description
        described_class.new(signature).error_message[/Expected (.*),/, 1]
      end

      def error_for(*args)
        described_class.new(signature, args).error_message
      end

      def signature_description
        signature.description
      end

      def validate_expectation(*args)
        obj = MethodSignatureExpectation.new

        obj.min_count = Integer === args.first ? args.shift : nil
        obj.max_count = Integer === args.first ? args.shift : nil

        obj.expect_unlimited_arguments = !args.delete(:unlimited_args).nil?
        obj.expect_arbitrary_keywords  = !args.delete(:arbitrary_kw_args).nil?

        obj.keywords = args

        described_class.new(signature).with_expectation(obj).valid?
      end

      shared_context 'a method verifier' do
        describe 'with a method with arguments' do
          def arity_two(x, y); end

          let(:test_method) { method(:arity_two) }

          it 'covers only the exact arity' 


          it "allows matchers to be passed as arguments" 


          it 'does not treat a last-arg hash as kw args' 


          it 'describes the arity precisely' 


          it 'mentions only the arity in the description' 


          it 'indicates it has no optional kw args' 


          it 'indicates it has no required kw args' 


          describe 'with an expectation object' do
            it 'matches the exact arity' 


            it 'matches a range including the min and max counts' 


            it 'does not match unlimited arguments' 


            if RubyFeatures.kw_args_supported?
              it 'does not match keywords' 


              it 'does not match arbitrary keywords' 

            else
              it 'ignores keyword expectations' 


              it 'ignores arbitrary keyword expectations' 

            end
          end
        end

        describe 'a method with splat arguments' do
          def arity_splat(_, *); end

          let(:test_method) { method(:arity_splat) }

          it 'covers a range from the lower bound upwards' 


          it 'describes the arity with no upper bound' 


          it 'mentions only the arity in the description' 


          describe 'with an expectation object' do
            it 'matches a value from the lower bound upwards' 


            it 'matches a range from the lower bound upwards' 


            if RubyFeatures.optional_and_splat_args_supported?
              it 'matches unlimited arguments with the minimum arity' 

            else
              it 'ignores unlimited arguments expectations' 

            end

            if RubyFeatures.kw_args_supported?
              it 'does not match keywords' 


              it 'does not match arbitrary keywords' 

            else
              it 'ignores keyword expectations' 


              it 'ignores arbitrary keyword expectations' 

            end
          end
        end

        describe 'a method with optional arguments' do
          def arity_optional(x, y, z = 1); end

          let(:test_method) { method(:arity_optional) }

          it 'covers a range from min to max possible arguments' 


          if RubyFeatures.optional_and_splat_args_supported?
            it 'describes the arity as a range' 

          else
            it 'describes the arity with no upper bound' 

          end

          describe 'with an expectation object' do
            it 'matches a value from min to max possible arguments' 


            it 'matches a range from the lower bound upwards' 


            it 'does not match unlimited arguments' 


            if RubyFeatures.kw_args_supported?
              it 'does not match keywords' 


              it 'does not match arbitrary keywords' 

            else
              it 'ignores keyword expectations' 


              it 'ignores arbitrary keyword expectations' 

            end
          end
        end

        if RubyFeatures.kw_args_supported?
          describe 'a method with optional keyword arguments' do
            eval <<-RUBY
              def arity_kw(x, y:1, z:2); end
            RUBY

            let(:test_method) { method(:arity_kw) }

            it 'does not require any of the arguments' 


            it 'does not allow an invalid keyword arguments' 


            it 'mentions the invalid keyword args in the error', :pending => RSpec::Support::Ruby.jruby? && !RSpec::Support::Ruby.jruby_9000? do
              expect(error_for(nil, :a => 0, :b => 1)).to \
                eq("Invalid keyword arguments provided: a, b")
            end

            it 'describes invalid arity precisely' 


            it 'does not blow up when given a BasicObject as the last arg' 


            it 'does not mutate the provided args array' 


            it 'mentions the arity and optional kw args in the description', :pending => RSpec::Support::Ruby.jruby? && !RSpec::Support::Ruby.jruby_9000? do
              expect(signature_description).to eq("arity of 1 and optional keyword args (:y, :z)")
            end

            it "indicates the optional keyword args" 


            it "indicates it has no required keyword args" 


            describe 'with an expectation object' do
              it 'matches the exact arity' 


              it 'matches the exact range' 


              it 'does not match unlimited arguments' 


              it 'matches optional keywords with the correct arity' 


              it 'does not match invalid keywords' 


              it 'does not match arbitrary keywords' 

            end
          end
        end

        if RubyFeatures.required_kw_args_supported?
          describe 'a method with required keyword arguments' do
            eval <<-RUBY
              def arity_required_kw(x, y:, z:, a: 'default'); end
            RUBY

            let(:test_method) { method(:arity_required_kw) }

            it 'returns false unless all required keywords args are present' 


            it 'mentions the missing required keyword args in the error' 


            it 'is described precisely when arity is wrong' 


            it 'mentions the arity, optional kw args and required kw args in the description' 


            it "indicates the optional keyword args" 


            it "indicates the required keyword args" 


            describe 'with an expectation object' do
              it 'does not match the exact arity without the required keywords' 


              it 'does not match the range without the required keywords' 


              it 'matches the exact arity with the required keywords' 


              it 'matches the range with the required keywords' 


              it 'does not match unlimited arguments' 


              it 'matches optional keywords with the required keywords' 


              it 'does not match optional keywords without the required keywords' 


              it 'does not match invalid keywords' 


              it 'does not match arbitrary keywords' 

            end
          end

          describe 'a method with required keyword arguments and a splat' do
            eval <<-RUBY
              def arity_required_kw_splat(w, *x, y:, z:, a: 'default'); end
            RUBY

            let(:test_method) { method(:arity_required_kw_splat) }

            it 'returns false unless all required keywords args are present' 


            it 'mentions missing required keyword args in the error' 


            it 'mentions the arity, optional kw args and required kw args in the description' 


            describe 'with an expectation object' do
              it 'does not match a value from the lower bound upwards' 


              it 'does not match a range from the lower bound upwards' 


              it 'matches a value from the lower bound upwards with the required keywords' 


              it 'matches a range from the lower bound upwards with the required keywords' 


              it 'matches unlimited arguments with the minimum arity and the required keywords' 


              it 'matches optional keywords with the required keywords' 


              it 'does not match optional keywords without the required keywords' 


              it 'does not match invalid keywords' 


              it 'does not match arbitrary keywords' 

            end
          end

          describe 'a method with required keyword arguments and a keyword arg splat' do
            eval <<-RUBY
              def arity_kw_arg_splat(x:, **rest); end
            RUBY

            let(:test_method) { method(:arity_kw_arg_splat) }

            it 'allows extra undeclared keyword args' 


            it 'mentions missing required keyword args in the error' 


            it 'mentions the required kw args and keyword splat in the description' 


            describe 'with an expectation object' do
              it 'does not match the exact arity without the required keywords' 


              it 'does not match the exact range without the required keywords' 


              it 'matches the exact arity with the required keywords' 


              it 'does matches the exact range without the required keywords' 


              it 'does not match unlimited arguments' 


              it 'matches arbitrary keywords with the required keywords' 


              it 'does not match arbitrary keywords without the required keywords' 


              it 'matches arbitrary keywords with the required keywords' 

            end
          end

          describe 'a method with a required arg and a keyword arg splat' do
            eval <<-RUBY
              def arity_kw_arg_splat(x, **rest); end
            RUBY

            let(:test_method) { method(:arity_kw_arg_splat) }

            it 'allows a single arg and any number of keyword args' 


            it 'describes the arity precisely' 


            it 'mentions the required kw args and keyword splat in the description' 


            describe 'with an expectation object' do
              it 'matches the exact arity' 


              it 'matches the exact range' 


              it 'does not match unlimited arguments' 


              it 'matches unlisted keywords with the required arity' 


              it 'matches unlisted keywords with the exact range' 


              it 'matches arbitrary keywords with the required arity' 

            end
          end
        end

        describe 'a method with a block' do
          def arity_block(_, &block); end

          let(:test_method) { method(:arity_block) }

          it 'does not count the block as a parameter' 


          it 'describes the arity precisely' 

        end

        describe 'an `attr_writer` method' do
          attr_writer :foo
          let(:test_method) { method(:foo=) }

          it 'validates against a single argument' 


          it 'fails validation against 0 arguments' 


          it 'fails validation against 2 arguments' 

        end

        if Ruby.jruby?
          describe 'a single-argument Java method' do
            let(:test_method) { Java::JavaLang::String.instance_method(:char_at) }

            it 'validates against a single argument' 


            it 'fails validation against 0 arguments' 


            it 'fails validation against 2 arguments' 

          end
        end
      end

      let(:fake_matcher) { Object.new }
      let(:fake_matcher_def) { lambda {|x| fake_matcher == x }}

      before do
        RSpec::Support.register_matcher_definition(&fake_matcher_def)
      end

      after do
        RSpec::Support.deregister_matcher_definition(&fake_matcher_def)
      end

      describe MethodSignatureExpectation do
        describe '#max_count' do
          it { expect(subject).to respond_to(:max_count).with(0).arguments }
        end

        describe '#max_count=' do
          it { expect(subject).to respond_to(:max_count=).with(1).argument }

          describe 'with nil' do
            before(:each) { subject.max_count = 5 }

            it { expect { subject.max_count = nil }.to change(subject, :max_count).to be(nil) }
          end

          describe 'with a positive integer' do
            let(:value) { 7 }

            it { expect { subject.max_count = value }.to change(subject, :max_count).to eq(value) }
          end

          describe 'with zero' do
            it { expect { subject.max_count = 0 }.to change(subject, :max_count).to eq(0) }
          end

          describe 'with a negative integer value' do
            it 'should raise an error' 

          end

          describe 'with a non-integer value' do
            it 'should raise an error' 

          end
        end

        describe '#min_count' do
          it { expect(subject).to respond_to(:min_count).with(0).arguments }
        end

        describe '#min_count=' do
          it { expect(subject).to respond_to(:min_count=).with(1).argument }

          describe 'with nil' do
            before(:each) { subject.min_count = 5 }

            it { expect { subject.min_count = nil }.to change(subject, :min_count).to be(nil) }
          end

          describe 'with a positive integer' do
            let(:value) { 7 }

            it { expect { subject.min_count = value }.to change(subject, :min_count).to eq(value) }
          end

          describe 'with zero' do
            it { expect { subject.min_count = 0 }.to change(subject, :min_count).to eq(0) }
          end

          describe 'with a negative integer value' do
            it 'should raise an error' 

          end

          describe 'with a non-integer value' do
            it 'should raise an error' 

          end
        end

        describe '#empty?' do
          it { expect(subject).to respond_to(:empty?).with(0).arguments }

          it { expect(subject.empty?).to eq(true) }

          describe 'with a count expectation' do
            before(:each) { subject.min_count = 5 }

            it { expect(subject.empty?).to eq(false) }
          end

          describe 'with a keywords expectation' do
            before(:each) { subject.keywords << :greetings << :programs }

            it { expect(subject.empty?).to eq(false) }
          end
        end

        describe '#expect_arbitrary_keywords' do
          it { expect(subject).to respond_to(:expect_arbitrary_keywords).with(0).arguments }

          it 'should default to false' 

        end

        describe '#expect_arbitrary_keywords=' do
          it { expect(subject).to respond_to(:expect_arbitrary_keywords=).with(1).argument }

          describe 'with true' do
            it { expect { subject.expect_arbitrary_keywords = true }.to change(subject, :expect_arbitrary_keywords).to eq(true) }
          end
        end

        describe '#expect_unlimited_arguments' do
          it { expect(subject).to respond_to(:expect_unlimited_arguments).with(0).arguments }

          it 'should default to false' 

        end

        describe '#expect_unlimited_arguments=' do
          it { expect(subject).to respond_to(:expect_unlimited_arguments=).with(1).argument }

          describe 'with true' do
            it { expect { subject.expect_unlimited_arguments = true }.to change(subject, :expect_unlimited_arguments).to eq(true) }
          end
        end

        describe '#keywords' do
          it { expect(subject).to respond_to(:keywords).with(0).arguments }

          it { expect(subject.keywords).to eq(Array.new) }
        end

        describe '#keywords=' do
          it { expect(subject).to respond_to(:keywords=).with(1).argument }

          describe 'with nil' do
            before(:each) { subject.keywords = [:greetings, :programs] }

            it { expect { subject.keywords = nil }.to change(subject, :keywords).to eq(Array.new) }
          end

          describe 'with an array' do
            let(:keywords) { [:greetings, :programs] }

            it { expect { subject.keywords = keywords }.to change(subject, :keywords).to eq(keywords) }
          end
        end
      end

      describe StrictSignatureVerifier do
        it_behaves_like 'a method verifier'

        if RubyFeatures.kw_args_supported?
          describe 'providing a matcher for optional keyword arguments' do
            eval <<-RUBY
              def arity_kw(x, y:1); end
            RUBY

            let(:test_method) { method(:arity_kw) }

            it 'is not allowed' 

          end
        end

        if RubyFeatures.required_kw_args_supported?
          describe 'providing a matcher for required keyword arguments' do
            eval <<-RUBY
              def arity_kw_required(x, y:); end
            RUBY

            let(:test_method) { method(:arity_kw_required) }

            it 'is not allowed' 

          end
        end
      end

      describe LooseSignatureVerifier do
        it_behaves_like 'a method verifier'

        if RubyFeatures.kw_args_supported?
          describe 'for optional keyword arguments' do
            eval <<-RUBY
              def arity_kw(x, y:1, z:2); end
            RUBY

            let(:test_method) { method(:arity_kw) }

            it 'allows a matcher' 


            it 'allows a matcher only for positional arguments' 

          end
        end

        if RubyFeatures.required_kw_args_supported?
          describe 'providing a matcher for required keyword arguments' do
            eval <<-RUBY
              def arity_kw_required(x, y:); end
            RUBY

            let(:test_method) { method(:arity_kw_required) }

            it 'is allowed' 

          end
        end
      end
    end
  end
end

