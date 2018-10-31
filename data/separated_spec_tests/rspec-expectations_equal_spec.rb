module RSpec
  module Matchers
    RSpec.describe "equal" do
      it_behaves_like "an RSpec matcher", :valid_value => :a, :invalid_value => :b do
        let(:matcher) { equal(:a) }
      end

      def inspect_object(o)
        "#<#{o.class}:#{o.object_id}> => #{o.inspect}"
      end

      it "matches when actual.equal?(expected)" 


      it "does not match when !actual.equal?(expected)" 


      it "describes itself" 


      context "when the expected object is falsey in conditinal semantics" do
        it "describes itself with the expected object" 

      end

      context "when the expected object's #equal? always returns true" do
        let(:strange_string) do
          string = "foo".dup

          def string.equal?(other)
            true
          end

          string
        end

        it "describes itself with the expected object" 

      end

      context "the output for expected" do
        it "doesn't include extra object detail for `true`" 


        it "doesn't include extra object detail for `false`" 


        it "doesn't include extra object detail for `nil`" 

      end

      context "the output for actual" do
        it "doesn't include extra object detail for `true`" 


        it "doesn't include extra object detail for `false`" 


        it "doesn't include extra object detail for `nil`" 

      end

      it "suggests the `eq` matcher on failure" 


      it "provides message on #negative_failure_message" 

    end
  end
end

