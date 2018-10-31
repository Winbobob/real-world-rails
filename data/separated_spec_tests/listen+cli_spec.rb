require 'listen/cli'

RSpec.describe Listen::CLI do
  let(:options) { {} }
  let(:forwarder) { instance_double(Listen::Forwarder) }

  before do
    allow(forwarder).to receive(:start)
  end

  describe 'directories option' do
    context 'not specified' do
      let(:options) { %w[] }
      it 'is set to local directory' 

    end

    context 'with a single directory' do
      let(:options) { %w[-d app] }
      it 'is set to app' 

    end

    context 'with a multiple directories' do
      let(:options) { %w[-d app spec] }
      it 'is set to an array of the directories' 

    end
  end

  describe 'relative option' do
    context 'without relative option' do
      let(:options) { %w[] }
      it 'is set to false' 

    end

    context 'when -r' do
      let(:options) { %w[-r] }

      it 'is set to true' 

    end

    context 'when --relative' do
      let(:options) { %w[--relative] }

      it 'supports -r option' 


      it 'supports --relative option' 

    end
  end
end

RSpec.describe Listen::Forwarder do
  let(:logger) { instance_double(Logger) }
  let(:listener) { instance_double(Listen::Listener) }

  before do
    allow(Logger).to receive(:new).and_return(logger)
    allow(logger).to receive(:level=)
    allow(logger).to receive(:formatter=)
    allow(logger).to receive(:info)

    allow(listener).to receive(:start)
    allow(listener).to receive(:processing?).and_return false
  end

  it 'passes relative option to Listen' 

end

