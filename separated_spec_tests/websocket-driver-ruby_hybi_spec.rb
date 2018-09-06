# encoding=utf-8

require "spec_helper"

describe WebSocket::Driver::Hybi do
  include EncodingHelper

  let :env do
    {
      "REQUEST_METHOD"                => "GET",
      "HTTP_CONNECTION"               => "Upgrade",
      "HTTP_UPGRADE"                  => "websocket",
      "HTTP_ORIGIN"                   => "http://www.example.com",
#      "HTTP_SEC_WEBSOCKET_EXTENSIONS" => "x-webkit-deflate-frame",
      "HTTP_SEC_WEBSOCKET_KEY"        => "JFBCWHksyIpXV+6Wlq/9pw==",
      "HTTP_SEC_WEBSOCKET_VERSION"    => "13"
    }
  end

  let :options do
    {:masking => false}
  end

  let :socket do
    socket = double(WebSocket)
    allow(socket).to receive(:env).and_return(env)
    allow(socket).to receive(:write) { |message| @bytes = bytes(message) }
    socket
  end

  let :driver do
    driver = WebSocket::Driver::Hybi.new(socket, options)
    driver.on :open, -> e { @open = true }
    driver.on(:message) { |e| @message += e.data }
    driver.on(:error)   { |e| @error = e }
    driver.on(:close)   { |e| @close = [e.code, e.reason] }
    driver
  end

  before do
    @open = @error = @close = false
    @message = ""
  end

  describe "in the :connecting state" do
    it "starts in the :connecting state" 


    describe :start do
      it "writes the handshake response to the socket" 


      it "returns true" 


      describe "with subprotocols" do
        before do
          env["HTTP_SEC_WEBSOCKET_PROTOCOL"] = "foo, bar, xmpp"
          options[:protocols] = ["xmpp"]
        end

        it "writes the handshake with Sec-WebSocket-Protocol" 


        it "sets the subprotocol" 

      end

      describe "with invalid extensions" do
        before do
          env["HTTP_SEC_WEBSOCKET_EXTENSIONS"] = "x-webkit- -frame"
        end

        it "writes a handshake error response" 


        it "does not trigger the onopen event" 


        it "triggers the onerror event" 


        it "triggers the onclose event" 


        it "changes the state to :closed" 

      end

      describe "with custom headers" do
        before do
          driver.set_header "Authorization", "Bearer WAT"
        end

        it "writes the handshake with the custom headers" 

      end

      it "triggers the onopen event" 


      it "changes the state to :open" 


      it "sets the protocol version" 

    end

    describe :frame do
      it "does not write to the socket" 


      it "returns true" 


      it "queues the frames until the handshake has been sent" 

    end

    describe :ping do
      it "does not write to the socket" 


      it "returns true" 


      it "queues the ping until the handshake has been sent" 

    end

    describe :pong do
      it "does not write to the socket" 


      it "returns true" 


      it "queues the pong until the handshake has been sent" 

    end

    describe :close do
      it "does not write anything to the socket" 


      it "returns true" 


      it "triggers the onclose event" 


      it "changes the state to :closed" 

    end
  end

  describe "in the :open state" do
    before { driver.start }

    describe :parse do
      let(:mask) { (1..4).map { rand 255 } }

      def mask_message(*bytes)
        output = []
        bytes.each_with_index do |byte, i|
          output[i] = byte ^ mask[i % 4]
        end
        output
      end

      it "parses unmasked text frames" 


      it "parses multiple frames from the same packet" 


      it "parses empty text frames" 


      it "parses fragmented text frames" 


      it "parses masked text frames" 


      it "parses masked empty text frames" 


      it "parses masked fragmented text frames" 


      it "closes the socket if the frame has an unrecognized opcode" 


      it "closes the socket if a close frame is received" 


      it "parses unmasked multibyte text frames" 


      it "parses frames received in several packets" 


      it "parses fragmented multibyte text frames" 


      it "parses masked multibyte text frames" 


      it "parses masked fragmented multibyte text frames" 


      it "parses unmasked medium-length text frames" 


      it "returns an error for too-large frames" 


      it "parses masked medium-length text frames" 


      it "replies to pings with a pong" 


      it "triggers the onping event when a ping arrives" 


      describe "when a message listener raises an error" do
        before do
          @messages = []

          driver.on :message do |msg|
            @messages << msg.data
            raise "an error"
          end
        end

        it "is not trapped by the parser" 


        it "parses unmasked text frames without dropping input" 

      end
    end

    describe :frame do
      it "formats the given string as a WebSocket frame" 


      it "formats a byte array as a binary WebSocket frame" 


      it "encodes multibyte characters correctly" 


      it "encodes medium-length strings using extra length bytes" 


      it "encodes close frames with an error code" 


      it "encodes pong frames" 

    end

    describe :ping do
      before do
        @reply = nil
      end

      it "writes a ping frame to the socket" 


      it "returns true" 


      it "runs the given callback on matching pong" 


      it "triggers the onpong event when a pong arrives" 



      it "does not run the callback on non-matching pong" 

    end

    describe :pong do
      it "writes a pong frame to the socket" 


      it "returns true" 

    end

    describe :close do
      it "writes a close frame to the socket" 


      it "returns true" 


      it "does not trigger the onclose event" 


      it "does not trigger the onerror event" 


      it "changes the state to :closing" 

    end
  end

  describe "when masking is required" do
    before do
      options[:require_masking] = true
      driver.start
    end

    it "does not emit a message" 


    it "returns an error" 

  end

  describe "in the :closing state" do
    before do
      driver.start
      driver.close
    end

    describe :frame do
      it "does not write to the socket" 


      it "returns false" 

    end

    describe :ping do
      it "does not write to the socket" 


      it "returns false" 

    end

    describe :pong do
      it "does not write to the socket" 


      it "returns false" 

    end

    describe :close do
      it "does not write to the socket" 


      it "returns false" 

    end

    describe "receiving a close frame" do
      before do
        driver.parse [0x88, 0x04, 0x03, 0xe9, 0x4f, 0x4b].pack("C*")
      end

      it "triggers the onclose event" 


      it "changes the state to :closed" 


      it "does not write another close frame" 

    end

    describe "receiving a close frame with a too-short payload" do
      before do
        driver.parse [0x88, 0x01, 0x03].pack("C*")
      end

      it "triggers the onclose event with a protocol error" 


      it "changes the state to :closed" 

    end

    describe "receiving a close frame with no code" do
      before do
        driver.parse [0x88, 0x00].pack("C*")
      end

      it "triggers the onclose event with code 1000" 


      it "changes the state to :closed" 

    end
  end

  describe "in the :closed state" do
    before do
      driver.start
      driver.close
      driver.parse [0x88, 0x02, 0x03, 0xea].pack("C*")
    end

    describe :frame do
      it "does not write to the socket" 


      it "returns false" 

    end

    describe :ping do
      it "does not write to the socket" 


      it "returns false" 

    end

    describe :pong do
      it "does not write to the socket" 


      it "returns false" 

    end

    describe :close do
      it "does not write to the socket" 


      it "returns false" 


      it "leaves the state as :closed" 

    end
  end
end

