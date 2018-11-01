require 'rails_helper'

describe WebRequestsController do
  class Agents::WebRequestReceiverAgent < Agent
    cannot_receive_events!
    cannot_be_scheduled!

    def receive_web_request(params, method, format)
      if params.delete(:secret) == options[:secret]
        memory[:web_request_values] = params
        memory[:web_request_format] = format
        memory[:web_request_method] = method
        ["success", (options[:status] || 200).to_i, memory['content_type'], memory['response_headers']]
      else
        ["failure", 404]
      end
    end
  end

  before do
    stub(Agents::WebRequestReceiverAgent).valid_type?("Agents::WebRequestReceiverAgent") { true }
    @agent = Agents::WebRequestReceiverAgent.new(:name => "something", :options => { :secret => "my_secret" })
    @agent.user = users(:bob)
    @agent.save!
  end

  it "should not require login to receive a web request" 


  it "should call receive_web_request" 


  it "should accept gets" 


  it "should pass through the received format" 


  it "can accept a content-type to return" 


  it "can accept custom response headers to return" 


  it "can accept multiple custom response headers to return" 


  it 'should redirect correctly' 


  it "should fail on incorrect users" 


  it "should fail on incorrect agents" 


  describe "legacy update_location endpoint" do
    before do
      @agent = Agent.build_for_type("Agents::UserLocationAgent", users(:bob), name: "something", options: { secret: "my_secret" })
      @agent.save!
    end

    it "should create events without requiring login" 


    it "should only consider Agents::UserLocationAgents for the given user" 


    it "should raise a 404 error when given an invalid user id" 


    it "should only look at agents with the given secret" 

  end
end

