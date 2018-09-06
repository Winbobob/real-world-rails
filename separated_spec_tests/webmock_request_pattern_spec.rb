require 'spec_helper'

describe WebMock::RequestPattern do

  describe "describing itself" do
    it "should report string describing itself" 


    it "should report string describing itself with block" 


    it "should report string describing itself with query params" 


    it "should report string describing itself with query params as hash including matcher" 


    it "should report string describing itself with body as hash including matcher" 

  end

  describe "with" do
    before(:each) do
      @request_pattern =WebMock::RequestPattern.new(:get, "www.example.com")
    end

    it "should have assigned body pattern" 


    it "should have assigned normalized headers pattern" 


    it "should raise an error if options passed to `with` are invalid" 


    it "should raise an error if neither options or block is provided" 

  end


  class WebMock::RequestPattern
    def match(request_signature)
      self.matches?(request_signature)
    end
  end

  describe "when matching" do

    it "should match if uri matches and method matches" 


    it "should match if uri matches and method pattern is any" 


    it "should not match if request has different method" 


    it "should match if uri matches request uri" 


    it "should match if request has unescaped uri" 


    it "should match if request has escaped uri" 


    it "should match if uri regexp pattern matches unescaped form of request uri" 


    it "should match if uri regexp pattern matches request uri" 


    it "should match if uri Addressable::Template pattern matches unescaped form of request uri" 


    it "should match if uri Addressable::Template pattern matches request uri" 


    it "should match for uris with same parameters as pattern" 


    it "should not match for uris with different parameters" 


    it "should match for uri parameters in different order" 


    describe "when parameters are escaped" do

      it "should match if uri pattern has escaped parameters and request has unescaped parameters" 


      it "should match if uri pattern has unescaped parameters and request has escaped parameters" 


      it "should match if uri regexp pattern matches uri with unescaped parameters and request has escaped parameters" 


      it "should match if uri regexp pattern matches uri with escaped parameters and request has unescaped parameters"  do
        expect(WebMock::RequestPattern.new(:get, /.*a=a%20b.*/)).
          to match(WebMock::RequestSignature.new(:get, "www.example.com/?a=a b"))
      end

      it "should match if uri Addressable::Template pattern matches uri without parameter value and request has escaped parameters" 


      it "should match if uri Addressable::Template pattern matches uri without parameter value and request has unescaped parameters"  do
        expect(WebMock::RequestPattern.new(:get, Addressable::Template.new("www.example.com/{?a}"))).
          to match(WebMock::RequestSignature.new(:get, "www.example.com/?a=a b"))
      end

      it "should match if uri Addressable::Template pattern matches uri with unescaped parameter value and request has unescaped parameters"  do
        expect(WebMock::RequestPattern.new(:get, Addressable::Template.new("www.example.com/?a=a b"))).
          to match(WebMock::RequestSignature.new(:get, "www.example.com/?a=a b"))
      end

      it "should match if uri Addressable::Template pattern matches uri with escaped parameter value and request has escaped parameters"  do
        expect(WebMock::RequestPattern.new(:get, Addressable::Template.new("www.example.com/?a=a%20b"))).
          to match(WebMock::RequestSignature.new(:get, "www.example.com/?a=a%20b"))
      end

    end

    describe "when matching requests on query params" do

      describe "when uri is described as regexp" do
        it "should match request query params" 


        it "should match request query params if params don't match" 


        it "should match when query params are declared as HashIncluding matcher matching params" 


        it "should not match when query params are declared as HashIncluding matcher not matching params" 


        it "should match when query params are declared as RSpec HashIncluding matcher matching params" 


        it "should not match when query params are declared as RSpec HashIncluding matcher not matching params" 

      end

      describe "when uri is described as Addressable::Template" do
        it "should raise error if query params are specified" 


        it "should match request query params if params don't match" 


        it "should match when query params are declared as HashIncluding matcher matching params" 


        it "should not match when query params are declared as HashIncluding matcher not matching params" 


        it "should match when query params are declared as RSpec HashIncluding matcher matching params" 


        it "should not match when query params are declared as RSpec HashIncluding matcher not matching params" 

      end

      describe "when uri is described as string" do
        it "should match when query params are the same as declared in hash" 


        it "should not match when query params are different than the declared in hash" 


        it "should match when query params are the same as declared as string" 


        it "should match when query params are the same as declared both in query option or url" 


        it "should match when query params are declared as HashIncluding matcher matching params" 


        it "should not match when query params are declared as HashIncluding matcher not matching params" 


        it "should match when query params are declared as RSpec HashIncluding matcher matching params" 


        it "should not match when query params are declared as RSpec HashIncluding matcher not matching params" 


        context "when using query values notation as flat array" do
          before :all do
            WebMock::Config.instance.query_values_notation = :flat_array
          end

          it "should not match when repeated query params are not the same as declared as string" 


          after :all do
            WebMock::Config.instance.query_values_notation = nil
          end
        end
      end
    end

    describe "when matching requests with body" do

      it "should match if request body and body pattern are the same" 


      it "should match if request body matches regexp" 


      it "should not match if body pattern is different than request body" 


      it "should not match if request body doesn't match regexp pattern" 


      it "should match if pattern doesn't have specified body" 


      it "should not match if pattern has body specified as nil but request body is not empty" 


      it "should not match if pattern has empty body but request body is not empty" 


      it "should not match if pattern has body specified but request has no body" 


      describe "when body in pattern is declared as a hash" do
        let(:body_hash) { {:a => '1', :b => 'five', 'c' => {'d' => ['e', 'f']}} }

        describe "for request with url encoded body" do
          it "should match when hash matches body" 


          it "should match when hash matches body in different order of params" 


          it "should not match when hash doesn't match url encoded body" 


          it "should not match when body is not url encoded" 


          it "should match when hash contains regex values" 


          it "should not match when hash does not contains regex values" 


          context 'body is an hash with an array of hashes' do
            let(:body_hash) { {a: [{'b' => '1'}, {'b' => '2'}]} }

            it "should match when hash matches body" 

          end

          context 'body is an hash with an array of hashes with multiple keys' do
            let(:body_hash) { {a: [{'b' => '1', 'a' => '2'}, {'b' => '3'}]} }

            it "should match when hash matches body" 

          end
        end

        describe "for request with json body and content type is set to json" do
          it "should match when hash matches body" 
          it "should match if hash matches body in different form" 
          it "should not match when body is not json" 


          it "should not match if request body is different" 


          it "should not match if request body is has less params than pattern" 


          it "should not match if request body is has more params than pattern" 

        end

        describe "for request with xml body and content type is set to xml" do
          let(:body_hash) { {"opt" => {:a => '1', :b => 'five', 'c' => {'d' => ['e', 'f']}}} }

          it "should match when hash matches body" 
          it "should match if hash matches body in different form" 
          it "should not match when body is not xml" 
          it "matches when the content type include a charset" 

        end
      end

      describe "when body in a pattern is declared as a partial hash matcher" do
        let(:signature) { WebMock::RequestSignature.new(:post, "www.example.com", body: 'a=1&c[d][]=e&c[d][]=f&b=five') }

       it "should match when query params are declared as HashIncluding matcher matching params" 
        it "should not match when query params are declared as HashIncluding matcher not matching params" 


        it "should match when query params are declared as RSpec HashIncluding matcher matching params" 


        it "should not match when query params are declared as RSpec HashIncluding matcher not matching params" 

      end
    end

    it "should match if pattern and request have the same headers" 


    it "should match if pattern headers values are regexps matching request header values" 


    it "should not match if pattern has different value of header than request" 


    it "should not match if pattern header value regexp doesn't match request header value" 


    it "should match if request has more headers than request pattern" 


    it "should not match if request has less headers than the request pattern" 


    it "should match even is header keys are declared in different form" 


    it "should match is pattern doesn't have specified headers" 


    it "should not match if pattern has nil headers but request has headers" 


    it "should not match if pattern has empty headers but request has headers" 


    it "should not match if pattern has specified headers but request has nil headers" 


    it "should not match if pattern has specified headers but request has empty headers" 


    it "should match if block given in pattern evaluates request to true" 


    it "should not match if block given in pattrn evaluates request to false" 


    it "should yield block with request signature" 


  end


end

