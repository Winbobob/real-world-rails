module RSpec::Matchers::BuiltIn
  RSpec.describe BaseMatcher do
    describe "#match_unless_raises" do
      let(:matcher) do
        Class.new(BaseMatcher).new
      end

      it "returns true if there are no errors" 


      it "returns false if there is an error" 


      it "returns false if the only submitted error is raised" 


      it "returns false if any of several errors submitted is raised" 


      it "re-raises any error other than one of those specified" 


      it "stores the rescued exception for use in messages" 


    end

    describe "#failure_message" do
      context "when the parameter to .new is omitted" do
        it "describes what was expected" 

      end
    end

    describe "#===" do
      it "responds the same way as matches?" 

    end

    describe "default failure message detection" do
      def has_default_failure_messages?(matcher)
        BaseMatcher::DefaultFailureMessages.has_default_failure_messages?(matcher)
      end

      shared_examples_for "detecting default failure message" do
        context "that has no failure message overrides" do
          it "indicates that it has default failure messages" 

        end

        context "that overrides `failure_message`" do
          it "indicates that it lacks default failure messages" 

        end

        context "that overrides `failure_message_when_negated`" do
          it "indicates that it lacks default failure messages" 

        end
      end

      context "for a DSL-defined custom macher" do
        include_examples "detecting default failure message" do
          def build_matcher(&block)
            definition = Proc.new do
              match { }
              module_exec(&block) if block
            end

            RSpec::Matchers::DSL::Matcher.new(:matcher_name, definition, self)
          end
        end
      end

      context "for a matcher that subclasses `BaseMatcher`" do
        include_examples "detecting default failure message" do
          def build_matcher(&block)
            Class.new(RSpec::Matchers::BuiltIn::BaseMatcher, &block).new
          end
        end
      end

      context "for a custom matcher that lacks `failure_message_when_negated` (documented as an optional part of the matcher protocol" do
        it "indicates that it lacks default failure messages" 

      end
    end
  end
end

