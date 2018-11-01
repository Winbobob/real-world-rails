require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Rack::Pjax do
  include Rack::Test::Methods # can be moved to config

  def generate_app(options={})
    body = options[:body]

    Rack::Lint.new(
      Rack::Pjax.new(
        lambda do |env|
          [
            200,
            {'Content-Type' => 'text/plain', 'Content-Length' => Rack::Utils.bytesize(body).to_s},
            [body]
          ]
        end
      )
    )
  end

  context "a pjaxified app, upon receiving a pjax-request" do
    before do
      self.class.app = generate_app(:body => '<html><title>Hello</title><body><div data-pjax-container>World!</div></body></html>')
    end

    it "should return the title-tag in the body" 


    it "should return the inner-html of the pjax-container in the body" 


    it "should return the inner-html of the custom pjax-container in the body" 


    it "should handle self closing tags with HTML5 elements" 


    it "should handle nesting of elements inside anchor tags" 


    it "should handle html5 br tags correctly" 


    it "should return the correct Content Length" 


    it "should return the original body when there's no pjax-container" 


    it "should preserve whitespaces of the original body" 

  end

  context "a pjaxified app, upon receiving a non-pjax request" do
    before do
      self.class.app = generate_app(:body => '<html><title>Hello</title><body><div data-pjax-container>World!</div></body></html>')
    end

    it "should return the original body" 


    it "should return the correct Content Length" 

  end
end

