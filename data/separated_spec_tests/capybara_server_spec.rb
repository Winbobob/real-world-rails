# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Capybara::Server do
  it "should spool up a rack server" 


  it "should do nothing when no server given" 


  it "should bind to the specified host" 


  it "should use specified port" 


  it "should use given port" 


  it "should find an available port" 


  it "should support SSL" 


  context "When Capybara.reuse_server is true" do
    before do
      @old_reuse_server = Capybara.reuse_server
      Capybara.reuse_server = true
    end

    after do
      Capybara.reuse_server = @old_reuse_server
    end

    it "should use the existing server if it already running" 


    it "detects and waits for all reused server sessions pending requests" 

  end

  context "When Capybara.reuse_server is false" do
    before do
      @old_reuse_server = Capybara.reuse_server
      Capybara.reuse_server = false
    end

    after do
      Capybara.reuse_server = @old_reuse_server
    end

    it "should not reuse an already running server" 


    it "detects and waits for only one sessions pending requests" 

  end

  it "should raise server errors when the server errors before the timeout" 


  it "is not #responsive? when Net::HTTP raises a SystemCallError" 


  [EOFError, Net::ReadTimeout].each do |err|
    it "should attempt an HTTPS connection if HTTP connection returns #{err}" 

  end

  def start_request(server, wait_time)
    # Start request, but don't wait for it to finish
    socket = TCPSocket.new(server.host, server.port)
    socket.write "GET /?wait_time=#{wait_time} HTTP/1.0\r\n\r\n"
    sleep 0.1
    socket.close
    sleep 0.1
  end
end

