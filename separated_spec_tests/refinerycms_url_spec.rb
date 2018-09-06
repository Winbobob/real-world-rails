require "spec_helper"

module Refinery
  module Pages
    describe Url::Localised do
      describe ".handle?" do
        it "returns true if link_url is present" 

      end

      describe "#url" do
        let(:page) { double(:page, :link_url => "/test") }

        context "when current frontend locale != default frontend locale" do
          it "returns link_url prefixed with current frontend locale" 

        end

        context "when current frontend locale == default frontend locale" do
          it "returns unaltered link_url" 

        end
      end
    end

    describe Url::Marketable do
      describe ".handle?" do
        it "returns true if marketable_url config is set to true" 

      end

      describe "#url" do
        it "returns hash" 

      end
    end

    describe Url::Normal do
      describe ".handle?" do
        it "returns true if to_param is present" 

      end

      describe "#url" do
        it "returns hash" 

      end
    end
  end
end

