require 'spec_helper'

describe Gitlab::TcpChecker do
  before do
    @server = TCPServer.new('localhost', 0)
    _, @port, _, @ip = @server.addr
  end

  after do
    @server.close
  end

  subject(:checker) { described_class.new(@ip, @port) }

  describe '#check' do
    subject { checker.check }

    it 'can connect to an open port' 


    it 'fails to connect to a closed port' 

  end
end

