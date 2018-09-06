# encoding: utf-8
require 'spec_helper'

describe WebMock::RackResponse do
  before :each do
    @rack_response = WebMock::RackResponse.new(MyRackApp)
  end

  it "should hook up to a rack appliance" 


  it "should set the reason phrase based on the status code" 


  it "should behave correctly when the rack response is not a simple array of strings" 


  it "should shouldn't blow up when hitting a locked resource twice" 


  it "should send along params" 


  it "should send along POST params" 


  it "should send params with proper content length if params have non-ascii symbols" 


  describe 'rack error output' do
    before :each do
      @original_stderr = $stderr
      $stderr = StringIO.new
    end

    after :each do
      $stderr = @original_stderr
    end

    it 'should behave correctly when an app uses rack.errors' 

  end

  describe 'basic auth request' do
    before :each do
      @rack_response_with_basic_auth = WebMock::RackResponse.new(
        Rack::Auth::Basic.new(MyRackApp) do |username, password|
          username == 'username' && password == 'password'
        end
      )
    end
    it 'should be failure when wrong credentials' 


    it 'should be success when valid credentials' 

  end
end

