# frozen_string_literal: true

require "bundler/mirror"

RSpec.describe Bundler::Settings::Mirror do
  let(:mirror) { Bundler::Settings::Mirror.new }

  it "returns zero when fallback_timeout is not set" 


  it "takes a number as a fallback_timeout" 


  it "takes truthy as a default fallback timeout" 


  it "takes falsey as a zero fallback timeout" 


  it "takes a string with 'true' as a default fallback timeout" 


  it "takes a string with 'false' as a zero fallback timeout" 


  it "takes a string for the uri but returns an uri object" 


  it "takes an uri object for the uri" 


  context "without a uri" do
    it "invalidates the mirror" 

  end

  context "with an uri" do
    before { mirror.uri = "http://localhost:9292" }

    context "without a fallback timeout" do
      it "is not valid by default" 


      context "when probed" do
        let(:probe) { double }

        context "with a replying mirror" do
          before do
            allow(probe).to receive(:replies?).and_return(true)
            mirror.validate!(probe)
          end

          it "is valid" 

        end

        context "with a non replying mirror" do
          before do
            allow(probe).to receive(:replies?).and_return(false)
            mirror.validate!(probe)
          end

          it "is still valid" 

        end
      end
    end

    context "with a fallback timeout" do
      before { mirror.fallback_timeout = 1 }

      it "is not valid by default" 


      context "when probed" do
        let(:probe) { double }

        context "with a replying mirror" do
          before do
            allow(probe).to receive(:replies?).and_return(true)
            mirror.validate!(probe)
          end

          it "is valid" 


          it "is validated only once" 

        end

        context "with a non replying mirror" do
          before do
            allow(probe).to receive(:replies?).and_return(false)
            mirror.validate!(probe)
          end

          it "is not valid" 


          it "is validated only once" 

        end
      end
    end

    describe "#==" do
      it "returns true if uri and fallback timeout are the same" 

    end
  end
end

RSpec.describe Bundler::Settings::Mirrors do
  let(:localhost_uri) { URI("http://localhost:9292") }

  context "with a just created mirror" do
    let(:mirrors) do
      probe = double
      allow(probe).to receive(:replies?).and_return(true)
      Bundler::Settings::Mirrors.new(probe)
    end

    it "returns a mirror that contains the source uri for an unknown uri" 


    it "parses a mirror key and returns a mirror for the parsed uri" 


    it "parses a relative mirror key and returns a mirror for the parsed http uri" 


    it "parses a relative mirror key and returns a mirror for the parsed https uri" 


    context "with a uri parsed already" do
      before { mirrors.parse("mirror.http://rubygems.org/", localhost_uri) }

      it "takes a mirror fallback_timeout and assigns the timeout" 


      it "parses a 'true' fallback timeout and sets the default timeout" 


      it "parses a 'false' fallback timeout and sets it to zero" 

    end
  end

  context "with a mirror prober that replies on time" do
    let(:mirrors) do
      probe = double
      allow(probe).to receive(:replies?).and_return(true)
      Bundler::Settings::Mirrors.new(probe)
    end

    context "with a default fallback_timeout for rubygems.org" do
      before do
        mirrors.parse("mirror.http://rubygems.org/", localhost_uri)
        mirrors.parse("mirror.http://rubygems.org.fallback_timeout", "true")
      end

      it "returns localhost" 

    end

    context "with a mirror for all" do
      before do
        mirrors.parse("mirror.all", localhost_uri)
      end

      context "without a fallback timeout" do
        it "returns localhost uri for rubygems" 


        it "returns localhost for any other url" 

      end
      context "with a fallback timeout" do
        before { mirrors.parse("mirror.all.fallback_timeout", "1") }

        it "returns localhost uri for rubygems" 


        it "returns localhost for any other url" 

      end
    end
  end

  context "with a mirror prober that does not reply on time" do
    let(:mirrors) do
      probe = double
      allow(probe).to receive(:replies?).and_return(false)
      Bundler::Settings::Mirrors.new(probe)
    end

    context "with a localhost mirror for all" do
      before { mirrors.parse("mirror.all", localhost_uri) }

      context "without a fallback timeout" do
        it "returns localhost" 

      end

      context "with a fallback timeout" do
        before { mirrors.parse("mirror.all.fallback_timeout", "true") }

        it "returns the source uri, not localhost" 

      end
    end

    context "with localhost as a mirror for rubygems.org" do
      before { mirrors.parse("mirror.http://rubygems.org/", localhost_uri) }

      context "without a fallback timeout" do
        it "returns the uri that is not mirrored" 


        it "returns localhost for rubygems.org" 

      end

      context "with a fallback timeout" do
        before { mirrors.parse("mirror.http://rubygems.org/.fallback_timeout", "true") }

        it "returns the uri that is not mirrored" 


        it "returns rubygems.org for rubygems.org" 

      end
    end
  end
end

RSpec.describe Bundler::Settings::TCPSocketProbe do
  let(:probe) { Bundler::Settings::TCPSocketProbe.new }

  context "with a listening TCP Server" do
    def with_server_and_mirror
      server = TCPServer.new("127.0.0.1", 0)
      mirror = Bundler::Settings::Mirror.new("http://localhost:#{server.addr[1]}", 1)
      yield server, mirror
      server.close unless server.closed?
    end

    it "probes the server correctly" 


    it "probes falsey when the server is down" 

  end

  context "with an invalid mirror" do
    let(:mirror) { Bundler::Settings::Mirror.new("http://127.0.0.127:9292", true) }

    it "fails with a timeout when there is nothing to tcp handshake" 

  end
end

