require 'spec_helper'

describe AsynchronousHttpRequester do

  subject { AsynchronousHttpRequester.new }

  let(:connection) { double(:connection) }

  before do
    allow(EM::HttpRequest).to receive(:new).and_return(connection)
    allow(connection).to receive(:get)
  end

  describe '#initiate_request' do
    it 'should make a GET request with the options merged into the header' 


    it 'should specify timeouts' 


    it 'should prepend http:// if the url has no protocol' 


    describe 'when the url is invalid' do
      before do
        allow(connection).to receive(:get).and_raise(Addressable::URI::InvalidURIError)
      end

      it 'should return nil' 


      it 'should log an error' 

    end
  end
end

