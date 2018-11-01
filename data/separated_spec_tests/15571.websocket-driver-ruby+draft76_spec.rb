# encoding=utf-8

require "spec_helper"

describe WebSocket::Driver::Draft76 do
  include EncodingHelper

  let :body do
    WebSocket::Driver.encode [0x91, 0x25, 0x3e, 0xd3, 0xa9, 0xe7, 0x6a, 0x88]
  end

  let :response do
    string = "\xB4\x9Cn@S\x04\x04&\xE5\e\xBFl\xB7\x9F\x1D\xF9"
    string.force_encoding("ASCII-8BIT") if string.respond_to?(:force_encoding)
    string
  end

  let :env do
    {
      "REQUEST_METHOD"          => "GET",
      "HTTP_CONNECTION"         => "Upgrade",
      "HTTP_UPGRADE"            => "WebSocket",
      "HTTP_ORIGIN"             => "http://www.example.com",
      "HTTP_SEC_WEBSOCKET_KEY1" => "1   38 wZ3f9 23O0 3l 0r",
      "HTTP_SEC_WEBSOCKET_KEY2" => "27   0E 6 2  1665:< ;U 1H",
      "rack.input"              => StringIO.new(body)
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
    driver = WebSocket::Driver::Draft76.new(socket)
    driver.on(:open)    { |e| @open = true }
    driver.on(:message) { |e| @message += e.data }
    driver.on(:error)   { |e| @error = e }
    driver.on(:close)   { |e| @close = true }
    driver
  end

  before do
    @open = @close = false
    @message = ""
  end

  describe "in the :connecting state" do
    it "starts in the connecting state" 


    describe :start do
      it "writes the handshake response to the socket" 


      it "returns true" 


      it "triggers the onopen event" 


      it "changes the state to :open" 


      it "sets the protocol version" 


      describe "with an invalid key header" do
        before do
          env["HTTP_SEC_WEBSOCKET_KEY1"] = "2 L785 8o% s9Sy9@V. 4<1P5"
        end

        it "writes a handshake error response" 


        it "does not trigger the onopen event" 


        it "triggers the onerror event" 


        it "triggers the onclose event" 


        it "changes the state to closed" 

      end
    end

    describe :frame do
      it "does not write to the socket" 


      it "returns true" 


      it "queues the frames until the handshake has been sent" 

    end

    describe "with no request body" do
      before { env.delete("rack.input") }

      describe :start do
        it "writes the handshake response with no body" 


        it "does not trigger the onopen event" 


        it "leaves the protocol in the :connecting state" 


        describe "when the request body is received" do
          before { driver.start }

          it "sends the response body" 


          it "triggers the onopen event" 


          it "changes the state to :open" 


          it "sends any frames queued before the handshake was complete" 

        end
      end
    end
  end

  it_should_behave_like "draft-75 protocol"

  describe "in the :open state" do
    before { driver.start }

    describe :parse do
      it "closes the socket if a close frame is received" 

    end

    describe :close do
      it "writes a close message to the socket" 

    end
  end
end

