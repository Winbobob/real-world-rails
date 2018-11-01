require 'rails_helper'
require_dependency 'stats_socket'

describe StatsSocket do
  let :socket_path do
    "#{Dir.tmpdir}/#{SecureRandom.hex}"
  end

  let :stats_socket do
    StatsSocket.new(socket_path)
  end

  before do
    stats_socket.start
  end

  after do
    stats_socket.stop
  end

  it "can respond to various stats commands" 


end

