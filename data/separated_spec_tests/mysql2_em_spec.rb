require 'spec_helper'
begin
  require 'eventmachine'
  require 'mysql2/em'

  RSpec.describe Mysql2::EM::Client do
    it "should support async queries" 


    it "should support queries in callbacks" 


    it "should not swallow exceptions raised in callbacks" 


    context 'when an exception is raised by the client' do
      let(:client) { Mysql2::EM::Client.new DatabaseCredentials['root'] }
      let(:error) { StandardError.new('some error') }
      before { allow(client).to receive(:async_result).and_raise(error) }
      after { client.close }

      it "should swallow exceptions raised in by the client" 


      it "should fail the deferrable" 

    end

    it "should not raise error when closing client with no query running" 

  end
rescue LoadError
  puts "EventMachine not installed, skipping the specs that use it"
end

