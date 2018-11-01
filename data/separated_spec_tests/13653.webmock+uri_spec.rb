require 'spec_helper'


URIS_WITHOUT_PATH_OR_PARAMS =
[
  "www.example.com",
  "www.example.com/",
  "www.example.com:80",
  "www.example.com:80/",
  "http://www.example.com",
  "http://www.example.com/",
  "http://www.example.com:80",
  "http://www.example.com:80/"
].sort

URIS_WITHOUT_PATH_BUT_WITH_PARAMS =
[
  "www.example.com?a=b",
  "www.example.com/?a=b",
  "www.example.com:80?a=b",
  "www.example.com:80/?a=b",
  "http://www.example.com?a=b",
  "http://www.example.com/?a=b",
  "http://www.example.com:80?a=b",
  "http://www.example.com:80/?a=b"
].sort

URIS_WITH_AUTH =
[
  "a b:pass@www.example.com",
  "a b:pass@www.example.com/",
  "a b:pass@www.example.com:80",
  "a b:pass@www.example.com:80/",
  "http://a b:pass@www.example.com",
  "http://a b:pass@www.example.com/",
  "http://a b:pass@www.example.com:80",
  "http://a b:pass@www.example.com:80/",
  "a%20b:pass@www.example.com",
  "a%20b:pass@www.example.com/",
  "a%20b:pass@www.example.com:80",
  "a%20b:pass@www.example.com:80/",
  "http://a%20b:pass@www.example.com",
  "http://a%20b:pass@www.example.com/",
  "http://a%20b:pass@www.example.com:80",
  "http://a%20b:pass@www.example.com:80/"
].sort

URIS_WITH_PATH_AND_PARAMS =
[
  "www.example.com/my path/?a=my param&b=c d",
  "www.example.com/my%20path/?a=my%20param&b=c%20d",
  "www.example.com:80/my path/?a=my param&b=c d",
  "www.example.com:80/my%20path/?a=my%20param&b=c%20d",
  "http://www.example.com/my path/?a=my param&b=c d",
  "http://www.example.com/my%20path/?a=my%20param&b=c%20d",
  "http://www.example.com:80/my path/?a=my param&b=c d",
  "http://www.example.com:80/my%20path/?a=my%20param&b=c%20d",
  ].sort

URIS_WITH_DIFFERENT_PORT =
[
  "www.example.com:88",
  "www.example.com:88/",
  "http://www.example.com:88",
  "http://www.example.com:88/"
].sort


URIS_FOR_HTTPS =
[
  "https://www.example.com",
  "https://www.example.com/",
  "https://www.example.com:443",
  "https://www.example.com:443/"
].sort


describe WebMock::Util::URI do

  describe "reporting variations of uri" do

    it "should find all variations of the same uri for all variations of uri with params and path" 


    it "should find all variations of the same uri for all variations of uri with params but without path" 


    it "should find all variations of the same uri for all variations of uri without params or path" 


    it "should find all variations of the same uri for all variations of uri with auth" 


    it "should find all variations of the same uri for all variations of uri with different port" 


    it "should find all variations of the same uri for all variations of https uris" 


  end

  describe "normalized uri equality" do

    it "should successfully compare all variations of the same uri with path and params" 


    it "should successfully compare all variations of the same uri with path but with params" 


    it "should successfully compare all variations of the same uri without path or params" 


    it "should successfully compare all variations of the same uri with authority" 


    it "should successfully compare all variations of the same uri custom port" 


    it "should successfully compare all variations of the same https uri" 


    it "should successfully handle array parameters" 


    it "should successfully handle hash parameters" 


    it "should successfully handle nested hash parameters" 


    it "should successfully handle mixed array and hash parameters" 


    context "when query notation is set to :flat_array" do
      before :all do
        WebMock::Config.instance.query_values_notation = :flat_array
      end

      it "should successfully handle repeated paramters" 

    end
  end

  describe "sorting query values" do

    context "when query values is a Hash" do
      it "returns an alphabetically sorted hash" 

    end

    context "when query values is an Array" do
      it "returns an alphabetically sorted array" 

    end
  end

  describe "stripping default port" do

    it "should strip_default_port_from_uri strips 80 from http with path" 


    it "should strip_default_port_from_uri strips 80 from http without path" 


    it "should strip_default_port_from_uri strips 443 from https without path" 


    it "should strip_default_port_from_uri strips 443 from https" 


    it "should strip_default_port_from_uri does not strip 8080 from http" 


    it "should strip_default_port_from_uri does not strip 443 from http" 


    it "should strip_default_port_from_uri does not strip 80 from query string" 


    it "should strip_default_port_from_uri does not modify strings that do not start with http or https" 


  end


  describe "encoding userinfo" do

    it "should encode unsafe chars in userinfo does not encode userinfo safe punctuation" 


    it "should encode unsafe chars in userinfo does not encode rfc 3986 unreserved characters" 


    it "should encode unsafe chars in userinfo does encode other characters" 


  end

end

