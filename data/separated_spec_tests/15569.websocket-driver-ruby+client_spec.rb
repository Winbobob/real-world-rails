require "spec_helper"

describe WebSocket::Driver::Client do
  include EncodingHelper

  let :socket do
    socket = double(WebSocket)
    allow(socket).to receive(:write) { |message| @bytes = bytes(message) }
    allow(socket).to receive(:url).and_return(url)
    socket
  end

  let :options do
    {:protocols => protocols}
  end

  let :protocols do
    nil
  end

  let :url do
    "ws://www.example.com/socket"
  end

  let :driver do
    driver = WebSocket::Driver::Client.new(socket, options)
    driver.on(:open)    { |e| @open = true }
    driver.on(:message) { |e| @message += e.data }
    driver.on(:error)   { |e| @error = e }
    driver.on(:close)   { |e| @close = [e.code, e.reason] }
    driver
  end

  let :key do
    "2vBVWg4Qyk3ZoM/5d3QD9Q=="
  end

  let :response do
    "HTTP/1.1 101 Switching Protocols\r\n" +
    "Upgrade: websocket\r\n" +
    "Connection: Upgrade\r\n" +
    "Sec-WebSocket-Accept: QV3I5XUXU2CdhtjixE7QCkCcMZM=\r\n" +
    "\r\n"
  end

  before do
    allow(WebSocket::Driver::Client).to receive(:generate_key).and_return(key)
    @open = @error = @close = false
    @message = ""
  end

  describe "in the beginning state" do
    it "starts in no state" 


    describe :close do
      it "changes the state to :closed" 

    end

    describe :start do
      it "writes the handshake request to the socket" 


      it "returns true" 


      describe "with subprotocols" do
        let(:protocols) { ["foo", "bar", "xmpp"] }

        it "writes the handshake with Sec-WebSocket-Protocol" 

      end

      describe "with basic auth" do
        let(:url) { "ws://user:pass@www.example.com/socket" }

        it "writes the handshake with Sec-WebSocket-Protocol" 

      end

      describe "with an invalid URL" do
        let(:url) { "stream.wikimedia.org/rc" }

        it "throws an URIError error" 

      end

      describe "with custom headers" do
        before do
          driver.set_header "User-Agent", "Chrome"
        end

        it "writes the handshake with custom headers" 

      end

      it "changes the state to :connecting" 

    end
  end

  describe "using a proxy" do
    it "sends a CONNECT request" 


    it "sends an authenticated CONNECT request" 


    it "sends a CONNECT request with custom headers" 


    describe "receiving a response" do
      let(:proxy) { driver.proxy("http://proxy.example.com") }

      before do
        @connect = nil
        proxy.on(:connect) { @connect = true }
        proxy.on(:error)   { |e| @error = e }
      end

      it "emits a 'connect' event when the proxy connects" 


      it "emits an 'error' event if the proxy does not connect" 

    end
  end

  describe "in the :connecting state" do
    before { driver.start }

    describe "with a valid response" do
      before { driver.parse(response) }

      it "changes the state to :open" 


      it "makes the response status available" 


      it "makes the response headers available" 

    end

    describe "with a valid response followed by a frame" do
      before do
        resp = response + WebSocket::Driver.encode([0x81, 0x02, 72, 105])
        driver.parse(resp)
      end

      it "changes the state to :open" 


      it "parses the frame" 

    end

    describe "with a bad status code" do
      before do
        resp = response.gsub(/101/, "4")
        driver.parse(resp)
      end

      it "changes the state to :closed" 

    end

    describe "with a bad Upgrade header" do
      before do
        resp = response.gsub(/websocket/, "wrong")
        driver.parse(resp)
      end

      it "changes the state to :closed" 

    end
 
    describe "with a bad Accept header" do
      before do
        resp = response.gsub(/QV3/, "wrong")
        driver.parse(resp)
      end

      it "changes the state to :closed" 

    end

    describe "with valid subprotocols" do
      let(:protocols) { ["foo", "xmpp"] }

      before do
        resp = response.gsub(/\r\n\r\n/, "\r\nSec-WebSocket-Protocol: xmpp\r\n\r\n")
        driver.parse(resp)
      end

      it "changes the state to :open" 


      it "selects the subprotocol" 

    end

    describe "with invalid subprotocols" do
      let(:protocols) { ["foo", "xmpp"] }

      before do
        resp = response.gsub(/\r\n\r\n/, "\r\nSec-WebSocket-Protocol: irc\r\n\r\n")
        driver.parse(resp)
      end

      it "changes the state to :closed" 


      it "selects no subprotocol" 

    end
  end
end

