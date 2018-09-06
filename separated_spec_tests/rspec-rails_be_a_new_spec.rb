require "spec_helper"

describe "be_a_new matcher" do
  context "new record" do
    let(:record) do
      Class.new do
        def new_record?; true; end
      end.new
    end
    context "right class" do
      it "passes" 

    end
    context "wrong class" do
      it "fails" 

    end
  end

  context "existing record" do
    let(:record) do
      Class.new do
        def new_record?; false; end
      end.new
    end
    context "right class" do
      it "fails" 

    end
    context "wrong class" do
      it "fails" 

    end
  end

  describe "#with" do
    context "right class and new record" do
      let(:record) do
        Class.new do
          def initialize(attributes)
            @attributes = attributes
          end

          def attributes
            @attributes.stringify_keys
          end

          def new_record?; true; end
        end.new(:foo => 'foo', :bar => 'bar')
      end

      context "all attributes same" do
        it "passes" 

      end

      context "one attribute same" do
        it "passes" 

      end

      context "with composable matchers" do
        context "one attribute is a composable matcher" do
          it "passes" 


          it "fails" 


          context "matcher is wrong type" do
            it "fails" 

          end
        end

        context "two attributes are composable matchers" do
          context "both matchers present in actual" do
            it "passes" 

          end

          context "only one matcher present in actual" do
            it "fails" 

          end
        end
      end

      context "no attributes same" do
        it "fails" 

      end

      context "one attribute value not the same" do
        it "fails" 

      end
    end

    context "wrong class and existing record" do
      let(:record) do
        Class.new do
          def initialize(attributes)
            @attributes = attributes
          end

          def attributes
            @attributes.stringify_keys
          end

          def new_record?; false; end
        end.new(:foo => 'foo', :bar => 'bar')
      end

      context "all attributes same" do
        it "fails" 

      end

      context "no attributes same" do
        it "fails" 

      end

      context "one attribute value not the same" do
        it "fails" 

      end
    end
  end
end

