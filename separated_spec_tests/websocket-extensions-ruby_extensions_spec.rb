require "spec_helper"

describe WebSocket::Extensions do
  ExtensionError = WebSocket::Extensions::ExtensionError
  Message = Struct.new(:frames)

  before do
    @extensions = WebSocket::Extensions.new

    @ext     = double(:extension, :name => "deflate", :type => "permessage", :rsv1 => true, :rsv2 => false, :rsv3 => false)
    @session = double(:session)
  end

  describe :add do
    it "does not raise on valid extensions" 


    it "raises if ext.name is not a string" 


    it "raises if ext.rsv1 is not a boolean" 


    it "raises if ext.rsv2 is not a boolean" 


    it "raises if ext.rsv3 is not a boolean" 

  end

  describe "client sessions" do
    before do
      @offer = {"mode" => "compress"}
      allow(@ext).to receive(:create_client_session).and_return(@session)
      allow(@session).to receive(:generate_offer).and_return(@offer)
      @extensions.add(@ext)

      @conflict = double(:extension, :name => "tar", :type => "permessage", :rsv1 => true, :rsv2 => false, :rsv3 => false)
      @conflict_session = double(:session)
      allow(@conflict).to receive(:create_client_session).and_return(@conflict_session)
      allow(@conflict_session).to receive(:generate_offer).and_return("gzip" => true)

      @nonconflict = double(:extension, :name => "reverse", :type => "permessage", :rsv1 => false, :rsv2 => true, :rsv3 => false)
      @nonconflict_session = double(:session)
      allow(@nonconflict).to receive(:create_client_session).and_return(@nonconflict_session)
      allow(@nonconflict_session).to receive(:generate_offer).and_return("utf8" => true)

      allow(@session).to receive(:activate).and_return(true)
      allow(@conflict_session).to receive(:activate).and_return(true)
      allow(@nonconflict_session).to receive(:activate).and_return(true)
    end

    describe :generate_offer do
      it "asks the extension to create a client session" 


      it "asks the session to generate an offer" 


      it "does not ask the session to generate an offer if the extension doesn't build a session" 


      it "returns the serialized offer from the session" 


      it "returns a null offer from the session" 


      it "returns multiple serialized offers from the session" 


      it "returns serialized offers from multiple sessions" 


      it "generates offers for potentially conflicting extensions" 

    end

    describe :activate do
      before do
        @extensions.add(@conflict)
        @extensions.add(@nonconflict)
        @extensions.generate_offer
      end

      it "raises if given unregistered extensions" 


      it "does not raise if given registered extensions" 


      it "does not raise if given only one potentially conflicting extension" 


      it "raises if two extensions conflict on RSV bits" 


      it "does not raise if given two non-conflicting extensions" 


      it "activates one session with no params" 


      it "activates one session with a boolean param" 


      it "activates one session with a string param" 


      it "activate multiple sessions" 


      it "does not activate extensions not named in the header" 


      it "raises if session.activate does not return true" 

    end

    describe :process_incoming_message do
      before do
        @extensions.add(@conflict)
        @extensions.add(@nonconflict)
        @extensions.generate_offer

        allow(@session).to receive(:process_incoming_message) do |message|
          message.frames << "deflate"
          message
        end

        allow(@nonconflict_session).to receive(:process_incoming_message) do |message|
          message.frames << "reverse"
          message
        end
      end

      it "processes messages in the reverse order given in the server's response" 


      it "raises if a session yields an error" 


      it "does not call sessions after one has yield an error" 

    end

    describe :process_outgoing_message do
      before do
        @extensions.add(@conflict)
        @extensions.add(@nonconflict)
        @extensions.generate_offer

        allow(@session).to receive(:process_outgoing_message) do |message|
          message.frames << "deflate"
          message
        end

        allow(@nonconflict_session).to receive(:process_outgoing_message) do |message|
          message.frames << "reverse"
          message
        end
      end

      it "processes messages in the order given in the server's response" 


      it "processes messages in the server's order, not the client's order" 


      it "raises if a session yields an error" 


      it "does not call sessions after one has yield an error" 

    end
  end

  describe "server sessions" do
    before do
      @response = {"mode" => "compress"}
      allow(@ext).to receive(:create_server_session).and_return(@session)
      allow(@session).to receive(:generate_response).and_return(@response)

      @conflict = double(:extension, :name => "tar", :type => "permessage", :rsv1 => true, :rsv2 => false, :rsv3 => false)
      @conflict_session = double(:session)
      allow(@conflict).to receive(:create_server_session).and_return(@conflict_session)
      allow(@conflict_session).to receive(:generate_response).and_return("gzip" => true)

      @nonconflict = double(:extension, :name => "reverse", :type => "permessage", :rsv1 => false, :rsv2 => true, :rsv3 => false)
      @nonconflict_session = double(:session)
      allow(@nonconflict).to receive(:create_server_session).and_return(@nonconflict_session)
      allow(@nonconflict_session).to receive(:generate_response).and_return("utf8" => true)

      @extensions.add(@ext)
      @extensions.add(@conflict)
      @extensions.add(@nonconflict)
    end

    describe :generate_response do
      it "asks the extension for a server session with the offer" 


      it "asks the extension for a server session with multiple offers" 


      it "asks the session to generate a response" 


      it "asks multiple sessions to generate a response" 


      it "does not ask the session to generate a response if the extension doesn't build a session" 


      it "does not ask the extension to build a session for unoffered extensions" 


      it "does not ask the extension to build a session for conflicting extensions" 


      it "returns the serialized response from the session" 


      it "returns serialized responses from multiple sessions" 


      it "returns responses in registration orde" 


      it "does not return responses for unoffered extensions" 


      it "does not return responses for conflicting extensions" 


      it "raises an error if the header is invalid" 


      it "returns a response for potentially conflicting extensions if their preceding extensions don't build a session" 

    end
  end
end

