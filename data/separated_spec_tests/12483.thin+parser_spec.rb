require 'spec_helper'

# Require mongrel so we can test that Thin parser don't clash w/ Mongrel parser.
begin
  require 'mongrel'
rescue LoadError
  warn "Install mongrel to test compatibility w/ it"
end

describe Request, 'parser' do
  it 'should include basic headers' 

  
  it 'should upcase headers' 

  
  it 'should not prepend HTTP_ to Content-Type and Content-Length' 

  
  it 'should raise error on invalid request line' 

  
  it 'should support fragment in uri' 

  
  it 'should parse path with query string' 

  
  it 'should parse headers from GET request' 


  it 'should parse POST request with data' 


  it 'should not fuck up on stupid fucked IE6 headers' 


  it 'shoud accept long query string' 

  
  it 'should parse even with stupid Content-Length' 

  
  it "should parse ie6 urls" 

  
  it "should parse absolute request URI" 

  
  
  it "should fails on heders larger then MAX_HEADER" 

  
  it "should default SERVER_NAME to localhost" 

  
  it 'should normalize http_fields' 

  
  it "should parse PATH_INFO with semicolon" 

  
  it "should parse IE7 badly encoded URL" 

end

