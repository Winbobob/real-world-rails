module RSpec
  module Matchers
    RSpec.describe "Legacy matchers" do
      it 'still provides a `LegacyMacherAdapter` constant because 3.0 was released with ' +
         'it and it would be a SemVer violation to remove it before 4.0' do
        expect(Expectations::LegacyMacherAdapter).to be(Expectations::LegacyMatcherAdapter)
      end

      shared_examples "a matcher written against a legacy protocol" do |matcher_class|
        matcher = matcher_class.new
        before { allow_deprecation }

        backwards_compat_matcher = Class.new(matcher_class) do
          def failure_message; "failure when positive"; end
          def failure_message_when_negated; "failure when negative"; end
        end.new

        it 'is still considered to be a matcher' 


        context 'when matched positively' do
          it 'returns the positive expectation failure message' 


          it 'warns about the deprecated protocol' 


          it 'does not warn when it also defines the current methods (i.e. to be compatible on multiple RSpec versions)' 

        end

        context 'when matched negatively' do
          it 'returns the negative expectation failure message' 


          it 'warns about the deprecated protocol' 


          it 'does not warn when it also defines the current methods (i.e. to be compatible on multiple RSpec versions)' 


          def pending_on_rbx
            return unless defined?(RUBY_ENGINE) && RUBY_ENGINE == 'rbx'
            pending "intermittently fails on RBX due to https://github.com/rubinius/rubinius/issues/2845"
          end

          it 'calls `does_not_match?` if it is defined on the matcher' 

        end
      end

      context "written using the RSpec 2.x `failure_message_for_should` and `failure_message_for_should_not` protocol" do
        matcher_class = Class.new do
          def matches?(actual); actual; end
          def failure_message_for_should; "failure when positive"; end
          def failure_message_for_should_not; "failure when negative"; end
        end

        it_behaves_like "a matcher written against a legacy protocol", matcher_class
      end

      context "written using the older `failure_message` and `negative_failure_message` protocol" do
        matcher_class = Class.new do
          def matches?(actual); actual; end
          def failure_message; "failure when positive"; end
          def negative_failure_message; "failure when negative"; end
        end

        it_behaves_like "a matcher written against a legacy protocol", matcher_class
      end
    end
  end
end


