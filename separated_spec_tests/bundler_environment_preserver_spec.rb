# frozen_string_literal: true

RSpec.describe Bundler::EnvironmentPreserver do
  let(:preserver) { described_class.new(env, ["foo"]) }

  describe "#backup" do
    let(:env) { { "foo" => "my-foo", "bar" => "my-bar" } }
    subject { preserver.backup }

    it "should create backup entries" 


    it "should keep the original entry" 


    it "should not create backup entries for unspecified keys" 


    it "should not affect the original env" 


    context "when a key is empty" do
      let(:env) { { "foo" => "" } }

      it "should not create backup entries" 

    end

    context "when an original key is set" do
      let(:env) { { "foo" => "my-foo", "BUNDLER_ORIG_foo" => "orig-foo" } }

      it "should keep the original value in the BUNDLER_ORIG_ variable" 


      it "should keep the variable" 

    end
  end

  describe "#restore" do
    subject { preserver.restore }

    context "when an original key is set" do
      let(:env) { { "foo" => "my-foo", "BUNDLER_ORIG_foo" => "orig-foo" } }

      it "should restore the original value" 


      it "should delete the backup value" 

    end

    context "when no original key is set" do
      let(:env) { { "foo" => "my-foo" } }

      it "should keep the current value" 

    end

    context "when the original key is empty" do
      let(:env) { { "foo" => "my-foo", "BUNDLER_ORIG_foo" => "" } }

      it "should keep the current value" 

    end
  end
end

