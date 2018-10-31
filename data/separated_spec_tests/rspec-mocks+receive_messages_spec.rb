module RSpec
  module Mocks
    RSpec.shared_examples "complains when given blocks" do
      it "complains if a { } block is given" 


      it "complains if a do; end; block is given" 

    end

    RSpec.shared_examples "handles partially mocked objects correctly" do
      let(:obj) { Struct.new(:a).new('original') }

      it "resets partially mocked objects correctly" 

    end

    RSpec.describe "allow(...).to receive_messages(:a => 1, :b => 2)" do
      let(:obj) { double "Object" }
      let(:target) { allow(obj) }

      it "allows the object to respond to multiple messages" 


      it_behaves_like "complains when given blocks"
      it_behaves_like "handles partially mocked objects correctly"
    end

    RSpec.describe "allow_any_instance_of(...).to receive_messages(:a => 1, :b => 2)" do
      let(:obj) { Object.new }
      let(:target) { allow_any_instance_of(Object) }

      it "allows the object to respond to multiple messages" 


      it "updates stubs on instances with existing stubs" 


      it_behaves_like "complains when given blocks"
    end

    RSpec.describe "expect(...).to receive_messages(:a => 1, :b => 2)" do
      let(:obj) { double "Object" }
      let(:target) { expect(obj) }

      let(:expectation_error) do
        failure = nil
        begin
          verify_all
        rescue RSpec::Mocks::MockExpectationError => error
          failure = error
        end
        failure
      end

      it "sets up multiple expectations" 


      it 'fails with a sensible message' 


      it 'fails with the correct location' 


      it_behaves_like "complains when given blocks"
      it_behaves_like "handles partially mocked objects correctly"

      it "provides a matcher description" 

    end

    RSpec.describe "expect_any_instance_of(...).to receive_messages(:a => 1, :b => 2)" do
      let(:obj) { Object.new }
      let(:target) { expect_any_instance_of(Object) }

      it "sets up multiple expectations" 


      it_behaves_like "complains when given blocks"
    end

    RSpec.describe "negative expectation failure" do
      let(:obj) { Object.new }

      example "allow(...).to_not receive_messages(:a => 1, :b => 2)" do
        expect { allow(obj).to_not receive_messages(:a => 1, :b => 2) }.to(
          raise_error "`allow(...).to_not receive_messages` is not supported " \
                      "since it doesn't really make sense. What would it even mean?"
        )
      end

      example "allow_any_instance_of(...).to_not receive_messages(:a => 1, :b => 2)" do
        expect { allow_any_instance_of(obj).to_not receive_messages(:a => 1, :b => 2) }.to(
          raise_error "`allow_any_instance_of(...).to_not receive_messages` is not supported " \
                      "since it doesn't really make sense. What would it even mean?"
        )
      end

      example "expect(...).to_not receive_messages(:a => 1, :b => 2)" do
        expect { expect(obj).to_not receive_messages(:a => 1, :b => 2) }.to(
          raise_error "`expect(...).to_not receive_messages` is not supported " \
                      "since it doesn't really make sense. What would it even mean?"
        )
      end

      example "expect_any_instance_of(...).to_not receive_messages(:a => 1, :b => 2)" do
        expect { expect_any_instance_of(obj).to_not receive_messages(:a => 1, :b => 2) }.to(
          raise_error "`expect_any_instance_of(...).to_not receive_messages` is not supported " \
                      "since it doesn't really make sense. What would it even mean?"
        )
      end
    end
  end
end

