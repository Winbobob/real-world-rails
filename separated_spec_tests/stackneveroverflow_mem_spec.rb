require "spec_helper"

describe Mem do
  describe "#memoize" do
    let(:object) do
      klass.new
    end

    context "with normal method name" do
      let(:klass) do
        Class.new do
          include Mem

          def a(value, &block)
            b(value, &block)
          end
          memoize :a

          def b(value)
            [value, yield]
          end

          def c
            "c"
          end
          memoize :c
        end
      end

      it "memoizes the method call" 


      it "defines setter" 

    end

    context "with abnormal method name" do
      let(:klass) do
        Class.new do
          include Mem

          def a!(value, &block)
            b(value, &block)
          end
          memoize :a!

          def b(value)
            [value, yield]
          end
        end
      end

      it "memoizes the method call" 

    end

    context "with non-public method name" do
      let(:klass) do
        Class.new do
          include Mem

          def a
          end
          memoize :a

          protected

          def b
          end
          memoize :b

          private

          def c
          end
          memoize :c
        end
      end

      it 'keeps method visibilities' 


      it 'does not define setter of private method' 

    end
  end
end

