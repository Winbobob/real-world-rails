# frozen_string_literal: true

require "spec_helper"

RSpec.describe NIO::ByteBuffer do
  let(:capacity)       { 256 }
  let(:example_string) { "Testing 1 2 3..." }
  subject(:bytebuffer) { described_class.new(capacity) }

  describe "#initialize" do
    it "raises TypeError if given a bogus argument" 

  end

  describe "#clear" do
    it "clears the buffer" 

  end

  describe "#position" do
    it "defaults to zero" 

  end

  describe "#position=" do
    let(:example_position) { 42 }

    it "sets the buffer's position to a valid value" 


    it "raises ArgumentError if the specified position is less than zero" 


    it "raises ArgumentError if the specified position exceeds the limit" 

  end

  describe "#limit" do
    it "defaults to the buffer's capacity" 

  end

  describe "#limit=" do
    it "sets the buffer's limit to a valid value" 


    it "preserves position and mark if they're less than the new limit" 


    it "sets position to the new limit if the previous position is beyond the limit" 


    it "clears the mark if the new limit is before the current mark" 


    it "raises ArgumentError if specified limit is less than zero" 


    it "raises ArgumentError if specified limit exceeds capacity" 

  end

  describe "#capacity" do
    it "has the requested capacity" 

  end

  describe "#remaining" do
    it "calculates the number of bytes remaining" 

  end

  describe "#full?" do
    it "returns false when there is space remaining in the buffer" 


    it "returns true when the buffer is full" 

  end

  describe "#get" do
    it "reads all remaining data if no length is given" 


    it "reads zeroes from a newly initialized buffer" 


    it "advances position as data is read" 


    it "raises NIO::ByteBuffer::UnderflowError if there is not enough data in the buffer" 

  end

  describe "#[]" do
    it "obtains bytes at a given index without altering position" 


    it "raises ArgumentError if the index is less than zero" 


    it "raises ArgumentError if the index exceeds the limit" 

  end

  describe "#<<" do
    it "adds strings to the buffer" 


    it "raises NIO::ByteBuffer::OverflowError if the buffer is full" 

  end

  describe "#flip" do
    it "flips the bytebuffer" 


    it "sets remaining to the previous position" 


    it "sets limit to the previous position" 

  end

  describe "#rewind" do
    it "rewinds the buffer leaving the limit intact" 

  end

  describe "#mark" do
    it "returns self" 

  end

  describe "#reset" do
    it "returns to a previously marked position" 


    it "raises NIO::ByteBuffer::MarkUnsetError unless mark has been set" 

  end

  describe "#compact" do
    let(:first_string)  { "CompactMe" }
    let(:second_string) { "Leftover" }

    it "copies data from the current position to the beginning of the buffer" 

  end

  describe "#each" do
    it "iterates over data in the buffer" 

  end

  describe "#inspect" do
    it "inspects the buffer offsets" 

  end

  context "I/O" do
    let(:addr)   { "localhost" }
    let(:port)   { next_available_tcp_port }
    let(:server) { TCPServer.new(addr, port) }
    let(:client) { TCPSocket.new(addr, port) }
    let(:peer)   { server_thread.value }

    let(:server_thread) do
      server

      thread = Thread.new { server.accept }
      Thread.pass while thread.status && thread.status != "sleep"

      thread
    end

    before do
      server_thread
      client
    end

    after do
      server_thread.kill if server_thread.alive?

      server.close rescue nil
      client.close rescue nil
      peer.close rescue nil
    end

    describe "#read_from" do
      it "reads data into the buffer" 


      it "raises NIO::ByteBuffer::OverflowError if the buffer is already full" 


      it "returns 0 if no data is available" 

    end

    describe "#write_to" do
      it "writes data from the buffer" 


      it "raises NIO::ByteBuffer::UnderflowError if the buffer is out of data" 

    end
  end
end

