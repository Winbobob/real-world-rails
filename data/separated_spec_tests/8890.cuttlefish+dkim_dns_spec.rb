# frozen_string_literal: true

require "spec_helper"

describe DkimDns do
  let(:dkim_dns) do
    DkimDns.new(
      private_key: OpenSSL::PKey::RSA.new(2048),
      domain: "foo.com",
      selector: "cuttlefish"
    )
  end

  describe "#dkim_dns_value" do
    it "should give me the dns record value" 

  end

  describe "#dkim_domain" do
    it "should return the fully qualified domain name" 

  end
end

