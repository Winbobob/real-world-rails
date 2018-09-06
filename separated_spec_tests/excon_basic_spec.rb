require 'spec_helper'

describe Excon::Connection do
  include_context('test server', :webrick, 'basic.ru', before: :start, after: :stop)
  context 'when an explicit uri is passed' do
    let(:conn) do
      Excon::Connection.new(host: '127.0.0.1',
                                           hostname: '127.0.0.1',
                                           nonblock: false,
                                           port: 9292,
                                           scheme: 'http',
                                           ssl_verify_peer: false)
    end

    describe '.new' do
      it 'returns an instance' 

    end

    context "when :method is :get and :path is /content-length/100" do
      describe "#request" do
        let(:response) do
          response = conn.request(method: :get, path: '/content-length/100')
        end
        it 'returns an Excon::Response' 

        describe Excon::Response do
          describe '#status' do
            it 'returns 200' 

          end
        end
      end
    end
    include_examples 'a basic client'
  end
end

