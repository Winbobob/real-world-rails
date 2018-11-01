module RSpec
  module Mocks
    RSpec.describe "only stashing the original method" do
      let(:klass) do
        Class.new do
          def self.foo(_)
            :original_value
          end
        end
      end

      it "keeps the original method intact after multiple expectations are added on the same method" 

    end

    RSpec.describe "when a class method is aliased on a subclass and the method is mocked" do
      it "restores the original aliased public method" 

    end
  end
end

