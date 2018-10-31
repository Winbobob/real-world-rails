# frozen_string_literal: true

# coding: utf-8
# Copyright (C) Bob Aman
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.


require "spec_helper"

require "addressable/uri"
require "uri"
require "ipaddr"

if !"".respond_to?("force_encoding")
  class String
    def force_encoding(encoding)
      @encoding = encoding
    end

    def encoding
      @encoding ||= Encoding::ASCII_8BIT
    end
  end

  class Encoding
    def initialize(name)
      @name = name
    end

    def to_s
      return @name
    end

    UTF_8 = Encoding.new("UTF-8")
    ASCII_8BIT = Encoding.new("US-ASCII")
  end
end

module Fake
  module URI
    class HTTP
      def initialize(uri)
        @uri = uri
      end

      def to_s
        return @uri.to_s
      end

      alias :to_str :to_s
    end
  end
end

describe Addressable::URI, "when created with a non-numeric port number" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a invalid encoded port number" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a non-string scheme" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a non-string user" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a non-string password" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a non-string userinfo" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a non-string host" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a non-string authority" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a non-string path" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a non-string query" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a non-string fragment" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a scheme but no hierarchical " +
    "segment" do
  it "should raise an error" 

end

describe Addressable::URI, "quote handling" do
  describe 'in host name' do
    it "should raise an error for single quote" 

  end
end

describe Addressable::URI, "newline normalization" do
  it "should not accept newlines in scheme" 


  it "should not unescape newline in path" 


  it "should not unescape newline in hostname" 


  it "should not unescape newline in username" 


  it "should not unescape newline in username" 


  it "should not accept newline in hostname" 

end

describe Addressable::URI, "when created with ambiguous path" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with an invalid host" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a host consisting of " +
    "sub-delims characters" do
  it "should not raise an error" 

end

describe Addressable::URI, "when created with a host consisting of " +
    "unreserved characters" do
  it "should not raise an error" 

end

describe Addressable::URI, "when created from nil components" do
  before do
    @uri = Addressable::URI.new
  end

  it "should have a nil site value" 


  it "should have an empty path" 


  it "should be an empty uri" 


  it "should have a nil default port" 


  it "should be empty" 


  it "should raise an error if the scheme is set to whitespace" 


  it "should raise an error if the scheme is set to all digits" 


  it "should raise an error if the scheme begins with a digit" 


  it "should raise an error if the scheme begins with a plus" 


  it "should raise an error if the scheme begins with a dot" 


  it "should raise an error if the scheme begins with a dash" 


  it "should raise an error if the scheme contains an illegal character" 


  it "should raise an error if the scheme contains whitespace" 


  it "should raise an error if the scheme contains a newline" 


  it "should raise an error if set into an invalid state" 


  it "should raise an error if set into an invalid state" 


  it "should raise an error if set into an invalid state" 


  it "should raise an error if set into an invalid state" 

end

describe Addressable::URI, "when initialized from individual components" do
  before do
    @uri = Addressable::URI.new(
      :scheme => "http",
      :user => "user",
      :password => "password",
      :host => "example.com",
      :port => 8080,
      :path => "/path",
      :query => "query=value",
      :fragment => "fragment"
    )
  end

  it "returns 'http' for #scheme" 


  it "returns 'http' for #normalized_scheme" 


  it "returns 'user' for #user" 


  it "returns 'user' for #normalized_user" 


  it "returns 'password' for #password" 


  it "returns 'password' for #normalized_password" 


  it "returns 'user:password' for #userinfo" 


  it "returns 'user:password' for #normalized_userinfo" 


  it "returns 'example.com' for #host" 


  it "returns 'example.com' for #normalized_host" 


  it "returns 'com' for #tld" 


  it "returns 'user:password@example.com:8080' for #authority" 


  it "returns 'user:password@example.com:8080' for #normalized_authority" 


  it "returns 8080 for #port" 


  it "returns 8080 for #normalized_port" 


  it "returns 80 for #default_port" 


  it "returns 'http://user:password@example.com:8080' for #site" 


  it "returns 'http://user:password@example.com:8080' for #normalized_site" 


  it "returns '/path' for #path" 


  it "returns '/path' for #normalized_path" 


  it "returns 'query=value' for #query" 


  it "returns 'query=value' for #normalized_query" 


  it "returns 'fragment' for #fragment" 


  it "returns 'fragment' for #normalized_fragment" 


  it "returns #hash" 


  it "returns #to_s" 


  it "should not be empty" 


  it "should not be frozen" 


  it "should allow destructive operations" 

end

describe Addressable::URI, "when initialized from " +
    "frozen individual components" do
  before do
    @uri = Addressable::URI.new(
      :scheme => "http".freeze,
      :user => "user".freeze,
      :password => "password".freeze,
      :host => "example.com".freeze,
      :port => "8080".freeze,
      :path => "/path".freeze,
      :query => "query=value".freeze,
      :fragment => "fragment".freeze
    )
  end

  it "returns 'http' for #scheme" 


  it "returns 'http' for #normalized_scheme" 


  it "returns 'user' for #user" 


  it "returns 'user' for #normalized_user" 


  it "returns 'password' for #password" 


  it "returns 'password' for #normalized_password" 


  it "returns 'user:password' for #userinfo" 


  it "returns 'user:password' for #normalized_userinfo" 


  it "returns 'example.com' for #host" 


  it "returns 'example.com' for #normalized_host" 


  it "returns 'user:password@example.com:8080' for #authority" 


  it "returns 'user:password@example.com:8080' for #normalized_authority" 


  it "returns 8080 for #port" 


  it "returns 8080 for #normalized_port" 


  it "returns 80 for #default_port" 


  it "returns 'http://user:password@example.com:8080' for #site" 


  it "returns 'http://user:password@example.com:8080' for #normalized_site" 


  it "returns '/path' for #path" 


  it "returns '/path' for #normalized_path" 


  it "returns 'query=value' for #query" 


  it "returns 'query=value' for #normalized_query" 


  it "returns 'fragment' for #fragment" 


  it "returns 'fragment' for #normalized_fragment" 


  it "returns #hash" 


  it "returns #to_s" 


  it "should not be empty" 


  it "should not be frozen" 


  it "should allow destructive operations" 

end

describe Addressable::URI, "when parsed from a frozen string" do
  before do
    @uri = Addressable::URI.parse(
      "http://user:password@example.com:8080/path?query=value#fragment".freeze
    )
  end

  it "returns 'http' for #scheme" 


  it "returns 'http' for #normalized_scheme" 


  it "returns 'user' for #user" 


  it "returns 'user' for #normalized_user" 


  it "returns 'password' for #password" 


  it "returns 'password' for #normalized_password" 


  it "returns 'user:password' for #userinfo" 


  it "returns 'user:password' for #normalized_userinfo" 


  it "returns 'example.com' for #host" 


  it "returns 'example.com' for #normalized_host" 


  it "returns 'user:password@example.com:8080' for #authority" 


  it "returns 'user:password@example.com:8080' for #normalized_authority" 


  it "returns 8080 for #port" 


  it "returns 8080 for #normalized_port" 


  it "returns 80 for #default_port" 


  it "returns 'http://user:password@example.com:8080' for #site" 


  it "returns 'http://user:password@example.com:8080' for #normalized_site" 


  it "returns '/path' for #path" 


  it "returns '/path' for #normalized_path" 


  it "returns 'query=value' for #query" 


  it "returns 'query=value' for #normalized_query" 


  it "returns 'fragment' for #fragment" 


  it "returns 'fragment' for #normalized_fragment" 


  it "returns #hash" 


  it "returns #to_s" 


  it "should not be empty" 


  it "should not be frozen" 


  it "should allow destructive operations" 

end

describe Addressable::URI, "when frozen" do
  before do
    @uri = Addressable::URI.new.freeze
  end

  it "returns nil for #scheme" 


  it "returns nil for #normalized_scheme" 


  it "returns nil for #user" 


  it "returns nil for #normalized_user" 


  it "returns nil for #password" 


  it "returns nil for #normalized_password" 


  it "returns nil for #userinfo" 


  it "returns nil for #normalized_userinfo" 


  it "returns nil for #host" 


  it "returns nil for #normalized_host" 


  it "returns nil for #authority" 


  it "returns nil for #normalized_authority" 


  it "returns nil for #port" 


  it "returns nil for #normalized_port" 


  it "returns nil for #default_port" 


  it "returns nil for #site" 


  it "returns nil for #normalized_site" 


  it "returns '' for #path" 


  it "returns '' for #normalized_path" 


  it "returns nil for #query" 


  it "returns nil for #normalized_query" 


  it "returns nil for #fragment" 


  it "returns nil for #normalized_fragment" 


  it "returns #hash" 


  it "returns #to_s" 


  it "should be empty" 


  it "should be frozen" 


  it "should not be frozen after duping" 


  it "should not allow destructive operations" 

end

describe Addressable::URI, "when frozen" do
  before do
    @uri = Addressable::URI.parse(
      "HTTP://example.com.:%38%30/%70a%74%68?a=%31#1%323"
    ).freeze
  end

  it "returns 'HTTP' for #scheme" 


  it "returns 'http' for #normalized_scheme" 


  it "returns nil for #user" 


  it "returns nil for #normalized_user" 


  it "returns nil for #password" 


  it "returns nil for #normalized_password" 


  it "returns nil for #userinfo" 


  it "returns nil for #normalized_userinfo" 


  it "returns 'example.com.' for #host" 


  it "returns nil for #normalized_host" 


  it "returns 'example.com.:80' for #authority" 


  it "returns 'example.com:80' for #normalized_authority" 


  it "returns 80 for #port" 


  it "returns nil for #normalized_port" 


  it "returns 80 for #default_port" 


  it "returns 'HTTP://example.com.:80' for #site" 


  it "returns 'http://example.com' for #normalized_site" 


  it "returns '/%70a%74%68' for #path" 


  it "returns '/path' for #normalized_path" 


  it "returns 'a=%31' for #query" 


  it "returns 'a=1' for #normalized_query" 


  it "returns '/%70a%74%68?a=%31' for #request_uri" 


  it "returns '1%323' for #fragment" 


  it "returns '123' for #normalized_fragment" 


  it "returns #hash" 


  it "returns #to_s" 


  it "should not be empty" 


  it "should be frozen" 


  it "should not be frozen after duping" 


  it "should not allow destructive operations" 

end

describe Addressable::URI, "when created from string components" do
  before do
    @uri = Addressable::URI.new(
      :scheme => "http", :host => "example.com"
    )
  end

  it "should have a site value of 'http://example.com'" 


  it "should be equal to the equivalent parsed URI" 


  it "should raise an error if invalid components omitted" 

end

describe Addressable::URI, "when created with a nil host but " +
    "non-nil authority components" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with both an authority and a user" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with an authority and no port" do
  before do
    @uri = Addressable::URI.new(:authority => "user@example.com")
  end

  it "should not infer a port" 


  it "should have a site value of '//user@example.com'" 


  it "should have a 'null' origin" 

end

describe Addressable::URI, "when created with a host with trailing dots" do
  before do
    @uri = Addressable::URI.new(:authority => "example...")
  end

  it "should have a stable normalized form" 

end

describe Addressable::URI, "when created with a host with a backslash" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a host with a slash" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a host with a space" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with both a userinfo and a user" do
  it "should raise an error" 

end

describe Addressable::URI, "when created with a path that hasn't been " +
    "prefixed with a '/' but a host specified" do
  before do
    @uri = Addressable::URI.new(
      :scheme => "http", :host => "example.com", :path => "path"
    )
  end

  it "should prefix a '/' to the path" 


  it "should have a site value of 'http://example.com'" 


  it "should have an origin of 'http://example.com" 

end

describe Addressable::URI, "when created with a path that hasn't been " +
    "prefixed with a '/' but no host specified" do
  before do
    @uri = Addressable::URI.new(
      :scheme => "http", :path => "path"
    )
  end

  it "should not prefix a '/' to the path" 


  it "should have a site value of 'http:'" 


  it "should have a 'null' origin" 

end

describe Addressable::URI, "when parsed from an Addressable::URI object" do
  it "should not have unexpected side-effects" 


  it "should not have unexpected side-effects" 


  it "should not have unexpected side-effects" 


  it "should not have unexpected side-effects" 

end

describe Addressable::URI, "when parsed from something that looks " +
    "like a URI object" do
  it "should parse without error" 

end

describe Addressable::URI, "when parsed from a standard library URI object" do
  it "should parse without error" 

end

describe Addressable::URI, "when parsed from ''" do
  before do
    @uri = Addressable::URI.parse("")
  end

  it "should have no scheme" 


  it "should not be considered to be ip-based" 


  it "should have a path of ''" 


  it "should have a request URI of '/'" 


  it "should be considered relative" 


  it "should be considered to be in normal form" 


  it "should have a 'null' origin" 

end

# Section 1.1.2 of RFC 3986
describe Addressable::URI, "when parsed from " +
    "'ftp://ftp.is.co.za/rfc/rfc1808.txt'" do
  before do
    @uri = Addressable::URI.parse("ftp://ftp.is.co.za/rfc/rfc1808.txt")
  end

  it "should use the 'ftp' scheme" 


  it "should be considered to be ip-based" 


  it "should have a host of 'ftp.is.co.za'" 


  it "should have inferred_port of 21" 


  it "should have a path of '/rfc/rfc1808.txt'" 


  it "should not have a request URI" 


  it "should be considered to be in normal form" 


  it "should have an origin of 'ftp://ftp.is.co.za'" 

end

# Section 1.1.2 of RFC 3986
describe Addressable::URI, "when parsed from " +
    "'http://www.ietf.org/rfc/rfc2396.txt'" do
  before do
    @uri = Addressable::URI.parse("http://www.ietf.org/rfc/rfc2396.txt")
  end

  it "should use the 'http' scheme" 


  it "should be considered to be ip-based" 


  it "should have a host of 'www.ietf.org'" 


  it "should have inferred_port of 80" 


  it "should have a path of '/rfc/rfc2396.txt'" 


  it "should have a request URI of '/rfc/rfc2396.txt'" 


  it "should be considered to be in normal form" 


  it "should correctly omit components" 


  it "should correctly omit components destructively" 


  it "should have an origin of 'http://www.ietf.org'" 

end

# Section 1.1.2 of RFC 3986
describe Addressable::URI, "when parsed from " +
    "'ldap://[2001:db8::7]/c=GB?objectClass?one'" do
  before do
    @uri = Addressable::URI.parse("ldap://[2001:db8::7]/c=GB?objectClass?one")
  end

  it "should use the 'ldap' scheme" 


  it "should be considered to be ip-based" 


  it "should have a host of '[2001:db8::7]'" 


  it "should have inferred_port of 389" 


  it "should have a path of '/c=GB'" 


  it "should not have a request URI" 


  it "should not allow request URI assignment" 


  it "should have a query of 'objectClass?one'" 


  it "should be considered to be in normal form" 


  it "should correctly omit components" 


  it "should correctly omit components destructively" 


  it "should raise an error if omission would create an invalid URI" 


  it "should have an origin of 'ldap://[2001:db8::7]'" 

end

# Section 1.1.2 of RFC 3986
describe Addressable::URI, "when parsed from " +
    "'mailto:John.Doe@example.com'" do
  before do
    @uri = Addressable::URI.parse("mailto:John.Doe@example.com")
  end

  it "should use the 'mailto' scheme" 


  it "should not be considered to be ip-based" 


  it "should not have an inferred_port" 


  it "should have a path of 'John.Doe@example.com'" 


  it "should not have a request URI" 


  it "should be considered to be in normal form" 


  it "should have a 'null' origin" 

end

# Section 2 of RFC 6068
describe Addressable::URI, "when parsed from " +
    "'mailto:?to=addr1@an.example,addr2@an.example'" do
  before do
    @uri = Addressable::URI.parse(
      "mailto:?to=addr1@an.example,addr2@an.example"
    )
  end

  it "should use the 'mailto' scheme" 


  it "should not be considered to be ip-based" 


  it "should not have an inferred_port" 


  it "should have a path of ''" 


  it "should not have a request URI" 


  it "should have the To: field value parameterized" 


  it "should be considered to be in normal form" 


  it "should have a 'null' origin" 

end

# Section 1.1.2 of RFC 3986
describe Addressable::URI, "when parsed from " +
    "'news:comp.infosystems.www.servers.unix'" do
  before do
    @uri = Addressable::URI.parse("news:comp.infosystems.www.servers.unix")
  end

  it "should use the 'news' scheme" 


  it "should not have an inferred_port" 


  it "should not be considered to be ip-based" 


  it "should have a path of 'comp.infosystems.www.servers.unix'" 


  it "should not have a request URI" 


  it "should be considered to be in normal form" 


  it "should have a 'null' origin" 

end

# Section 1.1.2 of RFC 3986
describe Addressable::URI, "when parsed from " +
    "'tel:+1-816-555-1212'" do
  before do
    @uri = Addressable::URI.parse("tel:+1-816-555-1212")
  end

  it "should use the 'tel' scheme" 


  it "should not be considered to be ip-based" 


  it "should not have an inferred_port" 


  it "should have a path of '+1-816-555-1212'" 


  it "should not have a request URI" 


  it "should be considered to be in normal form" 


  it "should have a 'null' origin" 

end

# Section 1.1.2 of RFC 3986
describe Addressable::URI, "when parsed from " +
    "'telnet://192.0.2.16:80/'" do
  before do
    @uri = Addressable::URI.parse("telnet://192.0.2.16:80/")
  end

  it "should use the 'telnet' scheme" 


  it "should have a host of '192.0.2.16'" 


  it "should have a port of 80" 


  it "should have a inferred_port of 80" 


  it "should have a default_port of 23" 


  it "should be considered to be ip-based" 


  it "should have a path of '/'" 


  it "should not have a request URI" 


  it "should be considered to be in normal form" 


  it "should have an origin of 'telnet://192.0.2.16:80'" 

end

# Section 1.1.2 of RFC 3986
describe Addressable::URI, "when parsed from " +
    "'urn:oasis:names:specification:docbook:dtd:xml:4.1.2'" do
  before do
    @uri = Addressable::URI.parse(
      "urn:oasis:names:specification:docbook:dtd:xml:4.1.2")
  end

  it "should use the 'urn' scheme" 


  it "should not have an inferred_port" 


  it "should not be considered to be ip-based" 


  it "should have a path of " +
      "'oasis:names:specification:docbook:dtd:xml:4.1.2'" do
    expect(@uri.path).to eq("oasis:names:specification:docbook:dtd:xml:4.1.2")
  end

  it "should not have a request URI" 


  it "should be considered to be in normal form" 


  it "should have a 'null' origin" 

end

describe Addressable::URI, "when heuristically parsed from " +
    "'192.0.2.16:8000/path'" do
  before do
    @uri = Addressable::URI.heuristic_parse("192.0.2.16:8000/path")
  end

  it "should use the 'http' scheme" 


  it "should have a host of '192.0.2.16'" 


  it "should have a port of '8000'" 


  it "should be considered to be ip-based" 


  it "should have a path of '/path'" 


  it "should be considered to be in normal form" 


  it "should have an origin of 'http://192.0.2.16:8000'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com'" do
  before do
    @uri = Addressable::URI.parse("http://example.com")
  end

  it "when inspected, should have the correct URI" 


  it "when inspected, should have the correct class name" 


  it "when inspected, should have the correct object id" 


  it "should use the 'http' scheme" 


  it "should be considered to be ip-based" 


  it "should have an authority segment of 'example.com'" 


  it "should have a host of 'example.com'" 


  it "should be considered ip-based" 


  it "should have no username" 


  it "should have no password" 


  it "should use port 80" 


  it "should not have a specified port" 


  it "should have an empty path" 


  it "should have no query string" 


  it "should have a request URI of '/'" 


  it "should have no fragment" 


  it "should be considered absolute" 


  it "should not be considered relative" 


  it "should not be exactly equal to 42" 


  it "should not be equal to 42" 


  it "should not be roughly equal to 42" 


  it "should be exactly equal to http://example.com" 


  it "should be roughly equal to http://example.com/" 


  it "should be roughly equal to the string 'http://example.com/'" 


  it "should not be roughly equal to the string " +
      "'http://example.com:bogus/'" do
    expect(lambda do
      expect(@uri === "http://example.com:bogus/").to eq(false)
    end).not_to raise_error
  end

  it "should result in itself when joined with itself" 


  it "should be equivalent to http://EXAMPLE.com" 


  it "should be equivalent to http://EXAMPLE.com:80/" 


  it "should have the same hash as http://example.com" 


  it "should have the same hash as http://EXAMPLE.com after assignment" 


  it "should have a different hash from http://EXAMPLE.com" 


  it "should not allow origin assignment without scheme" 


  it "should not allow origin assignment without host" 


  it "should not allow origin assignment with bogus type" 


  # Section 6.2.3 of RFC 3986
  it "should be equivalent to http://example.com/" 


  # Section 6.2.3 of RFC 3986
  it "should be equivalent to http://example.com:/" 


  # Section 6.2.3 of RFC 3986
  it "should be equivalent to http://example.com:80/" 


  # Section 6.2.2.1 of RFC 3986
  it "should be equivalent to http://EXAMPLE.COM/" 


  it "should have a route of '/path/' to 'http://example.com/path/'" 


  it "should have a route of '..' from 'http://example.com/path/'" 


  it "should have a route of '#' to 'http://example.com/'" 


  it "should have a route of 'http://elsewhere.com/' to " +
      "'http://elsewhere.com/'" do
    expect(@uri.route_to("http://elsewhere.com/")).to eq(
      Addressable::URI.parse("http://elsewhere.com/")
    )
  end

  it "when joined with 'relative/path' should be " +
      "'http://example.com/relative/path'" do
    expect(@uri.join('relative/path')).to eq(
      Addressable::URI.parse("http://example.com/relative/path")
    )
  end

  it "when joined with a bogus object a TypeError should be raised" 


  it "should have the correct username after assignment" 


  it "should have the correct username after assignment" 


  it "should have the correct password after assignment" 


  it "should have the correct password after assignment" 


  it "should have the correct user/pass after repeated assignment" 


  it "should have the correct user/pass after userinfo assignment" 


  it "should correctly convert to a hash" 


  it "should be identical to its duplicate" 


  it "should have an origin of 'http://example.com'" 

end

# Section 5.1.2 of RFC 2616
describe Addressable::URI, "when parsed from " +
    "'HTTP://www.w3.org/pub/WWW/TheProject.html'" do
  before do
    @uri = Addressable::URI.parse("HTTP://www.w3.org/pub/WWW/TheProject.html")
  end

  it "should have the correct request URI" 


  it "should have the correct request URI after assignment" 


  it "should have the correct request URI after assignment" 


  it "should raise an error if the site value is set to something bogus" 


  it "should raise an error if the request URI is set to something bogus" 


  it "should correctly convert to a hash" 


  it "should have an origin of 'http://www.w3.org'" 

end

describe Addressable::URI, "when parsing IPv6 addresses" do
  it "should not raise an error for " +
      "'http://[3ffe:1900:4545:3:200:f8ff:fe21:67cf]/'" do
    Addressable::URI.parse("http://[3ffe:1900:4545:3:200:f8ff:fe21:67cf]/")
  end

  it "should not raise an error for " +
      "'http://[fe80:0:0:0:200:f8ff:fe21:67cf]/'" do
    Addressable::URI.parse("http://[fe80:0:0:0:200:f8ff:fe21:67cf]/")
  end

  it "should not raise an error for " +
      "'http://[fe80::200:f8ff:fe21:67cf]/'" do
    Addressable::URI.parse("http://[fe80::200:f8ff:fe21:67cf]/")
  end

  it "should not raise an error for " +
      "'http://[::1]/'" do
    Addressable::URI.parse("http://[::1]/")
  end

  it "should not raise an error for " +
      "'http://[fe80::1]/'" do
    Addressable::URI.parse("http://[fe80::1]/")
  end

  it "should raise an error for " +
      "'http://[<invalid>]/'" do
    expect(lambda do
      Addressable::URI.parse("http://[<invalid>]/")
    end).to raise_error(Addressable::URI::InvalidURIError)
  end
end

describe Addressable::URI, "when parsing IPv6 address" do
  subject { Addressable::URI.parse("http://[3ffe:1900:4545:3:200:f8ff:fe21:67cf]/") }
  its(:host) { should == '[3ffe:1900:4545:3:200:f8ff:fe21:67cf]' }
  its(:hostname) { should == '3ffe:1900:4545:3:200:f8ff:fe21:67cf' }
end

describe Addressable::URI, "when assigning IPv6 address" do
  it "should allow to set bare IPv6 address as hostname" 


  it "should allow to set bare IPv6 address as hostname with IPAddr object" 


  it "should not allow to set bare IPv6 address as host" 

end

describe Addressable::URI, "when parsing IPvFuture addresses" do
  it "should not raise an error for " +
      "'http://[v9.3ffe:1900:4545:3:200:f8ff:fe21:67cf]/'" do
    Addressable::URI.parse("http://[v9.3ffe:1900:4545:3:200:f8ff:fe21:67cf]/")
  end

  it "should not raise an error for " +
      "'http://[vff.fe80:0:0:0:200:f8ff:fe21:67cf]/'" do
    Addressable::URI.parse("http://[vff.fe80:0:0:0:200:f8ff:fe21:67cf]/")
  end

  it "should not raise an error for " +
      "'http://[v12.fe80::200:f8ff:fe21:67cf]/'" do
    Addressable::URI.parse("http://[v12.fe80::200:f8ff:fe21:67cf]/")
  end

  it "should not raise an error for " +
      "'http://[va0.::1]/'" do
    Addressable::URI.parse("http://[va0.::1]/")
  end

  it "should not raise an error for " +
      "'http://[v255.fe80::1]/'" do
    Addressable::URI.parse("http://[v255.fe80::1]/")
  end

  it "should raise an error for " +
      "'http://[v0.<invalid>]/'" do
    expect(lambda do
      Addressable::URI.parse("http://[v0.<invalid>]/")
    end).to raise_error(Addressable::URI::InvalidURIError)
  end
end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/")
  end

  # Based on http://intertwingly.net/blog/2004/07/31/URI-Equivalence
  it "should be equivalent to http://example.com" 


  # Based on http://intertwingly.net/blog/2004/07/31/URI-Equivalence
  it "should be equivalent to HTTP://example.com/" 


  # Based on http://intertwingly.net/blog/2004/07/31/URI-Equivalence
  it "should be equivalent to http://example.com:/" 


  # Based on http://intertwingly.net/blog/2004/07/31/URI-Equivalence
  it "should be equivalent to http://example.com:80/" 


  # Based on http://intertwingly.net/blog/2004/07/31/URI-Equivalence
  it "should be equivalent to http://Example.com/" 


  it "should have the correct username after assignment" 


  it "should have the correct password after assignment" 


  it "should have a request URI of '/'" 


  it "should correctly convert to a hash" 


  it "should be identical to its duplicate" 


  it "should have the same hash as its duplicate" 


  it "should have a different hash from its equivalent String value" 


  it "should have the same hash as an equal URI" 


  it "should be equivalent to http://EXAMPLE.com" 


  it "should be equivalent to http://EXAMPLE.com:80/" 


  it "should have the same hash as http://example.com/" 


  it "should have the same hash as http://example.com after assignment" 


  it "should have the same hash as http://example.com/? after assignment" 


  it "should have the same hash as http://example.com/? after assignment" 


  it "should have the same hash as http://example.com/# after assignment" 


  it "should have a different hash from http://example.com" 


  it "should have an origin of 'http://example.com'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com?#'" do
  before do
    @uri = Addressable::URI.parse("http://example.com?#")
  end

  it "should correctly convert to a hash" 


  it "should have a request URI of '/?'" 


  it "should normalize to 'http://example.com/'" 


  it "should have an origin of 'http://example.com'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://@example.com/'" do
  before do
    @uri = Addressable::URI.parse("http://@example.com/")
  end

  it "should be equivalent to http://example.com" 


  it "should correctly convert to a hash" 


  it "should be identical to its duplicate" 


  it "should have an origin of 'http://example.com'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com./'" do
  before do
    @uri = Addressable::URI.parse("http://example.com./")
  end

  it "should be equivalent to http://example.com" 


  it "should not be considered to be in normal form" 


  it "should be identical to its duplicate" 


  it "should have an origin of 'http://example.com'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://:@example.com/'" do
  before do
    @uri = Addressable::URI.parse("http://:@example.com/")
  end

  it "should be equivalent to http://example.com" 


  it "should correctly convert to a hash" 


  it "should be identical to its duplicate" 


  it "should have an origin of 'http://example.com'" 

end

describe Addressable::URI, "when parsed from " +
    "'HTTP://EXAMPLE.COM/'" do
  before do
    @uri = Addressable::URI.parse("HTTP://EXAMPLE.COM/")
  end

  it "should be equivalent to http://example.com" 


  it "should correctly convert to a hash" 


  it "should be identical to its duplicate" 


  it "should have an origin of 'http://example.com'" 


  it "should have a tld of 'com'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://www.example.co.uk/'" do
  before do
    @uri = Addressable::URI.parse("http://www.example.co.uk/")
  end

  it "should have an origin of 'http://www.example.co.uk'" 


  it "should have a tld of 'co.uk'" 


  it "should have a domain of 'example.co.uk'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://sub_domain.blogspot.com/'" do
  before do
    @uri = Addressable::URI.parse("http://sub_domain.blogspot.com/")
  end

  it "should have an origin of 'http://sub_domain.blogspot.com'" 


  it "should have a tld of 'com'" 


  it "should have a domain of 'blogspot.com'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/~smith/'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/~smith/")
  end

  # Based on http://intertwingly.net/blog/2004/07/31/URI-Equivalence
  it "should be equivalent to http://example.com/%7Esmith/" 


  # Based on http://intertwingly.net/blog/2004/07/31/URI-Equivalence
  it "should be equivalent to http://example.com/%7esmith/" 


  it "should be identical to its duplicate" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/%E8'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/%E8")
  end

  it "should not raise an exception when normalized" 


  it "should be considered to be in normal form" 


  it "should not change if encoded with the normalizing algorithm" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/path%2Fsegment/'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/path%2Fsegment/")
  end

  it "should be considered to be in normal form" 


  it "should be equal to 'http://example.com/path%2Fsegment/'" 


  it "should not be equal to 'http://example.com/path/segment/'" 


  it "should not be equal to 'http://example.com/path/segment/'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?%F6'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?%F6")
  end

  it "should not raise an exception when normalized" 


  it "should be considered to be in normal form" 


  it "should not change if encoded with the normalizing algorithm" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/#%F6'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/#%F6")
  end

  it "should not raise an exception when normalized" 


  it "should be considered to be in normal form" 


  it "should not change if encoded with the normalizing algorithm" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/%C3%87'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/%C3%87")
  end

  # Based on http://intertwingly.net/blog/2004/07/31/URI-Equivalence
  it "should be equivalent to 'http://example.com/C%CC%A7'" 


  it "should not change if encoded with the normalizing algorithm" 


  it "should raise an error if encoding with an unexpected return type" 


  it "if percent encoded should be 'http://example.com/C%25CC%25A7'" 


  it "if percent encoded should be 'http://example.com/C%25CC%25A7'" 


  it "should raise an error if encoding with an unexpected return type" 


  it "should be identical to its duplicate" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?q=string'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?q=string")
  end

  it "should use the 'http' scheme" 


  it "should have an authority segment of 'example.com'" 


  it "should have a host of 'example.com'" 


  it "should have no username" 


  it "should have no password" 


  it "should use port 80" 


  it "should have a path of '/'" 


  it "should have a query string of 'q=string'" 


  it "should have no fragment" 


  it "should be considered absolute" 


  it "should not be considered relative" 


  it "should be considered to be in normal form" 


  it "should be identical to its duplicate" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com:80/'" do
  before do
    @uri = Addressable::URI.parse("http://example.com:80/")
  end

  it "should use the 'http' scheme" 


  it "should have an authority segment of 'example.com:80'" 


  it "should have a host of 'example.com'" 


  it "should have no username" 


  it "should have no password" 


  it "should use port 80" 


  it "should have explicit port 80" 


  it "should have a path of '/'" 


  it "should have no query string" 


  it "should have no fragment" 


  it "should be considered absolute" 


  it "should not be considered relative" 


  it "should be exactly equal to http://example.com:80/" 


  it "should be roughly equal to http://example.com/" 


  it "should be roughly equal to the string 'http://example.com/'" 


  it "should not be roughly equal to the string " +
      "'http://example.com:bogus/'" do
    expect(lambda do
      expect(@uri === "http://example.com:bogus/").to eq(false)
    end).not_to raise_error
  end

  it "should result in itself when joined with itself" 


  # Section 6.2.3 of RFC 3986
  it "should be equal to http://example.com/" 


  # Section 6.2.3 of RFC 3986
  it "should be equal to http://example.com:/" 


  # Section 6.2.3 of RFC 3986
  it "should be equal to http://example.com:80/" 


  # Section 6.2.2.1 of RFC 3986
  it "should be equal to http://EXAMPLE.COM/" 


  it "should correctly convert to a hash" 


  it "should be identical to its duplicate" 


  it "should have an origin of 'http://example.com'" 


  it "should not change if encoded with the normalizing algorithm" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com:8080/'" do
  before do
    @uri = Addressable::URI.parse("http://example.com:8080/")
  end

  it "should use the 'http' scheme" 


  it "should have an authority segment of 'example.com:8080'" 


  it "should have a host of 'example.com'" 


  it "should have no username" 


  it "should have no password" 


  it "should use port 8080" 


  it "should have explicit port 8080" 


  it "should have default port 80" 


  it "should have a path of '/'" 


  it "should have no query string" 


  it "should have no fragment" 


  it "should be considered absolute" 


  it "should not be considered relative" 


  it "should be exactly equal to http://example.com:8080/" 


  it "should have a route of 'http://example.com:8080/' from " +
      "'http://example.com/path/to/'" do
    expect(@uri.route_from("http://example.com/path/to/")).to eq(
      Addressable::URI.parse("http://example.com:8080/")
    )
  end

  it "should have a route of 'http://example.com:8080/' from " +
      "'http://example.com:80/path/to/'" do
    expect(@uri.route_from("http://example.com:80/path/to/")).to eq(
      Addressable::URI.parse("http://example.com:8080/")
    )
  end

  it "should have a route of '../../' from " +
      "'http://example.com:8080/path/to/'" do
    expect(@uri.route_from("http://example.com:8080/path/to/")).to eq(
      Addressable::URI.parse("../../")
    )
  end

  it "should have a route of 'http://example.com:8080/' from " +
      "'http://user:pass@example.com/path/to/'" do
    expect(@uri.route_from("http://user:pass@example.com/path/to/")).to eq(
      Addressable::URI.parse("http://example.com:8080/")
    )
  end

  it "should correctly convert to a hash" 


  it "should be identical to its duplicate" 


  it "should have an origin of 'http://example.com:8080'" 


  it "should not change if encoded with the normalizing algorithm" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com:%38%30/'" do
  before do
    @uri = Addressable::URI.parse("http://example.com:%38%30/")
  end

  it "should have the correct port" 


  it "should not be considered to be in normal form" 


  it "should normalize to 'http://example.com/'" 


  it "should have an origin of 'http://example.com'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/%2E/'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/%2E/")
  end

  it "should be considered to be in normal form" 


  it "should normalize to 'http://example.com/%2E/'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/..'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/..")
  end

  it "should have the correct port" 


  it "should not be considered to be in normal form" 


  it "should normalize to 'http://example.com/'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/../..'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/../..")
  end

  it "should have the correct port" 


  it "should not be considered to be in normal form" 


  it "should normalize to 'http://example.com/'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/path(/..'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/path(/..")
  end

  it "should have the correct port" 


  it "should not be considered to be in normal form" 


  it "should normalize to 'http://example.com/'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/(path)/..'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/(path)/..")
  end

  it "should have the correct port" 


  it "should not be considered to be in normal form" 


  it "should normalize to 'http://example.com/'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/path(/../'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/path(/../")
  end

  it "should have the correct port" 


  it "should not be considered to be in normal form" 


  it "should normalize to 'http://example.com/'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/(path)/../'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/(path)/../")
  end

  it "should have the correct port" 


  it "should not be considered to be in normal form" 


  it "should normalize to 'http://example.com/'" 

end

describe Addressable::URI, "when parsed from " +
    "'/..//example.com'" do
  before do
    @uri = Addressable::URI.parse("/..//example.com")
  end

  it "should become invalid when normalized" 


  it "should have a path of '/..//example.com'" 

end

describe Addressable::URI, "when parsed from '/a/b/c/./../../g'" do
  before do
    @uri = Addressable::URI.parse("/a/b/c/./../../g")
  end

  it "should not be considered to be in normal form" 


  # Section 5.2.4 of RFC 3986
  it "should normalize to '/a/g'" 

end

describe Addressable::URI, "when parsed from 'mid/content=5/../6'" do
  before do
    @uri = Addressable::URI.parse("mid/content=5/../6")
  end

  it "should not be considered to be in normal form" 


  # Section 5.2.4 of RFC 3986
  it "should normalize to 'mid/6'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://www.example.com///../'" do
  before do
    @uri = Addressable::URI.parse('http://www.example.com///../')
  end

  it "should not be considered to be in normal form" 


  it "should normalize to 'http://www.example.com//'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/path/to/resource/'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/path/to/resource/")
  end

  it "should use the 'http' scheme" 


  it "should have an authority segment of 'example.com'" 


  it "should have a host of 'example.com'" 


  it "should have no username" 


  it "should have no password" 


  it "should use port 80" 


  it "should have a path of '/path/to/resource/'" 


  it "should have no query string" 


  it "should have no fragment" 


  it "should be considered absolute" 


  it "should not be considered relative" 


  it "should be exactly equal to http://example.com:8080/" 


  it "should have a route of 'resource/' from " +
      "'http://example.com/path/to/'" do
    expect(@uri.route_from("http://example.com/path/to/")).to eq(
      Addressable::URI.parse("resource/")
    )
  end

  it "should have a route of '../' from " +
    "'http://example.com/path/to/resource/sub'" do
    expect(@uri.route_from("http://example.com/path/to/resource/sub")).to eq(
      Addressable::URI.parse("../")
    )
  end


  it "should have a route of 'resource/' from " +
    "'http://example.com/path/to/another'" do
    expect(@uri.route_from("http://example.com/path/to/another")).to eq(
      Addressable::URI.parse("resource/")
    )
  end

  it "should have a route of 'resource/' from " +
      "'http://example.com/path/to/res'" do
    expect(@uri.route_from("http://example.com/path/to/res")).to eq(
      Addressable::URI.parse("resource/")
    )
  end

  it "should have a route of 'resource/' from " +
      "'http://example.com:80/path/to/'" do
    expect(@uri.route_from("http://example.com:80/path/to/")).to eq(
      Addressable::URI.parse("resource/")
    )
  end

  it "should have a route of 'http://example.com/path/to/' from " +
      "'http://example.com:8080/path/to/'" do
    expect(@uri.route_from("http://example.com:8080/path/to/")).to eq(
      Addressable::URI.parse("http://example.com/path/to/resource/")
    )
  end

  it "should have a route of 'http://example.com/path/to/' from " +
      "'http://user:pass@example.com/path/to/'" do
    expect(@uri.route_from("http://user:pass@example.com/path/to/")).to eq(
      Addressable::URI.parse("http://example.com/path/to/resource/")
    )
  end

  it "should have a route of '../../path/to/resource/' from " +
      "'http://example.com/to/resource/'" do
    expect(@uri.route_from("http://example.com/to/resource/")).to eq(
      Addressable::URI.parse("../../path/to/resource/")
    )
  end

  it "should correctly convert to a hash" 


  it "should be identical to its duplicate" 

end

describe Addressable::URI, "when parsed from " +
    "'relative/path/to/resource'" do
  before do
    @uri = Addressable::URI.parse("relative/path/to/resource")
  end

  it "should not have a scheme" 


  it "should not be considered ip-based" 


  it "should not have an authority segment" 


  it "should not have a host" 


  it "should have no username" 


  it "should have no password" 


  it "should not have a port" 


  it "should have a path of 'relative/path/to/resource'" 


  it "should have no query string" 


  it "should have no fragment" 


  it "should not be considered absolute" 


  it "should be considered relative" 


  it "should raise an error if routing is attempted" 


  it "when joined with 'another/relative/path' should be " +
      "'relative/path/to/another/relative/path'" do
    expect(@uri.join('another/relative/path')).to eq(
      Addressable::URI.parse("relative/path/to/another/relative/path")
    )
  end

  it "should be identical to its duplicate" 

end

describe Addressable::URI, "when parsed from " +
    "'relative_path_with_no_slashes'" do
  before do
    @uri = Addressable::URI.parse("relative_path_with_no_slashes")
  end

  it "should not have a scheme" 


  it "should not be considered ip-based" 


  it "should not have an authority segment" 


  it "should not have a host" 


  it "should have no username" 


  it "should have no password" 


  it "should not have a port" 


  it "should have a path of 'relative_path_with_no_slashes'" 


  it "should have no query string" 


  it "should have no fragment" 


  it "should not be considered absolute" 


  it "should be considered relative" 


  it "when joined with 'another_relative_path' should be " +
      "'another_relative_path'" do
    expect(@uri.join('another_relative_path')).to eq(
      Addressable::URI.parse("another_relative_path")
    )
  end
end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/file.txt'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/file.txt")
  end

  it "should have a scheme of 'http'" 


  it "should have an authority segment of 'example.com'" 


  it "should have a host of 'example.com'" 


  it "should have no username" 


  it "should have no password" 


  it "should use port 80" 


  it "should have a path of '/file.txt'" 


  it "should have a basename of 'file.txt'" 


  it "should have an extname of '.txt'" 


  it "should have no query string" 


  it "should have no fragment" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/file.txt;parameter'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/file.txt;parameter")
  end

  it "should have a scheme of 'http'" 


  it "should have an authority segment of 'example.com'" 


  it "should have a host of 'example.com'" 


  it "should have no username" 


  it "should have no password" 


  it "should use port 80" 


  it "should have a path of '/file.txt;parameter'" 


  it "should have a basename of 'file.txt'" 


  it "should have an extname of '.txt'" 


  it "should have no query string" 


  it "should have no fragment" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/file.txt;x=y'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/file.txt;x=y")
  end

  it "should have a scheme of 'http'" 


  it "should have a scheme of 'http'" 


  it "should have an authority segment of 'example.com'" 


  it "should have a host of 'example.com'" 


  it "should have no username" 


  it "should have no password" 


  it "should use port 80" 


  it "should have a path of '/file.txt;x=y'" 


  it "should have an extname of '.txt'" 


  it "should have no query string" 


  it "should have no fragment" 


  it "should be considered to be in normal form" 

end

describe Addressable::URI, "when parsed from " +
    "'svn+ssh://developername@rubyforge.org/var/svn/project'" do
  before do
    @uri = Addressable::URI.parse(
      "svn+ssh://developername@rubyforge.org/var/svn/project"
    )
  end

  it "should have a scheme of 'svn+ssh'" 


  it "should be considered to be ip-based" 


  it "should have a path of '/var/svn/project'" 


  it "should have a username of 'developername'" 


  it "should have no password" 


  it "should be considered to be in normal form" 

end

describe Addressable::URI, "when parsed from " +
    "'ssh+svn://developername@RUBYFORGE.ORG/var/svn/project'" do
  before do
    @uri = Addressable::URI.parse(
      "ssh+svn://developername@RUBYFORGE.ORG/var/svn/project"
    )
  end

  it "should have a scheme of 'ssh+svn'" 


  it "should have a normalized scheme of 'svn+ssh'" 


  it "should have a normalized site of 'svn+ssh'" 


  it "should not be considered to be ip-based" 


  it "should have a path of '/var/svn/project'" 


  it "should have a username of 'developername'" 


  it "should have no password" 


  it "should not be considered to be in normal form" 

end

describe Addressable::URI, "when parsed from " +
    "'mailto:user@example.com'" do
  before do
    @uri = Addressable::URI.parse("mailto:user@example.com")
  end

  it "should have a scheme of 'mailto'" 


  it "should not be considered to be ip-based" 


  it "should have a path of 'user@example.com'" 


  it "should have no user" 


  it "should be considered to be in normal form" 

end

describe Addressable::URI, "when parsed from " +
    "'tag:example.com,2006-08-18:/path/to/something'" do
  before do
    @uri = Addressable::URI.parse(
      "tag:example.com,2006-08-18:/path/to/something")
  end

  it "should have a scheme of 'tag'" 


  it "should be considered to be ip-based" 


  it "should have a path of " +
      "'example.com,2006-08-18:/path/to/something'" do
    expect(@uri.path).to eq("example.com,2006-08-18:/path/to/something")
  end

  it "should have no user" 


  it "should be considered to be in normal form" 


  it "should have a 'null' origin" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/x;y/'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/x;y/")
  end

  it "should be considered to be in normal form" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?x=1&y=2'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?x=1&y=2")
  end

  it "should be considered to be in normal form" 

end

describe Addressable::URI, "when parsed from " +
    "'view-source:http://example.com/'" do
  before do
    @uri = Addressable::URI.parse("view-source:http://example.com/")
  end

  it "should have a scheme of 'view-source'" 


  it "should have a path of 'http://example.com/'" 


  it "should be considered to be in normal form" 


  it "should have a 'null' origin" 

end

describe Addressable::URI, "when parsed from " +
    "'http://user:pass@example.com/path/to/resource?query=x#fragment'" do
  before do
    @uri = Addressable::URI.parse(
      "http://user:pass@example.com/path/to/resource?query=x#fragment")
  end

  it "should use the 'http' scheme" 


  it "should have an authority segment of 'user:pass@example.com'" 


  it "should have a username of 'user'" 


  it "should have a password of 'pass'" 


  it "should have a host of 'example.com'" 


  it "should use port 80" 


  it "should have a path of '/path/to/resource'" 


  it "should have a query string of 'query=x'" 


  it "should have a fragment of 'fragment'" 


  it "should be considered to be in normal form" 


  it "should have a route of '../../' to " +
      "'http://user:pass@example.com/path/'" do
    expect(@uri.route_to("http://user:pass@example.com/path/")).to eq(
      Addressable::URI.parse("../../")
    )
  end

  it "should have a route of 'to/resource?query=x#fragment' " +
      "from 'http://user:pass@example.com/path/'" do
    expect(@uri.route_from("http://user:pass@example.com/path/")).to eq(
      Addressable::URI.parse("to/resource?query=x#fragment")
    )
  end

  it "should have a route of '?query=x#fragment' " +
      "from 'http://user:pass@example.com/path/to/resource'" do
    expect(@uri.route_from("http://user:pass@example.com/path/to/resource")).to eq(
      Addressable::URI.parse("?query=x#fragment")
    )
  end

  it "should have a route of '#fragment' " +
      "from 'http://user:pass@example.com/path/to/resource?query=x'" do
    expect(@uri.route_from(
      "http://user:pass@example.com/path/to/resource?query=x")).to eq(
        Addressable::URI.parse("#fragment")
    )
  end

  it "should have a route of '#fragment' from " +
      "'http://user:pass@example.com/path/to/resource?query=x#fragment'" do
    expect(@uri.route_from(
      "http://user:pass@example.com/path/to/resource?query=x#fragment"
    )).to eq(Addressable::URI.parse("#fragment"))
  end

  it "should have a route of 'http://elsewhere.com/' to " +
      "'http://elsewhere.com/'" do
    expect(@uri.route_to("http://elsewhere.com/")).to eq(
      Addressable::URI.parse("http://elsewhere.com/")
    )
  end

  it "should have a route of " +
      "'http://user:pass@example.com/path/to/resource?query=x#fragment' " +
      "from 'http://example.com/path/to/'" do
    expect(@uri.route_from("http://elsewhere.com/path/to/")).to eq(
      Addressable::URI.parse(
        "http://user:pass@example.com/path/to/resource?query=x#fragment")
    )
  end

  it "should have the correct scheme after assignment" 


  it "should have the correct site segment after assignment" 


  it "should have the correct authority segment after assignment" 


  it "should have the correct userinfo segment after assignment" 


  it "should have the correct username after assignment" 


  it "should have the correct password after assignment" 


  it "should have the correct host after assignment" 


  it "should have the correct host after assignment" 


  it "should raise an error if assigning a bogus object to the hostname" 


  it "should have the correct port after assignment" 


  it "should have the correct origin after assignment" 


  it "should have the correct path after assignment" 


  it "should have the correct scheme and authority after nil assignment" 


  it "should have the correct scheme and authority after assignment" 


  it "should have the correct path after nil assignment" 


  it "should have the correct query string after assignment" 


  it "should have the correct query string after hash assignment" 


  it "should have the correct query string after flag hash assignment" 


  it "should raise an error if query values are set to a bogus type" 


  it "should have the correct fragment after assignment" 


  it "should have the correct values after a merge" 


  it "should have the correct values after a merge" 


  it "should have the correct values after a merge" 


  it "should have the correct values after a merge" 


  it "should have the correct values after a merge" 


  it "should have the correct values after a merge" 


  it "should have the correct values after a merge" 


  it "should have the correct values after a destructive merge" 


  it "should fail to merge with bogus values" 


  it "should fail to merge with bogus values" 


  it "should fail to merge with bogus parameters" 


  it "should fail to merge with bogus parameters" 


  it "should fail to merge with both authority and subcomponents" 


  it "should fail to merge with both userinfo and subcomponents" 


  it "should be identical to its duplicate" 


  it "should have an origin of 'http://example.com'" 

end

describe Addressable::URI, "when parsed from " +
  "'http://example.com/search?q=Q%26A'" do

  before do
    @uri = Addressable::URI.parse("http://example.com/search?q=Q%26A")
  end

  it "should have a query of 'q=Q%26A'" 


  it "should have query_values of {'q' => 'Q&A'}" 


  it "should normalize to the original uri " +
      "(with the ampersand properly percent-encoded)" do
    expect(@uri.normalize.to_s).to eq("http://example.com/search?q=Q%26A")
  end
end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?&x=b'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?&x=b")
  end

  it "should have a query of '&x=b'" 


  it "should have query_values of {'x' => 'b'}" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?q='one;two'&x=1'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?q='one;two'&x=1")
  end

  it "should have a query of 'q='one;two'&x=1'" 


  it "should have query_values of {\"q\" => \"'one;two'\", \"x\" => \"1\"}" 


  it "should escape the ';' character when normalizing to avoid ambiguity " +
      "with the W3C HTML 4.01 specification" do
    # HTML 4.01 Section B.2.2
    expect(@uri.normalize.query).to eq("q='one%3Btwo'&x=1")
  end
end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?&&x=b'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?&&x=b")
  end

  it "should have a query of '&&x=b'" 


  it "should have query_values of {'x' => 'b'}" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?q=a&&x=b'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?q=a&&x=b")
  end

  it "should have a query of 'q=a&&x=b'" 


  it "should have query_values of {'q' => 'a, 'x' => 'b'}" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?q&&x=b'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?q&&x=b")
  end

  it "should have a query of 'q&&x=b'" 


  it "should have query_values of {'q' => true, 'x' => 'b'}" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?q=a+b'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?q=a+b")
  end

  it "should have a query of 'q=a+b'" 


  it "should have query_values of {'q' => 'a b'}" 


  it "should have a normalized query of 'q=a+b'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?q=a%2bb'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?q=a%2bb")
  end

  it "should have a query of 'q=a+b'" 


  it "should have query_values of {'q' => 'a+b'}" 


  it "should have a normalized query of 'q=a%2Bb'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?v=%7E&w=%&x=%25&y=%2B&z=C%CC%A7'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?v=%7E&w=%&x=%25&y=%2B&z=C%CC%A7")
  end

  it "should have a normalized query of 'v=~&w=%25&x=%25&y=%2B&z=%C3%87'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?v=%7E&w=%&x=%25&y=+&z=C%CC%A7'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?v=%7E&w=%&x=%25&y=+&z=C%CC%A7")
  end

  it "should have a normalized query of 'v=~&w=%25&x=%25&y=+&z=%C3%87'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/sound%2bvision'" do
  before do
    @uri = Addressable::URI.parse("http://example.com/sound%2bvision")
  end

  it "should have a normalized path of '/sound+vision'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/?q='" do
  before do
    @uri = Addressable::URI.parse("http://example.com/?q=")
  end

  it "should have a query of 'q='" 


  it "should have query_values of {'q' => ''}" 

end

describe Addressable::URI, "when parsed from " +
    "'http://user@example.com'" do
  before do
    @uri = Addressable::URI.parse("http://user@example.com")
  end

  it "should use the 'http' scheme" 


  it "should have a username of 'user'" 


  it "should have no password" 


  it "should have a userinfo of 'user'" 


  it "should have a normalized userinfo of 'user'" 


  it "should have a host of 'example.com'" 


  it "should have default_port 80" 


  it "should use port 80" 


  it "should have the correct username after assignment" 


  it "should have the correct password after assignment" 


  it "should have the correct userinfo segment after assignment" 


  it "should have the correct userinfo segment after nil assignment" 


  it "should have the correct authority segment after assignment" 


  it "should raise an error after nil assignment of authority segment" 

end

describe Addressable::URI, "when parsed from " +
    "'http://user:@example.com'" do
  before do
    @uri = Addressable::URI.parse("http://user:@example.com")
  end

  it "should use the 'http' scheme" 


  it "should have a username of 'user'" 


  it "should have a password of ''" 


  it "should have a normalized userinfo of 'user:'" 


  it "should have a host of 'example.com'" 


  it "should use port 80" 


  it "should have the correct username after assignment" 


  it "should have the correct password after assignment" 


  it "should have the correct authority segment after assignment" 

end

describe Addressable::URI, "when parsed from " +
    "'http://:pass@example.com'" do
  before do
    @uri = Addressable::URI.parse("http://:pass@example.com")
  end

  it "should use the 'http' scheme" 


  it "should have a username of ''" 


  it "should have a password of 'pass'" 


  it "should have a userinfo of ':pass'" 


  it "should have a normalized userinfo of ':pass'" 


  it "should have a host of 'example.com'" 


  it "should use port 80" 


  it "should have the correct username after assignment" 


  it "should have the correct password after assignment" 


  it "should have the correct authority segment after assignment" 

end

describe Addressable::URI, "when parsed from " +
    "'http://:@example.com'" do
  before do
    @uri = Addressable::URI.parse("http://:@example.com")
  end

  it "should use the 'http' scheme" 


  it "should have a username of ''" 


  it "should have a password of ''" 


  it "should have a normalized userinfo of nil" 


  it "should have a host of 'example.com'" 


  it "should use port 80" 


  it "should have the correct username after assignment" 


  it "should have the correct password after assignment" 


  it "should have the correct authority segment after assignment" 

end

describe Addressable::URI, "when parsed from " +
    "'#example'" do
  before do
    @uri = Addressable::URI.parse("#example")
  end

  it "should be considered relative" 


  it "should have a host of nil" 


  it "should have a site of nil" 


  it "should have a normalized_site of nil" 


  it "should have a path of ''" 


  it "should have a query string of nil" 


  it "should have a fragment of 'example'" 

end

describe Addressable::URI, "when parsed from " +
    "the network-path reference '//example.com/'" do
  before do
    @uri = Addressable::URI.parse("//example.com/")
  end

  it "should be considered relative" 


  it "should have a host of 'example.com'" 


  it "should have a path of '/'" 


  it "should raise an error if routing is attempted" 


  it "should have a 'null' origin" 

end

describe Addressable::URI, "when parsed from " +
    "'feed://http://example.com/'" do
  before do
    @uri = Addressable::URI.parse("feed://http://example.com/")
  end

  it "should have a host of 'http'" 


  it "should have a path of '//example.com/'" 

end

describe Addressable::URI, "when parsed from " +
    "'feed:http://example.com/'" do
  before do
    @uri = Addressable::URI.parse("feed:http://example.com/")
  end

  it "should have a path of 'http://example.com/'" 


  it "should normalize to 'http://example.com/'" 


  it "should have a 'null' origin" 

end

describe Addressable::URI, "when parsed from " +
    "'example://a/b/c/%7Bfoo%7D'" do
  before do
    @uri = Addressable::URI.parse("example://a/b/c/%7Bfoo%7D")
  end

  # Section 6.2.2 of RFC 3986
  it "should be equivalent to eXAMPLE://a/./b/../b/%63/%7bfoo%7d" 


  it "should have an origin of 'example://a'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://example.com/indirect/path/./to/../resource/'" do
  before do
    @uri = Addressable::URI.parse(
      "http://example.com/indirect/path/./to/../resource/")
  end

  it "should use the 'http' scheme" 


  it "should have a host of 'example.com'" 


  it "should use port 80" 


  it "should have a path of '/indirect/path/./to/../resource/'" 


  # Section 6.2.2.3 of RFC 3986
  it "should have a normalized path of '/indirect/path/resource/'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://under_score.example.com/'" do
  it "should not cause an error" 

end

describe Addressable::URI, "when parsed from " +
    "'./this:that'" do
  before do
    @uri = Addressable::URI.parse("./this:that")
  end

  it "should be considered relative" 


  it "should have no scheme" 


  it "should have a 'null' origin" 

end

describe Addressable::URI, "when parsed from " +
    "'this:that'" do
  before do
    @uri = Addressable::URI.parse("this:that")
  end

  it "should be considered absolute" 


  it "should have a scheme of 'this'" 


  it "should have a 'null' origin" 

end

describe Addressable::URI, "when parsed from '?'" do
  before do
    @uri = Addressable::URI.parse("?")
  end

  it "should normalize to ''" 


  it "should have the correct return type" 


  it "should have a 'null' origin" 

end

describe Addressable::URI, "when parsed from '?one=1&two=2&three=3'" do
  before do
    @uri = Addressable::URI.parse("?one=1&two=2&three=3")
  end

  it "should have the correct query values" 


  it "should raise an error for invalid return type values" 


  it "should have the correct array query values" 


  it "should have a 'null' origin" 

end

describe Addressable::URI, "when parsed from '?one=1=uno&two=2=dos'" do
  before do
    @uri = Addressable::URI.parse("?one=1=uno&two=2=dos")
  end

  it "should have the correct query values" 


  it "should have the correct array query values" 

end

describe Addressable::URI, "when parsed from '?one[two][three]=four'" do
  before do
    @uri = Addressable::URI.parse("?one[two][three]=four")
  end

  it "should have the correct query values" 


  it "should have the correct array query values" 

end

describe Addressable::URI, "when parsed from '?one.two.three=four'" do
  before do
    @uri = Addressable::URI.parse("?one.two.three=four")
  end

  it "should have the correct query values" 


  it "should have the correct array query values" 

end

describe Addressable::URI, "when parsed from " +
    "'?one[two][three]=four&one[two][five]=six'" do
  before do
    @uri = Addressable::URI.parse("?one[two][three]=four&one[two][five]=six")
  end

  it "should have the correct query values" 


  it "should have the correct array query values" 

end

describe Addressable::URI, "when parsed from " +
    "'?one.two.three=four&one.two.five=six'" do
  before do
    @uri = Addressable::URI.parse("?one.two.three=four&one.two.five=six")
  end

  it "should have the correct query values" 


  it "should have the correct array query values" 

end

describe Addressable::URI, "when parsed from " +
    "'?one=two&one=three'" do
  before do
    @uri = Addressable::URI.parse(
      "?one=two&one=three&one=four"
    )
  end

  it "should have correct array query values" 


  it "should have correct hash query values" 


  it "should handle assignment with keys of mixed type" 

end

describe Addressable::URI, "when parsed from " +
    "'?one[two][three][]=four&one[two][three][]=five'" do
  before do
    @uri = Addressable::URI.parse(
      "?one[two][three][]=four&one[two][three][]=five"
    )
  end

  it "should have correct query values" 


  it "should have correct array query values" 

end

describe Addressable::URI, "when parsed from " +
    "'?one[two][three][0]=four&one[two][three][1]=five'" do
  before do
    @uri = Addressable::URI.parse(
      "?one[two][three][0]=four&one[two][three][1]=five"
    )
  end

  it "should have the correct query values" 

end

describe Addressable::URI, "when parsed from " +
    "'?one[two][three][1]=four&one[two][three][0]=five'" do
  before do
    @uri = Addressable::URI.parse(
      "?one[two][three][1]=four&one[two][three][0]=five"
    )
  end

  it "should have the correct query values" 

end

describe Addressable::URI, "when parsed from " +
    "'?one[two][three][2]=four&one[two][three][1]=five'" do
  before do
    @uri = Addressable::URI.parse(
      "?one[two][three][2]=four&one[two][three][1]=five"
    )
  end

  it "should have the correct query values" 

end

describe Addressable::URI, "when parsed from " +
    "'http://www.詹姆斯.com/'" do
  before do
    @uri = Addressable::URI.parse("http://www.詹姆斯.com/")
  end

  it "should be equivalent to 'http://www.xn--8ws00zhy3a.com/'" 


  it "should not have domain name encoded during normalization" 


  it "should have an origin of 'http://www.xn--8ws00zhy3a.com'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://www.詹姆斯.com/ some spaces /'" do
  before do
    @uri = Addressable::URI.parse("http://www.詹姆斯.com/ some spaces /")
  end

  it "should be equivalent to " +
      "'http://www.xn--8ws00zhy3a.com/%20some%20spaces%20/'" do
    expect(@uri).to eq(
      Addressable::URI.parse(
        "http://www.xn--8ws00zhy3a.com/%20some%20spaces%20/")
    )
  end

  it "should not have domain name encoded during normalization" 


  it "should have an origin of 'http://www.xn--8ws00zhy3a.com'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://www.xn--8ws00zhy3a.com/'" do
  before do
    @uri = Addressable::URI.parse("http://www.xn--8ws00zhy3a.com/")
  end

  it "should be displayed as http://www.詹姆斯.com/" 


  it "should properly force the encoding" 


  it "should have an origin of 'http://www.xn--8ws00zhy3a.com'" 

end

describe Addressable::URI, "when parsed from " +
    "'http://www.詹姆斯.com/atomtests/iri/詹.html'" do
  before do
    @uri = Addressable::URI.parse("http://www.詹姆斯.com/atomtests/iri/詹.html")
  end

  it "should normalize to " +
      "http://www.xn--8ws00zhy3a.com/atomtests/iri/%E8%A9%B9.html" do
    expect(@uri.normalize.to_s).to eq(
      "http://www.xn--8ws00zhy3a.com/atomtests/iri/%E8%A9%B9.html"
    )
    expect(@uri.normalize!.to_s).to eq(
      "http://www.xn--8ws00zhy3a.com/atomtests/iri/%E8%A9%B9.html"
    )
  end
end

describe Addressable::URI, "when parsed from a percent-encoded IRI" do
  before do
    @uri = Addressable::URI.parse(
      "http://www.%E3%81%BB%E3%82%93%E3%81%A8%E3%81%86%E3%81%AB%E3%81%AA" +
      "%E3%81%8C%E3%81%84%E3%82%8F%E3%81%91%E3%81%AE%E3%82%8F%E3%81%8B%E3" +
      "%82%89%E3%81%AA%E3%81%84%E3%81%A9%E3%82%81%E3%81%84%E3%82%93%E3%82" +
      "%81%E3%81%84%E3%81%AE%E3%82%89%E3%81%B9%E3%82%8B%E3%81%BE%E3%81%A0" +
      "%E3%81%AA%E3%81%8C%E3%81%8F%E3%81%97%E3%81%AA%E3%81%84%E3%81%A8%E3" +
      "%81%9F%E3%82%8A%E3%81%AA%E3%81%84.w3.mag.keio.ac.jp"
    )
  end

  it "should normalize to something sane" 


  it "should have the correct origin" 

end

describe Addressable::URI, "with a base uri of 'http://a/b/c/d;p?q'" do
  before do
    @uri = Addressable::URI.parse("http://a/b/c/d;p?q")
  end

  # Section 5.4.1 of RFC 3986
  it "when joined with 'g:h' should resolve to g:h" 


  # Section 5.4.1 of RFC 3986
  it "when joined with 'g' should resolve to http://a/b/c/g" 


  # Section 5.4.1 of RFC 3986
  it "when joined with './g' should resolve to http://a/b/c/g" 


  # Section 5.4.1 of RFC 3986
  it "when joined with 'g/' should resolve to http://a/b/c/g/" 


  # Section 5.4.1 of RFC 3986
  it "when joined with '/g' should resolve to http://a/g" 


  # Section 5.4.1 of RFC 3986
  it "when joined with '//g' should resolve to http://g" 


  # Section 5.4.1 of RFC 3986
  it "when joined with '?y' should resolve to http://a/b/c/d;p?y" 


  # Section 5.4.1 of RFC 3986
  it "when joined with 'g?y' should resolve to http://a/b/c/g?y" 


  # Section 5.4.1 of RFC 3986
  it "when joined with '#s' should resolve to http://a/b/c/d;p?q#s" 


  # Section 5.4.1 of RFC 3986
  it "when joined with 'g#s' should resolve to http://a/b/c/g#s" 


  # Section 5.4.1 of RFC 3986
  it "when joined with 'g?y#s' should resolve to http://a/b/c/g?y#s" 


  # Section 5.4.1 of RFC 3986
  it "when joined with ';x' should resolve to http://a/b/c/;x" 


  # Section 5.4.1 of RFC 3986
  it "when joined with 'g;x' should resolve to http://a/b/c/g;x" 


  # Section 5.4.1 of RFC 3986
  it "when joined with 'g;x?y#s' should resolve to http://a/b/c/g;x?y#s" 


  # Section 5.4.1 of RFC 3986
  it "when joined with '' should resolve to http://a/b/c/d;p?q" 


  # Section 5.4.1 of RFC 3986
  it "when joined with '.' should resolve to http://a/b/c/" 


  # Section 5.4.1 of RFC 3986
  it "when joined with './' should resolve to http://a/b/c/" 


  # Section 5.4.1 of RFC 3986
  it "when joined with '..' should resolve to http://a/b/" 


  # Section 5.4.1 of RFC 3986
  it "when joined with '../' should resolve to http://a/b/" 


  # Section 5.4.1 of RFC 3986
  it "when joined with '../g' should resolve to http://a/b/g" 


  # Section 5.4.1 of RFC 3986
  it "when joined with '../..' should resolve to http://a/" 


  # Section 5.4.1 of RFC 3986
  it "when joined with '../../' should resolve to http://a/" 


  # Section 5.4.1 of RFC 3986
  it "when joined with '../../g' should resolve to http://a/g" 


  # Section 5.4.2 of RFC 3986
  it "when joined with '../../../g' should resolve to http://a/g" 


  it "when joined with '../.././../g' should resolve to http://a/g" 


  # Section 5.4.2 of RFC 3986
  it "when joined with '../../../../g' should resolve to http://a/g" 


  # Section 5.4.2 of RFC 3986
  it "when joined with '/./g' should resolve to http://a/g" 


  # Section 5.4.2 of RFC 3986
  it "when joined with '/../g' should resolve to http://a/g" 


  # Section 5.4.2 of RFC 3986
  it "when joined with 'g.' should resolve to http://a/b/c/g." 


  # Section 5.4.2 of RFC 3986
  it "when joined with '.g' should resolve to http://a/b/c/.g" 


  # Section 5.4.2 of RFC 3986
  it "when joined with 'g..' should resolve to http://a/b/c/g.." 


  # Section 5.4.2 of RFC 3986
  it "when joined with '..g' should resolve to http://a/b/c/..g" 


  # Section 5.4.2 of RFC 3986
  it "when joined with './../g' should resolve to http://a/b/g" 


  # Section 5.4.2 of RFC 3986
  it "when joined with './g/.' should resolve to http://a/b/c/g/" 


  # Section 5.4.2 of RFC 3986
  it "when joined with 'g/./h' should resolve to http://a/b/c/g/h" 


  # Section 5.4.2 of RFC 3986
  it "when joined with 'g/../h' should resolve to http://a/b/c/h" 


  # Section 5.4.2 of RFC 3986
  it "when joined with 'g;x=1/./y' " +
      "should resolve to http://a/b/c/g;x=1/y" do
    expect((@uri + "g;x=1/./y").to_s).to eq("http://a/b/c/g;x=1/y")
    expect(Addressable::URI.join(
      @uri.to_s, "g;x=1/./y").to_s).to eq("http://a/b/c/g;x=1/y")
  end

  # Section 5.4.2 of RFC 3986
  it "when joined with 'g;x=1/../y' should resolve to http://a/b/c/y" 


  # Section 5.4.2 of RFC 3986
  it "when joined with 'g?y/./x' " +
      "should resolve to http://a/b/c/g?y/./x" do
    expect((@uri + "g?y/./x").to_s).to eq("http://a/b/c/g?y/./x")
    expect(Addressable::URI.join(
      @uri.to_s, "g?y/./x").to_s).to eq("http://a/b/c/g?y/./x")
  end

  # Section 5.4.2 of RFC 3986
  it "when joined with 'g?y/../x' " +
      "should resolve to http://a/b/c/g?y/../x" do
    expect((@uri + "g?y/../x").to_s).to eq("http://a/b/c/g?y/../x")
    expect(Addressable::URI.join(
      @uri.to_s, "g?y/../x").to_s).to eq("http://a/b/c/g?y/../x")
  end

  # Section 5.4.2 of RFC 3986
  it "when joined with 'g#s/./x' " +
      "should resolve to http://a/b/c/g#s/./x" do
    expect((@uri + "g#s/./x").to_s).to eq("http://a/b/c/g#s/./x")
    expect(Addressable::URI.join(
      @uri.to_s, "g#s/./x").to_s).to eq("http://a/b/c/g#s/./x")
  end

  # Section 5.4.2 of RFC 3986
  it "when joined with 'g#s/../x' " +
      "should resolve to http://a/b/c/g#s/../x" do
    expect((@uri + "g#s/../x").to_s).to eq("http://a/b/c/g#s/../x")
    expect(Addressable::URI.join(
      @uri.to_s, "g#s/../x").to_s).to eq("http://a/b/c/g#s/../x")
  end

  # Section 5.4.2 of RFC 3986
  it "when joined with 'http:g' should resolve to http:g" 


  # Edge case to be sure
  it "when joined with '//example.com/' should " +
      "resolve to http://example.com/" do
    expect((@uri + "//example.com/").to_s).to eq("http://example.com/")
    expect(Addressable::URI.join(
      @uri.to_s, "//example.com/").to_s).to eq("http://example.com/")
  end

  it "when joined with a bogus object a TypeError should be raised" 

end

describe Addressable::URI, "when converting the path " +
    "'relative/path/to/something'" do
  before do
    @path = 'relative/path/to/something'
  end

  it "should convert to " +
      "\'relative/path/to/something\'" do
    @uri = Addressable::URI.convert_path(@path)
    expect(@uri.to_str).to eq("relative/path/to/something")
  end

  it "should join with an absolute file path correctly" 

end

describe Addressable::URI, "when converting a bogus path" do
  it "should raise a TypeError" 

end

describe Addressable::URI, "when given a UNIX root directory" do
  before do
    @path = "/"
  end

  it "should convert to \'file:///\'" 


  it "should have an origin of 'file://'" 

end

describe Addressable::URI, "when given a Windows root directory" do
  before do
    @path = "C:\\"
  end

  it "should convert to \'file:///c:/\'" 


  it "should have an origin of 'file://'" 

end

describe Addressable::URI, "when given the path '/one/two/'" do
  before do
    @path = '/one/two/'
  end

  it "should convert to " +
      "\'file:///one/two/\'" do
    @uri = Addressable::URI.convert_path(@path)
    expect(@uri.to_str).to eq("file:///one/two/")
  end

  it "should have an origin of 'file://'" 

end

describe Addressable::URI, "when given the tld " do
  it "'uk' should have a tld of 'uk'" 


  context "which " do
    let (:uri) { Addressable::URI.parse("http://comrade.net/path/to/source/") }

    it "contains a subdomain" 


    it "is part of the domain" 

  end
end

describe Addressable::URI, "when given the path " +
    "'c:\\windows\\My Documents 100%20\\foo.txt'" do
  before do
    @path = "c:\\windows\\My Documents 100%20\\foo.txt"
  end

  it "should convert to " +
      "\'file:///c:/windows/My%20Documents%20100%20/foo.txt\'" do
    @uri = Addressable::URI.convert_path(@path)
    expect(@uri.to_str).to eq("file:///c:/windows/My%20Documents%20100%20/foo.txt")
  end

  it "should have an origin of 'file://'" 

end

describe Addressable::URI, "when given the path " +
    "'file://c:\\windows\\My Documents 100%20\\foo.txt'" do
  before do
    @path = "file://c:\\windows\\My Documents 100%20\\foo.txt"
  end

  it "should convert to " +
      "\'file:///c:/windows/My%20Documents%20100%20/foo.txt\'" do
    @uri = Addressable::URI.convert_path(@path)
    expect(@uri.to_str).to eq("file:///c:/windows/My%20Documents%20100%20/foo.txt")
  end

  it "should have an origin of 'file://'" 

end

describe Addressable::URI, "when given the path " +
    "'file:c:\\windows\\My Documents 100%20\\foo.txt'" do
  before do
    @path = "file:c:\\windows\\My Documents 100%20\\foo.txt"
  end

  it "should convert to " +
      "\'file:///c:/windows/My%20Documents%20100%20/foo.txt\'" do
    @uri = Addressable::URI.convert_path(@path)
    expect(@uri.to_str).to eq("file:///c:/windows/My%20Documents%20100%20/foo.txt")
  end

  it "should have an origin of 'file://'" 

end

describe Addressable::URI, "when given the path " +
    "'file:/c:\\windows\\My Documents 100%20\\foo.txt'" do
  before do
    @path = "file:/c:\\windows\\My Documents 100%20\\foo.txt"
  end

  it "should convert to " +
      "\'file:///c:/windows/My%20Documents%20100%20/foo.txt\'" do
    @uri = Addressable::URI.convert_path(@path)
    expect(@uri.to_str).to eq("file:///c:/windows/My%20Documents%20100%20/foo.txt")
  end

  it "should have an origin of 'file://'" 

end

describe Addressable::URI, "when given the path " +
    "'file:///c|/windows/My%20Documents%20100%20/foo.txt'" do
  before do
    @path = "file:///c|/windows/My%20Documents%20100%20/foo.txt"
  end

  it "should convert to " +
      "\'file:///c:/windows/My%20Documents%20100%20/foo.txt\'" do
    @uri = Addressable::URI.convert_path(@path)
    expect(@uri.to_str).to eq("file:///c:/windows/My%20Documents%20100%20/foo.txt")
  end

  it "should have an origin of 'file://'" 

end

describe Addressable::URI, "when given an http protocol URI" do
  before do
    @path = "http://example.com/"
  end

  it "should not do any conversion at all" 

end

class SuperString
  def initialize(string)
    @string = string.to_s
  end

  def to_str
    return @string
  end
end

describe Addressable::URI, "when parsing a non-String object" do
  it "should correctly parse anything with a 'to_str' method" 


  it "should raise a TypeError for objects than cannot be converted" 


  it "should correctly parse heuristically anything with a 'to_str' method" 


  it "should raise a TypeError for objects than cannot be converted" 

end

describe Addressable::URI, "when form encoding a hash" do
  it "should result in correct percent encoded sequence" 


  it "should result in correct percent encoded sequence" 


  it "should result in correct percent encoded sequence" 


  it "should result in correct percent encoded sequence" 


  it "should result in correctly encoded newlines" 


  it "should result in a sorted percent encoded sequence" 

end

describe Addressable::URI, "when form encoding a non-Array object" do
  it "should raise a TypeError for objects than cannot be converted" 

end

# See https://tools.ietf.org/html/rfc6749#appendix-B
describe Addressable::URI, "when form encoding the example value from OAuth 2" do
  it "should result in correct values" 

end

# See https://tools.ietf.org/html/rfc6749#appendix-B
describe Addressable::URI, "when form unencoding the example value from OAuth 2" do
  it "should result in correct values" 

end

describe Addressable::URI, "when form unencoding a string" do
  it "should result in correct values" 


  it "should result in correct values" 


  it "should result in correct values" 


  it "should result in correct values" 


  it "should result in correct values" 


  it "should result in correct values" 

end

describe Addressable::URI, "when form unencoding a non-String object" do
  it "should correctly parse anything with a 'to_str' method" 


  it "should raise a TypeError for objects than cannot be converted" 

end

describe Addressable::URI, "when normalizing a non-String object" do
  it "should correctly parse anything with a 'to_str' method" 


  it "should raise a TypeError for objects than cannot be converted" 


  it "should raise a TypeError for objects than cannot be converted" 

end

describe Addressable::URI, "when normalizing a path with an encoded slash" do
  it "should result in correct percent encoded sequence" 

end

describe Addressable::URI, "when normalizing a partially encoded string" do
  it "should result in correct percent encoded sequence" 


  it "should result in correct percent encoded sequence" 

end

describe Addressable::URI, "when normalizing a unicode sequence" do
  it "should result in correct percent encoded sequence" 


  it "should result in correct percent encoded sequence" 

end

describe Addressable::URI, "when normalizing a multibyte string" do
  it "should result in correct percent encoded sequence" 


  it "should result in correct percent encoded sequence" 

end

describe Addressable::URI, "when normalizing a string but leaving some characters encoded" do
  it "should result in correct percent encoded sequence" 


  it "should not modify the character class" 

end

describe Addressable::URI, "when encoding a string with existing encodings to upcase" do
  it "should result in correct percent encoded sequence" 

end

describe Addressable::URI, "when encoding a multibyte string" do
  it "should result in correct percent encoded sequence" 


  it "should result in correct percent encoded sequence" 

end

describe Addressable::URI, "when form encoding a multibyte string" do
  it "should result in correct percent encoded sequence" 

end

describe Addressable::URI, "when encoding a string with ASCII chars 0-15" do
  it "should result in correct percent encoded sequence" 


  it "should result in correct percent encoded sequence" 

end

describe Addressable::URI, "when unencoding a multibyte string" do
  it "should result in correct percent encoded sequence" 


  it "should consistently use UTF-8 internally" 


  it "should result in correct percent encoded sequence as a URI" 

end

describe Addressable::URI, "when partially unencoding a string" do
  it "should unencode all characters by default" 


  it "should unencode characters not in leave_encoded" 


  it "should leave characters in leave_encoded alone" 

end

describe Addressable::URI, "when unencoding a bogus object" do
  it "should raise a TypeError" 


  it "should raise a TypeError" 

end

describe Addressable::URI, "when encoding a bogus object" do
  it "should raise a TypeError" 


  it "should raise a TypeError" 


  it "should raise a TypeError" 


  it "should raise a TypeError" 

end

describe Addressable::URI, "when given the input " +
    "'http://example.com/'" do
  before do
    @input = "http://example.com/"
  end

  it "should heuristically parse to 'http://example.com/'" 


  it "should not raise error when frozen" 

end

describe Addressable::URI, "when given the input " +
    "'https://example.com/'" do
  before do
    @input = "https://example.com/"
  end

  it "should heuristically parse to 'https://example.com/'" 

end

describe Addressable::URI, "when given the input " +
    "'http:example.com/'" do
  before do
    @input = "http:example.com/"
  end

  it "should heuristically parse to 'http://example.com/'" 


  it "should heuristically parse to 'http://example.com/' " +
      "even with a scheme hint of 'ftp'" do
    @uri = Addressable::URI.heuristic_parse(@input, {:scheme => 'ftp'})
    expect(@uri.to_s).to eq("http://example.com/")
  end
end

describe Addressable::URI, "when given the input " +
    "'https:example.com/'" do
  before do
    @input = "https:example.com/"
  end

  it "should heuristically parse to 'https://example.com/'" 


  it "should heuristically parse to 'https://example.com/' " +
      "even with a scheme hint of 'ftp'" do
    @uri = Addressable::URI.heuristic_parse(@input, {:scheme => 'ftp'})
    expect(@uri.to_s).to eq("https://example.com/")
  end
end

describe Addressable::URI, "when given the input " +
    "'http://example.com/example.com/'" do
  before do
    @input = "http://example.com/example.com/"
  end

  it "should heuristically parse to 'http://example.com/example.com/'" 

end

describe Addressable::URI, "when given the input " +
    "'http://prefix\\.example.com/'" do
  before do
    @input = "http://prefix\\.example.com/"
  end

  it "should heuristically parse to 'http://prefix/.example.com/'" 


  it "should heuristically parse to 'http://prefix/.example.com/' " +
      "even with a scheme hint of 'ftp'" do
    @uri = Addressable::URI.heuristic_parse(@input, {:scheme => 'ftp'})
    expect(@uri.to_s).to eq("http://prefix/.example.com/")
  end
end

describe Addressable::URI, "when given the input " +
    "'http://p:\\/'" do
  before do
    @input = "http://p:\\/"
  end

  it "should heuristically parse to 'http://p//'" 


  it "should heuristically parse to 'http://p//' " +
      "even with a scheme hint of 'ftp'" do
    @uri = Addressable::URI.heuristic_parse(@input, {:scheme => 'ftp'})
    expect(@uri.to_s).to eq("http://p//")
  end
end

describe Addressable::URI, "when given the input " +
    "'http://p://'" do
  before do
    @input = "http://p://"
  end

  it "should heuristically parse to 'http://p//'" 


  it "should heuristically parse to 'http://p//' " +
      "even with a scheme hint of 'ftp'" do
    @uri = Addressable::URI.heuristic_parse(@input, {:scheme => 'ftp'})
    expect(@uri.to_s).to eq("http://p//")
  end
end

describe Addressable::URI, "when given the input " +
    "'http://p://p'" do
  before do
    @input = "http://p://p"
  end

  it "should heuristically parse to 'http://p//p'" 


  it "should heuristically parse to 'http://p//p' " +
      "even with a scheme hint of 'ftp'" do
    @uri = Addressable::URI.heuristic_parse(@input, {:scheme => 'ftp'})
    expect(@uri.to_s).to eq("http://p//p")
  end
end

describe Addressable::URI, "when given the input " +
    "'http://prefix .example.com/'" do
  before do
    @input = "http://prefix .example.com/"
  end

  # Justification here being that no browser actually tries to resolve this.
  # They all treat this as a web search.
  it "should heuristically parse to 'http://prefix%20.example.com/'" 


  it "should heuristically parse to 'http://prefix%20.example.com/' " +
      "even with a scheme hint of 'ftp'" do
    @uri = Addressable::URI.heuristic_parse(@input, {:scheme => 'ftp'})
    expect(@uri.to_s).to eq("http://prefix%20.example.com/")
  end
end

describe Addressable::URI, "when given the input " +
    "'  http://www.example.com/  '" do
  before do
    @input = "  http://www.example.com/  "
  end

  it "should heuristically parse to 'http://prefix%20.example.com/'" 

end

describe Addressable::URI, "when given the input " +
    "'http://prefix%2F.example.com/'" do
  before do
    @input = "http://prefix%2F.example.com/"
  end

  it "should heuristically parse to 'http://prefix%2F.example.com/'" 


  it "should heuristically parse to 'http://prefix%2F.example.com/' " +
      "even with a scheme hint of 'ftp'" do
    @uri = Addressable::URI.heuristic_parse(@input, {:scheme => 'ftp'})
    expect(@uri.to_s).to eq("http://prefix%2F.example.com/")
  end
end

describe Addressable::URI, "when given the input " +
    "'/path/to/resource'" do
  before do
    @input = "/path/to/resource"
  end

  it "should heuristically parse to '/path/to/resource'" 

end

describe Addressable::URI, "when given the input " +
    "'relative/path/to/resource'" do
  before do
    @input = "relative/path/to/resource"
  end

  it "should heuristically parse to 'relative/path/to/resource'" 

end

describe Addressable::URI, "when given the input " +
    "'example.com'" do
  before do
    @input = "example.com"
  end

  it "should heuristically parse to 'http://example.com'" 

end

describe Addressable::URI, "when given the input " +
    "'example.com' and a scheme hint of 'ftp'" do
  before do
    @input = "example.com"
    @hints = {:scheme => 'ftp'}
  end

  it "should heuristically parse to 'http://example.com'" 

end

describe Addressable::URI, "when given the input " +
    "'example.com:21' and a scheme hint of 'ftp'" do
  before do
    @input = "example.com:21"
    @hints = {:scheme => 'ftp'}
  end

  it "should heuristically parse to 'http://example.com:21'" 

end

describe Addressable::URI, "when given the input " +
    "'example.com/path/to/resource'" do
  before do
    @input = "example.com/path/to/resource"
  end

  it "should heuristically parse to 'http://example.com/path/to/resource'" 

end

describe Addressable::URI, "when given the input " +
    "'http:///example.com'" do
  before do
    @input = "http:///example.com"
  end

  it "should heuristically parse to 'http://example.com'" 

end

describe Addressable::URI, "when given the input which "\
  "start with digits and has specified port" do
  before do
    @input = "7777.example.org:8089"
  end

  it "should heuristically parse to 'http://7777.example.org:8089'" 

end

describe Addressable::URI, "when given the input " +
    "'feed:///example.com'" do
  before do
    @input = "feed:///example.com"
  end

  it "should heuristically parse to 'feed://example.com'" 

end

describe Addressable::URI, "when given the input " +
    "'file://localhost/path/to/resource/'" do
  before do
    @input = "file://localhost/path/to/resource/"
  end

  it "should heuristically parse to 'file:///path/to/resource/'" 

end

describe Addressable::URI, "when given the input " +
    "'file://path/to/resource/'" do
  before do
    @input = "file://path/to/resource/"
  end

  it "should heuristically parse to 'file:///path/to/resource/'" 

end

describe Addressable::URI, "when given the input " +
    "'file://///path/to/resource/'" do
  before do
    @input = "file:///////path/to/resource/"
  end

  it "should heuristically parse to 'file:////path/to/resource/'" 

end

describe Addressable::URI, "when given the input " +
    "'feed://http://example.com'" do
  before do
    @input = "feed://http://example.com"
  end

  it "should heuristically parse to 'feed:http://example.com'" 

end

describe Addressable::URI, "when given the input " +
    "::URI.parse('http://example.com')" do
  before do
    @input = ::URI.parse('http://example.com')
  end

  it "should heuristically parse to 'http://example.com'" 

end

describe Addressable::URI, "when assigning query values" do
  before do
    @uri = Addressable::URI.new
  end

  it "should correctly assign {:a => 'a', :b => ['c', 'd', 'e']}" 


  it "should raise an error attempting to assign {'a' => {'b' => ['c']}}" 


  it "should raise an error attempting to assign " +
      "{:b => '2', :a => {:c => '1'}}" do
    expect(lambda do
      @uri.query_values = {:b => '2', :a => {:c => '1'}}
    end).to raise_error(TypeError)
  end

  it "should raise an error attempting to assign " +
      "{:a => 'a', :b => [{:c => 'c', :d => 'd'}, " +
      "{:e => 'e', :f => 'f'}]}" do
    expect(lambda do
      @uri.query_values = {
        :a => "a", :b => [{:c => "c", :d => "d"}, {:e => "e", :f => "f"}]
      }
    end).to raise_error(TypeError)
  end

  it "should raise an error attempting to assign " +
      "{:a => 'a', :b => [{:c => true, :d => 'd'}, " +
      "{:e => 'e', :f => 'f'}]}" do
    expect(lambda do
      @uri.query_values = {
        :a => 'a', :b => [{:c => true, :d => 'd'}, {:e => 'e', :f => 'f'}]
      }
    end).to raise_error(TypeError)
  end

  it "should raise an error attempting to assign " +
      "{:a => 'a', :b => {:c => true, :d => 'd'}}" do
    expect(lambda do
      @uri.query_values = {
        :a => 'a', :b => {:c => true, :d => 'd'}
      }
    end).to raise_error(TypeError)
  end

  it "should raise an error attempting to assign " +
      "{:a => 'a', :b => {:c => true, :d => 'd'}}" do
    expect(lambda do
      @uri.query_values = {
        :a => 'a', :b => {:c => true, :d => 'd'}
      }
    end).to raise_error(TypeError)
  end

  it "should correctly assign {:a => 1, :b => 1.5}" 


  it "should raise an error attempting to assign " +
      "{:z => 1, :f => [2, {999.1 => [3,'4']}, ['h', 'i']], " +
      ":a => {:b => ['c', 'd'], :e => true, :y => 0.5}}" do
    expect(lambda do
      @uri.query_values = {
        :z => 1,
        :f => [ 2, {999.1 => [3,'4']}, ['h', 'i'] ],
        :a => { :b => ['c', 'd'], :e => true, :y => 0.5 }
      }
    end).to raise_error(TypeError)
  end

  it "should correctly assign {}" 


  it "should correctly assign nil" 


  it "should correctly sort {'ab' => 'c', :ab => 'a', :a => 'x'}" 


  it "should correctly assign " +
      "[['b', 'c'], ['b', 'a'], ['a', 'a']]" do
    # Order can be guaranteed in this format, so preserve it.
    @uri.query_values = [['b', 'c'], ['b', 'a'], ['a', 'a']]
    expect(@uri.query).to eq("b=c&b=a&a=a")
  end

  it "should preserve query string order" 


  describe 'when a hash with mixed types is assigned to query_values' do
    it 'should not raise an error' 

  end
end

describe Addressable::URI, "when assigning path values" do
  before do
    @uri = Addressable::URI.new
  end

  it "should correctly assign paths containing colons" 


  it "should correctly assign paths containing colons" 


  it "should correctly assign paths containing colons" 


  it "should not allow relative paths to be assigned on absolute URIs" 


  it "should not allow relative paths to be assigned on absolute URIs" 


  it "should not allow relative paths to be assigned on absolute URIs" 

end

describe Addressable::URI, "when initializing a subclass of Addressable::URI" do
  before do
    @uri = Class.new(Addressable::URI).new
  end

  it "should have the same class after being parsed" 


  it "should have the same class as its duplicate" 


  it "should have the same class after being normalized" 


  it "should have the same class after being merged" 


  it "should have the same class after being joined" 

end

