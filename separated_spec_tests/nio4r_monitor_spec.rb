# frozen_string_literal: true

require "spec_helper"
require "socket"

RSpec.describe NIO::Monitor do
  let(:addr) { "127.0.0.1" }
  let(:port) { next_available_tcp_port }

  let(:reader) { TCPServer.new(addr, port) }
  let(:writer) { TCPSocket.new(addr, port) }

  let(:selector) { NIO::Selector.new }

  subject(:monitor) { selector.register(writer, :rw) }
  subject(:peer)    { selector.register(reader, :r) }

  before { reader }
  before { writer }
  after  { reader.close }
  after  { writer.close }
  after  { selector.close }

  describe "#interests" do
    it "knows its interests" 

  end

  describe "#interests=" do
    it "can set interests to nil" 


    it "changes the interest set" 


    it "raises EOFError if interests are changed after the monitor is closed" 

  end

  describe "#add_interest" do
    it "sets a new interest if it isn't currently registered" 


    it "acts idempotently" 


    it "raises ArgumentError if given a bogus option" 

  end

  describe "#remove_interest" do
    it "removes an interest from the set" 


    it "can clear the last interest" 


    it "acts idempotently" 


    it "raises ArgumentError if given a bogus option" 

  end

  describe "#io" do
    it "knows its IO object" 

  end

  describe "#selector" do
    it "knows its selector" 

  end

  describe "#value=" do
    it "stores arbitrary values" 

  end

  describe "#readiness" do
    it "knows what operations IO objects are ready for" 

  end

  describe "#close" do
    it "closes" 


    it "closes even if the selector has been shutdown" 

  end
end

