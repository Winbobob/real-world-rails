require 'spec_helper'

describe Excon do
  context "when dispatching requests" do
    context('to a server that does not supply response headers') do
      include_context("test server", :exec, 'bad.rb', :before => :start, :after => :stop )
      before(:all) do
        @conn = Excon.new('http://127.0.0.1:9292')
      end

      context('when no block is given') do
        it 'should rescue from an EOFError and return response' 

      end

      context('when a block is given') do
        it 'should rescue from EOFError and return response' 

      end
    end

    context('to a server that prematurely aborts the request with no response') do
      include_context("test server", :exec, 'eof.rb', :before => :start, :after => :stop )

      it 'should raise an EOFError' 

    end
  end
end

