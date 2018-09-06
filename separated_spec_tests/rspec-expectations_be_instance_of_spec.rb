module RSpec
  module Matchers
    [:be_an_instance_of, :be_instance_of].each do |method|
      RSpec.describe "expect(actual).to #{method}(expected)" do
        it_behaves_like "an RSpec matcher", :valid_value => "a", :invalid_value => 5 do
          let(:matcher) { send(method, String) }
        end

        it "passes if actual is instance of expected class" 


        it "fails if actual is instance of subclass of expected class" 


        it "fails with failure message for should unless actual is instance of expected class" 


        it "provides a description" 


        context "when expected provides an expanded inspect, e.g. AR::Base" do
          let(:user_klass) do
            Class.new do
              def self.inspect
                "User(id: integer, name: string)"
              end
            end
          end

          before { stub_const("User", user_klass) }

          it "provides a description including only the class name" 

        end
      end

      RSpec.describe "expect(actual).not_to #{method}(expected)" do

        it "fails with failure message for should_not if actual is instance of expected class" 


      end

    end
  end
end

