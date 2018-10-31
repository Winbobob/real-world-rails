module RSpec
  module Matchers
    [:be_a_kind_of, :be_kind_of].each do |method|
      RSpec.describe "expect(actual).to #{method}(expected)" do
        it_behaves_like "an RSpec matcher", :valid_value => 5, :invalid_value => "a" do
          let(:matcher) { send(method, Integer) }
        end

        it "passes if actual is instance of expected class" 


        it "passes if actual is instance of subclass of expected class" 


        it "fails with failure message for should unless actual is kind of expected class" 


        it "provides a description" 

      end

      RSpec.describe "expect(actual).not_to #{method}(expected)" do
        it "fails with failure message for should_not if actual is kind of expected class" 

      end
    end
  end
end

