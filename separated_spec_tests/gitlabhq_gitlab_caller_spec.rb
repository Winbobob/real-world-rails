require 'spec_helper'

describe Gitlab::StorageCheck::GitlabCaller do
  let(:options) { Gitlab::StorageCheck::Options.new('unix://tmp/socket.sock', nil, nil, false) }
  subject(:gitlab_caller) { described_class.new(options) }

  describe '#call!' do
    context 'when a socket is given' do
      it 'calls a socket' 

    end

    context 'when a host is given' do
      let(:options) { Gitlab::StorageCheck::Options.new('http://localhost:8080', nil, nil, false) }

      it 'it calls a http response' 

    end
  end

  describe '#headers' do
    it 'Adds the JSON header' 


    context 'when a token was provided' do
      let(:options) { Gitlab::StorageCheck::Options.new('unix://tmp/socket.sock', 'atoken', nil, false) }

      it 'adds it to the headers' 

    end
  end
end

