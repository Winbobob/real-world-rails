# encoding: utf-8
# frozen_string_literal: true
RSpec.describe Warden::Manager do

  before(:all) do
    load_strategies
  end

  it "should insert a Proxy object into the rack env" 


  describe "thrown auth" do
    before(:each) do
      @basic_app = lambda{|env| [200,{'Content-Type' => 'text/plain'},'OK']}
      @authd_app = lambda do |e|
        if e['warden'].authenticated?
          [200,{'Content-Type' => 'text/plain'},"OK"]
        else
          [401,{'Content-Type' => 'text/plain'},"Fail From The App"]
        end
      end
      @env = Rack::MockRequest.
        env_for('/', 'HTTP_VERSION' => '1.1', 'REQUEST_METHOD' => 'GET')
    end # before(:each)

    describe "Failure" do
      it "should respond with a 401 response if the strategy fails authentication" 


      it "should use the failure message given to the failure method" 


      it "should set the message from the winning strategy in warden.options hash" 


      it "should render the failure app when there's a failure" 


      it "should call failure app if warden is thrown even after successful authentication" 


      it "should set the attempted url in warden.options hash" 


      it "should set action in warden.options if overridden" 



      it "should catch a resubmitted request" 


      it "should use the default scopes action when a bare throw is used" 

    end # failure
  end

  describe "integrated strategies" do
    before(:each) do
      RAS = Warden::Strategies unless defined?(RAS)
      Warden::Strategies.clear!
      @app = setup_rack do |env|
        env['warden'].authenticate!(:foobar)
        [200, {"Content-Type" => "text/plain"}, ["Foo Is A Winna"]]
      end
    end

    describe "redirecting" do

      it "should redirect with a message" 


      it "should redirect with a default message" 


      it "should redirect with a permanent redirect" 


      it "should redirect with a content type" 


      it "should redirect with a default content type" 

    end

    describe "failing" do
      it "should fail according to the failure app" 


      it "should allow you to customize the response" 


      it "should allow you to customize the response without the explicit call to custom_failure! if not intercepting 401" 


      it "should render the failure application for a 401 if no custom_failure flag is set" 


    end # failing

    describe "custom rack response" do
      it "should return a custom rack response" 

    end

    describe "app returns Rack::Response" do
      it "should return it" 

    end

    describe "success" do
      it "should pass through to the application when there is success" 

    end
  end # integrated strategies

  it "should allow me to set a different default scope for warden" 


  it "should allow me to access strategies through manager" 

end

