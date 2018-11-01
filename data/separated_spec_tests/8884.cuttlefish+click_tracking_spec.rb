# frozen_string_literal: true

require "spec_helper"

describe Filters::ClickTracking do
  let(:filter) do
    Filters::ClickTracking.new(
      delivery_id: 673,
      enabled: true,
      tracking_domain_info: {
        protocol: "https",
        domain: "links.bar.com"
      }
    )
  end

  describe "#data" do
    it "should replace html links with tracking links" 

  end

  describe ".rewrite_url" do
    it "should rewrite the first link" 

  end
end

