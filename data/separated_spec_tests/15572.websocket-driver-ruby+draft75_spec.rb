# encoding=utf-8

require "spec_helper"

describe WebSocket::Driver::Draft75 do
  include EncodingHelper

  let :env do
    {
      "REQUEST_METHOD"  => "GET",
      "HTTP_CONNECTION" => "Upgrade",
      "HTTP_UPGRADE"    => "WebSocket",
      "HTTP_ORIGIN"     => "http://www.example.com"
    }
  end

  let :socket do
    socket = double(WebSocket)
    allow(socket).to receive(:env).and_return(env)
    allow(socket).to receive(:url).and_return("ws://www.example.com/socket")
    allow(socket).to receive(:write) { |message| @bytes = bytes(message) }
    socket
  end

  let :driver do
    driver = WebSocket::Driver::Draft75.new(socket)
    driver.on(:open)    { |e| @open = true }
    driver.on(:message) { |e| @message += e.data }
    driver.on(:close)   { |e| @close = true }
    driver
  end

  before do
    @open = @close = false
    @message = ""
  end

  describe "in the :connecting state" do
    it "starts in the :connecting state" 


    describe :start do
      it "writes the handshake response to the socket" 


      it "returns true" 


      it "triggers the onopen event" 


      it "changes the state to :open" 


      it "sets the protocol version" 

    end

    describe :frame do
      it "does not write to the socket" 


      it "returns true" 


      it "queues the frames until the handshake has been sent" 

    end
  end

  it_should_behave_like "draft-75 protocol"
end

