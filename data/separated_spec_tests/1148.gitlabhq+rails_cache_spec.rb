require 'spec_helper'

describe Gitlab::Metrics::Subscribers::RailsCache do
  let(:env) { {} }
  let(:transaction) { Gitlab::Metrics::WebTransaction.new(env) }
  let(:subscriber) { described_class.new }

  let(:event) { double(:event, duration: 15.2) }

  describe '#cache_read' do
    it 'increments the cache_read duration' 


    context 'with a transaction' do
      before do
        allow(subscriber).to receive(:current_transaction)
                               .and_return(transaction)
      end

      context 'with hit event' do
        let(:event) { double(:event, duration: 15.2, payload: { hit: true }) }

        it 'increments the cache_read_hit count' 


        context 'when super operation is fetch' do
          let(:event) { double(:event, duration: 15.2, payload: { hit: true, super_operation: :fetch }) }

          it 'does not increment cache read miss' 

        end
      end

      context 'with miss event' do
        let(:event) { double(:event, duration: 15.2, payload: { hit: false }) }

        it 'increments the cache_read_miss count' 


        it 'increments the cache_read_miss total' 


        context 'when super operation is fetch' do
          let(:event) { double(:event, duration: 15.2, payload: { hit: false, super_operation: :fetch }) }

          it 'does not increment cache read miss' 


          it 'does not increment cache_read_miss total' 

        end
      end
    end
  end

  describe '#cache_write' do
    it 'observes write duration' 

  end

  describe '#cache_delete' do
    it 'observes delete duration' 

  end

  describe '#cache_exist?' do
    it 'observes the exists duration' 

  end

  describe '#cache_fetch_hit' do
    context 'without a transaction' do
      it 'returns' 

    end

    context 'with a transaction' do
      before do
        allow(subscriber).to receive(:current_transaction)
                               .and_return(transaction)
      end

      it 'increments the cache_read_hit count' 

    end
  end

  describe '#cache_generate' do
    context 'without a transaction' do
      it 'returns' 

    end

    context 'with a transaction' do
      let(:metric_cache_misses_total) { double('metric_cache_misses_total', increment: nil) }

      before do
        allow(subscriber).to receive(:metric_cache_misses_total).and_return(metric_cache_misses_total)
        allow(subscriber).to receive(:current_transaction)
                               .and_return(transaction)
      end

      it 'increments the cache_fetch_miss count' 


      it 'increments the cache_read_miss total' 

    end
  end

  describe '#observe' do
    context 'without a transaction' do
      it 'returns' 

    end

    context 'with a transaction' do
      before do
        allow(subscriber).to receive(:current_transaction)
                               .and_return(transaction)
      end

      it 'increments the total and specific cache duration' 


      it 'observes cache metric' 

    end
  end
end

