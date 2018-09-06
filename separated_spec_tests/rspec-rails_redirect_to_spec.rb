require "spec_helper"
require "active_support"
require "active_support/test_case"

describe "redirect_to" do
  include RSpec::Rails::Matchers::RedirectTo

  let(:response) { ActionDispatch::TestResponse.new }

  context "with should" do
    context "when assert_redirected_to passes" do
      def assert_redirected_to(*); end

      it "passes" 

    end

    context "when assert_redirected_to fails" do
      def assert_redirected_to(*)
        raise ActiveSupport::TestCase::Assertion.new("this message")
      end

      it "uses failure message from assert_redirected_to" 

    end

    context "when fails due to some other exception" do
      def assert_redirected_to(*)
        raise "oops"
      end

      it "raises that exception" 

    end
  end

  context "with should_not" do
    context "when assert_redirected_to fails" do
      def assert_redirected_to(*)
        raise ActiveSupport::TestCase::Assertion.new("this message")
      end

      it "passes" 

    end

    context "when assert_redirected_to passes" do
      def assert_redirected_to(*); end

      it "fails with custom failure message" 

    end

    context "when fails due to some other exception" do
      def assert_redirected_to(*)
        raise "oops"
      end

      it "raises that exception" 

    end
  end
end

