# frozen_string_literal: true

require "spec_helper"

RSpec.describe "NIO acceptables" do
  shared_context "an NIO acceptable" do
    let(:selector) { NIO::Selector.new }

    it "selects for read readiness" 

  end

  describe TCPServer do
    let(:port) { next_available_tcp_port }

    let :acceptable_subject do
      server = TCPServer.new("127.0.0.1", port)
      TCPSocket.open("127.0.0.1", port)
      server
    end

    let :unacceptable_subject do
      TCPServer.new("127.0.0.1", port + 1)
    end

    it_behaves_like "an NIO acceptable"
  end
end

