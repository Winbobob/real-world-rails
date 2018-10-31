require "spec_helper"

%w[have_rendered render_template].each do |template_expectation|
  describe template_expectation do
    include RSpec::Rails::Matchers::RenderTemplate
    let(:response) { ActionDispatch::TestResponse.new }

    context "given a hash" do
      it "delegates to assert_template" 

    end

    context "given a string" do
      it "delegates to assert_template" 

    end

    context "given a symbol" do
      it "converts to_s and delegates to assert_template" 

    end

    context "with should" do
      context "when assert_template passes" do
        it "passes" 

      end

      context "when assert_template fails" do
        it "uses failure message from assert_template" 

      end

      context "when fails due to some other exception" do
        it "raises that exception" 

      end
    end

    context "with should_not" do
      context "when assert_template fails" do
        it "passes" 

      end

      context "when assert_template passes" do
        it "fails with custom failure message" 

      end

      context "when fails due to some other exception" do
        it "raises that exception" 

      end

      context "when fails with a redirect" do
        let(:response) { ActionDispatch::TestResponse.new(303) }

        def assert_template(*)
          message = "expecting <'template_name'> but rendering with <[]>"
          raise ActiveSupport::TestCase::Assertion.new(message)
        end

        def normalize_argument_to_redirection(response_redirect_location)
          "http://test.host/widgets/1"
        end

        it "gives informative error message" 


        context 'with a badly formatted error message' do
          def assert_template(*)
            message = 'expected [] to include "some/path"'
            raise ActiveSupport::TestCase::Assertion.new(message)
          end

          it 'falls back to something informative' 

        end
      end
    end
  end
end

