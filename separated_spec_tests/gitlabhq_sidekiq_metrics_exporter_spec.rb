require 'spec_helper'

describe Gitlab::Metrics::SidekiqMetricsExporter do
  let(:exporter) { described_class.new }
  let(:server) { double('server') }

  before do
    allow(::WEBrick::HTTPServer).to receive(:new).and_return(server)
    allow(server).to receive(:mount)
    allow(server).to receive(:start)
    allow(server).to receive(:shutdown)
  end

  describe 'when exporter is enabled' do
    before do
      allow(Settings.monitoring.sidekiq_exporter).to receive(:enabled).and_return(true)
    end

    describe 'when exporter is stopped' do
      describe '#start' do
        it 'starts the exporter' 


        describe 'with custom settings' do
          let(:port) { 99999 }
          let(:address) { 'sidekiq_exporter_address' }

          before do
            allow(Settings.monitoring.sidekiq_exporter).to receive(:port).and_return(port)
            allow(Settings.monitoring.sidekiq_exporter).to receive(:address).and_return(address)
          end

          it 'starts server with port and address from settings' 

        end
      end

      describe '#stop' do
        it "doesn't shutdown stopped server" 

      end
    end

    describe 'when exporter is running' do
      before do
        exporter.start.join
      end

      describe '#start' do
        it "doesn't start running server" 

      end

      describe '#stop' do
        it 'shutdowns server' 

      end
    end
  end

  describe 'when exporter is disabled' do
    before do
      allow(Settings.monitoring.sidekiq_exporter).to receive(:enabled).and_return(false)
    end

    describe '#start' do
      it "doesn't start" 

    end

    describe '#stop' do
      it "doesn't shutdown" 

    end
  end
end

