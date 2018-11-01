require "spec_helper"

describe Rack::Test::Session do

  context "cookies" do
    it "keeps a cookie jar" 


    it "doesn't send expired cookies" 


    it "cookie path defaults to the uri of the document that was requested" 


    it "escapes cookie values" 


    it "deletes cookies directly from the CookieJar" 


    it "doesn't send cookies with the wrong domain" 


    it "doesn't send cookies with the wrong path" 


    it "persists cookies across requests that don't return any cookie headers" 


    it "deletes cookies" 


    it "respects cookie domains when no domain is explicitly set" 


    it "treats domains case insensitively" 


    it "treats paths case sensitively" 


    it "prefers more specific cookies" 


    it "treats cookie names case insensitively" 


    it "defaults the domain to the request domain" 


    it "defaults the domain to the request path up to the last slash" 


    it "supports secure cookies" 


    it "keeps separate cookie jars for different domains" 


    it "keeps one cookie jar for domain and its subdomains" 


    it "allows cookies to be cleared" 


    it "allow cookies to be set" 


    it "allows an array of cookies to be set" 


    it "skips emtpy string cookies" 


    it "parses multiple cookies properly" 


    it "supports multiple sessions" 


    it "uses :default as the default session name" 


    it "accepts explicitly provided cookies" 

  end
end

