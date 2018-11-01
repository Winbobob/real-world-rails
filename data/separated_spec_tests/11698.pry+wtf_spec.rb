require_relative '../helper'

describe "wtf?!" do
  let(:tester) do
    pry_tester do
      def last_exception=(ex)
        @pry.last_exception = ex
      end

      def last_exception
        @pry.last_exception
      end
    end
  end

  it "unwinds nested exceptions" 

end

