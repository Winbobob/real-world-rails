module RSpec::Matchers::BuiltIn
  RSpec.describe BeBetween do
    class SizeMatters
      include Comparable
      attr :str
      def <=>(other)
        str.size <=> other.str.size
      end
      def initialize(str)
        @str = str
      end
      def inspect
        @str
      end
    end

    shared_examples "be_between" do |mode|
      it "passes if target is between min and max" 


      it "fails if target is not between min and max" 


      it "works with strings" 


      it "works with other Comparable objects" 

    end

    shared_examples "not_to be_between" do |mode|
      it "passes if target is not between min and max" 


      it "fails if target is between min and max" 

    end

    shared_examples "composing with other matchers" do |mode|
      it "passes when the matchers both match" 


      it "works with mixed types" 


      it "provides a description" 


      it "fails with a clear error message when the matchers do not match" 

    end

    it_behaves_like "an RSpec matcher", :valid_value => (10), :invalid_value => (11) do
      let(:matcher) { be_between(1, 10) }
    end

    describe "expect(...).to be_between(min, max) (inclusive)" do
      it_behaves_like "be_between", :inclusive do
        def matcher(min, max)
          be_between(min, max)
        end
      end

      it "is inclusive" 


      it "indicates it was not comparable if it does not respond to `<=` and `>=`" 

    end

    describe "expect(...).to be_between(min, max) (exclusive)" do
      it_behaves_like "be_between", :exclusive do
        def matcher(min, max)
          be_between(min, max).exclusive
        end
      end

      it "indicates it was not comparable if it does not respond to `<` and `>`" 


      it "is exclusive" 

    end

    describe "expect(...).not_to be_between(min, max) (inclusive)" do
      it_behaves_like "not_to be_between", :inclusive do
        def matcher(min, max)
          be_between(min, max)
        end
      end
    end

    describe "expect(...).not_to be_between(min, max) (exclusive)" do
      it_behaves_like "not_to be_between", :exclusive do
        def matcher(min, max)
          be_between(min, max).exclusive
        end
      end
    end

    describe "composing with other matchers (inclusive)" do
      it_behaves_like "composing with other matchers", :inclusive do
        def matcher(min, max)
          a_value_between(min, max)
        end
      end
    end

    describe "composing with other matchers (exclusive)" do
      it_behaves_like "composing with other matchers", :exclusive do
        def matcher(min, max)
          a_value_between(min, max).exclusive
        end
      end
    end
  end
end

