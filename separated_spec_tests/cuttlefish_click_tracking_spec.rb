# coding: utf-8
require "spec_helper"

describe Filters::ClickTracking do
  let(:filter) {
    Filters::ClickTracking.new(
      delivery_id: 673,
      enabled: true,
      tracking_domain: "localhost",
      using_custom_tracking_domain: false
    )
  }

  describe "#data" do
    it "should replace html links with tracking links" 

  end

  describe ".rewrite_url" do
    it "should rewrite the first link" 

  end
end

