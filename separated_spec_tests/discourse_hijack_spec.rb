require 'rails_helper'

describe Hijack do
  class Hijack::Tester < ApplicationController
    attr_reader :io

    include Hijack

    def initialize(env = {})
      @io = StringIO.new

      env.merge!(
        "rack.hijack" => lambda { @io },
        "rack.input" => StringIO.new
      )

      self.request = ActionController::TestRequest.new(env, nil, nil)

      # we need this for the 418
      self.response = ActionDispatch::Response.new
    end

    def hijack_test(&blk)
      hijack(&blk)
    end

  end

  let :tester do
    Hijack::Tester.new
  end

  context "Request Tracker integration" do
    let :logger do
      lambda do |env, data|
        @calls += 1
        @status = data[:status]
        @total = data[:timing][:total_duration]
      end
    end

    before do
      Middleware::RequestTracker.register_detailed_request_logger logger
      @calls = 0
    end

    after do
      Middleware::RequestTracker.unregister_detailed_request_logger logger
    end

    it "can properly track execution" 

  end

  it "dupes the request params and env" 


  it "handles cors" 


  it "handles transfers headers" 


  it "handles expires_in" 


  it "renders non 200 status if asked for" 


  it "handles send_file correctly" 


  it "renders a redirect correctly" 


  it "renders stuff correctly if is empty" 


  it "renders stuff correctly if it works" 


  it "returns 500 by default" 


  it "does not run the block if io is closed" 

end

