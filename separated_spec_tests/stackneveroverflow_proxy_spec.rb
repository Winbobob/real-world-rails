# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Warden::Proxy do
  before(:all) do
    load_strategies
  end

  before(:each) do
    @basic_app = lambda{|env| [200,{'Content-Type' => 'text/plain'},'OK']}
    @authd_app = lambda do |e|
      e['warden'].authenticate
      if e['warden'].authenticated?
        [200,{'Content-Type' => 'text/plain'},"OK"]
      else
        [401,{'Content-Type' => 'text/plain'},"You Fail"]
      end
    end
    @env = env_with_params("/")
  end # before(:each)

  describe "authentication" do

    it "should not check the authentication if it is not checked" 


    it "should check the authentication if it is explicitly checked" 


    it "should not allow the request if incorrect conditions are supplied" 


    it "should allow the request if the correct conditions are supplied" 


    it "should allow authentication in my application" 


    it "should allow me to select which strategies I use in my application" 


    it "should raise error on missing strategies" 


    it "should raise error if the strategy failed" 


    it "should not raise error on missing strategies if silencing" 


    it "should allow me to get access to the user at warden.user." 


    it "should run strategies when authenticate? is asked" 


    it "should properly send the scope to the strategy" 


    it "should try multiple authentication strategies" 


    it "should look for an active user in the session with authenticate" 


    it "should look for an active user in the session with authenticate?" 


    it "should look for an active user in the session with authenticate!" 


    it "should throw an error when authenticate!" 


    it "should login 2 different users from the session" 


    it "should not authenticate other scopes just because the first is authenticated" 


    SID_REGEXP = /rack\.session=([^;]*);/

    it "should renew session when user is set" 


    it "should not renew session when user is fetch" 

  end

  describe "authentication cache" do
    it "should run strategies just once for a given scope" 


    it "should run strategies for a given scope several times if cache is cleaned" 


    it "should clear the cache for a specified strategy" 


    it "should run the strategies several times for different scopes" 


    it "should not run strategies until cache is cleaned if latest winning strategy halted" 


    it "should not store user if strategy isn't meant for permanent login" 

  end

  describe "set user" do
    it "should store the user into the session" 


    it "should not store the user if the :store option is set to false" 


    it "should not throw error when no session is configured and store is false" 


    it "should not run the callbacks when :run_callbacks is false" 


    it "should run the callbacks when :run_callbacks is true" 


    it "should run the callbacks by default" 

  end

  describe "lock" do
    it "should not run any strategy" 


    it "should keep already authenticated users" 

  end

  describe "get user" do
    before(:each) do
      @env['rack.session'] ||= {}
      @env['rack.session'].delete("warden.user.default.key")
    end

    it "should return nil when not logged in" 


    it "should not run strategies when not logged in" 


    it "should cache unfound user" 


    describe "previously logged in" do
      before(:each) do
        @env['rack.session']['warden.user.default.key'] = "A Previous User"
        @env['warden.spec.strategies'] = []
      end

      it "should take the user from the session when logged in" 


      it "should cache found user" 


      it "should not run strategies when the user exists in the session" 


      describe "run callback option" do
        it "should not call run_callbacks when we pass a :run_callback => false" 


        it "should call run_callbacks when we pass a :run_callback => true" 


        it "should call run_callbacks by default" 

      end
    end
  end

  describe "logout" do
    before(:each) do
      @env['rack.session'] = {"warden.user.default.key" => "default key", "warden.user.foo.key" => "foo key", :foo => "bar"}
      @app = lambda do |e|
        e['warden'].logout(e['warden.spec.which_logout'])
        valid_response
      end
    end

    it "should logout only the scoped foo user" 


    it "should logout only the scoped default user" 


    it "should clear the session when no argument is given to logout" 


    it "should not raise exception if raw_session is nil" 


    it "should clear the user when logging out" 


    it "should clear the session data when logging out" 


    it "should clear out the session by calling reset_session! so that plugins can setup their own session clearing" 

  end

  describe "messages" do
    it "should allow access to the failure message" 


    it "should allow access to the success message" 


    it "should not die when accessing a message from a source where no authentication has occurred" 

  end

  describe "when all strategies are not valid?" do
    it "should return false for authenticated? when there are no valid? strategies" 


    it "should return nil for authenticate when there are no valid strategies" 


    it "should return false for authenticate? when there are no valid strategies" 


    it "should respond with a 401 when authenticate! cannot find any valid strategies" 

  end

  describe "authenticated?" do
    describe "positive authentication" do
      before do
        @env['rack.session'] = {'warden.user.default.key' => 'defult_key'}
        $captures = []
      end

      it "should return true when authenticated in the session" 


      it "should yield to a block when the block is passed and authenticated" 


      it "should authenticate for a user in a different scope" 

    end

    describe "negative authentication" do
      before do
        @env['rack.session'] = {'warden.foo.default.key' => 'foo_key'}
        $captures = []
      end

      it "should return false when authenticated in the session" 


      it "should return false if scope cannot be retrieved from session" 


      it "should not yield to a block when the block is passed and authenticated" 


      it "should not yield for a user in a different scope" 

    end
  end

  describe "unauthenticated?" do
    describe "negative unauthentication" do
      before do
        @env['rack.session'] = {'warden.user.default.key' => 'defult_key'}
        $captures = []
      end

      it "should return false when authenticated in the session" 


      it "should not yield to a block when the block is passed and authenticated" 


      it "should not yield to the block for a user in a different scope" 

    end

    describe "positive unauthentication" do
      before do
        @env['rack.session'] = {'warden.foo.default.key' => 'foo_key'}
        $captures = []
      end

      it "should return false when unauthenticated in the session" 


      it "should yield to a block when the block is passed and authenticated" 


      it "should yield for a user in a different scope" 

    end
  end

  describe "attributes" do
    def def_app(&blk)
      @app = setup_rack(blk)
    end

    it "should have a config attribute" 

  end
end

describe "dynamic default_strategies" do
  before(:all) do
    load_strategies

    class ::DynamicDefaultStrategies
      def initialize(app, &blk)
        @app, @blk = app, blk
      end

      def call(env)
        @blk.call(env)
        @app.call(env)
      end
    end

    Warden::Strategies.add(:one) do
      def authenticate!; $captures << :one; success!("User") end
    end

    Warden::Strategies.add(:two) do
      def authenticate!; $captures << :two; fail("User not found") end
    end
  end

  before(:each) do
    @app = lambda{|e| e['warden'].authenticate! }
    @env = env_with_params("/")
    $captures = []
  end

  def wrap_app(app, &blk)
    builder = Rack::Builder.new do
      use DynamicDefaultStrategies, &blk
      run app
    end
    builder.to_app
  end

  it "should allow me to change the default strategies on the fly" 


  it "should allow me to append to the default strategies on the fly" 


  it "should allow me to set the default strategies on a per scope basis" 


  it "should allow me to setup default strategies for each scope on the manager" 


  it "should not change the master configurations strategies when I change them" 


  describe "default scope options" do

    it "should allow me to set a default action for a given scope" 


    it "should allow me to set store, false on a given scope" 

  end

  describe "#asset_request?" do
    before(:each) do
      @asset_regex = /^\/assets\//
      ::Warden.asset_paths = @asset_regex
    end

    it "should return true if PATH_INFO is in asset list" 


    it "should return false if PATH_INFO is not in asset list" 

  end
end

