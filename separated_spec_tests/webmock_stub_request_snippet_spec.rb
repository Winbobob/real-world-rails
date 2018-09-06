require 'spec_helper'

describe WebMock::StubRequestSnippet do
  describe "to_s" do
    describe "GET" do
      before(:each) do
        @request_signature = WebMock::RequestSignature.new(:get, "www.example.com/?a=b&c=d", headers: {})
      end

      it "should print stub request snippet with url with params and method and empty successful response" 


      it "should print stub request snippet with body if available" 


      it "should print stub request snippet with multiline body" 


      it "should print stub request snippet with headers if any" 


      it "should print stub request snippet with body and headers" 


      it "should not print to_return part if not wanted" 

    end

    describe "POST" do
      let(:form_body) { 'user%5bfirst_name%5d=Bartosz' }
      let(:multipart_form_body) { 'complicated stuff--ABC123--goes here' }
      it "should print stub request snippet with body as a hash using rails conventions on form posts" 


      it "should print stub request snippet leaving body as string when not a urlencoded form" 


      it "should print stub request snippet with valid JSON body when request header contains 'Accept'=>'application/json' " 

    end

  end
end

