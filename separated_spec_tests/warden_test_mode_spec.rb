# encoding: utf-8
# frozen_string_literal: true
RSpec.describe Warden::Test::WardenHelpers do
  before :all do
    Warden.test_mode!
  end

  before do
    $captures = []
    @app = lambda{|_e| valid_response }
  end

  after do
    Warden.test_reset!
  end

  it{ expect(Warden).to respond_to(:test_mode!) }
  it{ expect(Warden).to respond_to(:on_next_request) }
  it{ expect(Warden).to respond_to(:test_reset!) }

  it "should execute the on_next_request block on the next request" 


  it "should execute many on_next_request blocks on the next request" 


  it "should not execute on_next_request blocks on subsequent requests" 


  it "should allow me to set new_on_next_request items to execute in the same test" 


  it "should remove the on_next_request items when test is reset" 


  context "asset requests" do
    it "should not execute on_next_request blocks if this is an asset request" 

  end
end

