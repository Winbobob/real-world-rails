require 'spec_helper'

RSpec.describe HTTParty::Request do
  context "SSL certificate verification" do
    before do
      WebMock.allow_net_connect!
    end

    after do
      WebMock.disable_net_connect!
    end

    it "should fail when no trusted CA list is specified, by default" 


    it "should work when no trusted CA list is specified, when the verify option is set to false" 


    it "should fail when no trusted CA list is specified, with a bogus hostname, by default" 


    it "should work when no trusted CA list is specified, even with a bogus hostname, when the verify option is set to true" 


    it "should work when using ssl_ca_file with a self-signed CA" 


    it "should work when using ssl_ca_file with a certificate authority" 


    it "should work when using ssl_ca_path with a certificate authority" 


    it "should fail when using ssl_ca_file and the server uses an unrecognized certificate authority" 


    it "should fail when using ssl_ca_path and the server uses an unrecognized certificate authority" 


    it "should fail when using ssl_ca_file and the server uses a bogus hostname" 


    it "should fail when using ssl_ca_path and the server uses a bogus hostname" 

  end
end

