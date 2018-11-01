require 'spec_helper'

describe Gitlab::Metrics do
  include StubENV

  describe '.settings' do
    it 'returns a Hash' 

  end

  describe '.enabled?' do
    it 'returns a boolean' 

  end

  describe '.prometheus_metrics_enabled_unmemoized' do
    subject { described_class.send(:prometheus_metrics_enabled_unmemoized) }

    context 'prometheus metrics enabled in config' do
      before do
        allow(Gitlab::CurrentSettings).to receive(:prometheus_metrics_enabled).and_return(true)
      end

      context 'when metrics folder is present' do
        before do
          allow(described_class).to receive(:metrics_folder_present?).and_return(true)
        end

        it 'metrics are enabled' 

      end

      context 'when metrics folder is missing' do
        before do
          allow(described_class).to receive(:metrics_folder_present?).and_return(false)
        end

        it 'metrics are disabled' 

      end
    end
  end

  describe '.prometheus_metrics_enabled?' do
    it 'returns a boolean' 

  end

  describe '.influx_metrics_enabled?' do
    it 'returns a boolean' 

  end

  describe '.submit_metrics' do
    it 'prepares and writes the metrics to InfluxDB' 

  end

  describe '.prepare_metrics' do
    it 'returns a Hash with the keys as Symbols' 


    it 'escapes tag values' 


    it 'drops empty tags' 

  end

  describe '.escape_value' do
    it 'escapes an equals sign' 


    it 'casts values to Strings' 

  end

  describe '.measure' do
    context 'without a transaction' do
      it 'returns the return value of the block' 

    end

    context 'with a transaction' do
      let(:transaction) { Gitlab::Metrics::WebTransaction.new({}) }

      before do
        allow(described_class).to receive(:current_transaction)
          .and_return(transaction)
      end

      it 'adds a metric to the current transaction' 


      it 'returns the return value of the block' 

    end
  end

  describe '.action=' do
    context 'without a transaction' do
      it 'does nothing' 

    end

    context 'with a transaction' do
      it 'sets the action of a transaction' 

    end
  end

  describe '#series_prefix' do
    it 'returns a String' 

  end

  describe '.add_event' do
    context 'without a transaction' do
      it 'does nothing' 

    end

    context 'with a transaction' do
      it 'adds an event' 

    end
  end

  shared_examples 'prometheus metrics API' do
    describe '#counter' do
      subject { described_class.counter(:counter, 'doc') }

      describe '#increment' do
        it 'successfully calls #increment without arguments' 


        it 'successfully calls #increment with 1 argument' 


        it 'successfully calls #increment with 2 arguments' 

      end
    end

    describe '#summary' do
      subject { described_class.summary(:summary, 'doc') }

      describe '#observe' do
        it 'successfully calls #observe with 2 arguments' 

      end
    end

    describe '#gauge' do
      subject { described_class.gauge(:gauge, 'doc') }

      describe '#set' do
        it 'successfully calls #set with 2 arguments' 

      end
    end

    describe '#histogram' do
      subject { described_class.histogram(:histogram, 'doc') }

      describe '#observe' do
        it 'successfully calls #observe with 2 arguments' 

      end
    end
  end

  context 'prometheus metrics disabled' do
    before do
      allow(described_class).to receive(:prometheus_metrics_enabled?).and_return(false)
    end

    it_behaves_like 'prometheus metrics API'

    describe '#null_metric' do
      subject { described_class.send(:provide_metric, :test) }

      it { is_expected.to be_a(Gitlab::Metrics::NullMetric) }
    end

    describe '#counter' do
      subject { described_class.counter(:counter, 'doc') }

      it { is_expected.to be_a(Gitlab::Metrics::NullMetric) }
    end

    describe '#summary' do
      subject { described_class.summary(:summary, 'doc') }

      it { is_expected.to be_a(Gitlab::Metrics::NullMetric) }
    end

    describe '#gauge' do
      subject { described_class.gauge(:gauge, 'doc') }

      it { is_expected.to be_a(Gitlab::Metrics::NullMetric) }
    end

    describe '#histogram' do
      subject { described_class.histogram(:histogram, 'doc') }

      it { is_expected.to be_a(Gitlab::Metrics::NullMetric) }
    end
  end

  context 'prometheus metrics enabled' do
    let(:metrics_multiproc_dir) { Dir.mktmpdir }

    before do
      stub_const('Prometheus::Client::Multiprocdir', metrics_multiproc_dir)
      allow(described_class).to receive(:prometheus_metrics_enabled?).and_return(true)
    end

    it_behaves_like 'prometheus metrics API'

    describe '#null_metric' do
      subject { described_class.send(:provide_metric, :test) }

      it { is_expected.to be_nil }
    end

    describe '#counter' do
      subject { described_class.counter(:name, 'doc') }

      it { is_expected.not_to be_a(Gitlab::Metrics::NullMetric) }
    end

    describe '#summary' do
      subject { described_class.summary(:name, 'doc') }

      it { is_expected.not_to be_a(Gitlab::Metrics::NullMetric) }
    end

    describe '#gauge' do
      subject { described_class.gauge(:name, 'doc') }

      it { is_expected.not_to be_a(Gitlab::Metrics::NullMetric) }
    end

    describe '#histogram' do
      subject { described_class.histogram(:name, 'doc') }

      it { is_expected.not_to be_a(Gitlab::Metrics::NullMetric) }
    end
  end
end

