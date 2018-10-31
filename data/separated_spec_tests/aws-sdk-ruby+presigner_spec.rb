require_relative './spec_helper'

module Aws
  module Polly
    describe Presigner do

      before(:each) do
        allow(Time).to receive(:now).and_return(now)
        allow(now).to receive(:utc).and_return(utc)
        allow(utc).to receive(:strftime).and_return(datetime)
      end

      let(:now) { double('now') }
      let(:utc) { double('utc-time') }
      let(:datetime) { '20160101T112233Z' }
      let(:credentials) { Credentials.new('akid', 'secret') }
      let(:region) { 'us-west-2' }

      describe '#initialize' do

        it 'requires :credentials' 


        it 'requries :region' 


      end

      describe '#presigned_url' do

        it 'can presign #synthesize_speech correctly' 


      end

    end
  end
end

