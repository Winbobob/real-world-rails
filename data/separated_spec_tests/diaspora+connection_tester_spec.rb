# frozen_string_literal: true

describe ConnectionTester do
  let(:url) { "https://pod.example.com" }
  let(:result) { ConnectionTester::Result.new }
  let(:tester) { ConnectionTester.new(url, result) }

  describe "::check" do
    it "takes a http url and returns a result object" 


    it "still returns a result object, even for invalid urls" 

  end

  describe "#initialize" do
    it "accepts the http protocol" 

    it "rejects unexpected protocols" 

  end

  describe "#resolve" do
    it "resolves the IP address" 


    it "raises DNSFailure if host is unknown" 

  end

  describe "#request" do
    it "performs a successful GET request on '/' and '/.well-known/host-meta'" 


    it "receives a 'normal' 301 redirect" 


    it "updates ssl after https redirect" 


    it "rejects other hostname after redirect redirect" 


    it "receives too many 301 redirects" 


    it "receives a 404 not found" 


    it "cannot connect" 


    it "encounters an invalid SSL setup" 

  end

  describe "#nodeinfo" do
    let(:ni_wellknown) { {links: [{rel: ConnectionTester::NODEINFO_SCHEMA, href: "/nodeinfo"}]} }

    it "reads the version from the nodeinfo document" 


    it "handles a missing nodeinfo document gracefully" 


    it "handles a malformed document gracefully" 


    it "handles a invalid jrd document gracefully" 


    it "handles a invalid nodeinfo document gracefully" 

  end
end

