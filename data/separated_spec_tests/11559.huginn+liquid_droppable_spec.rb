require 'rails_helper'

describe LiquidDroppable do
  before do
    class DroppableTest
      include LiquidDroppable

      def initialize(value)
        @value = value
      end

      attr_reader :value

      def to_s
        "[value:#{value}]"
      end
    end

    class DroppableTestDrop
      def value
        @object.value
      end
    end
  end

  describe 'test class' do
    it 'should be droppable' 

  end
end

