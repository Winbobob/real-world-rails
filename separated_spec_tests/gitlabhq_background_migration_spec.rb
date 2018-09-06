require 'spec_helper'

describe Gitlab::BackgroundMigration do
  describe '.queue' do
    it 'returns background migration worker queue' 

  end

  describe '.steal' do
    context 'when there are enqueued jobs present' do
      let(:queue) do
        [double(args: ['Foo', [10, 20]], queue: described_class.queue)]
      end

      before do
        allow(Sidekiq::Queue).to receive(:new)
          .with(described_class.queue)
          .and_return(queue)
      end

      context 'when queue contains unprocessed jobs' do
        it 'steals jobs from a queue' 


        it 'does not steal job that has already been taken' 


        it 'does not steal jobs for a different migration' 

      end

      context 'when one of the jobs raises an error' do
        let(:migration) { spy(:migration) }

        let(:queue) do
          [double(args: ['Foo', [10, 20]], queue: described_class.queue),
           double(args: ['Foo', [20, 30]], queue: described_class.queue)]
        end

        before do
          stub_const("#{described_class}::Foo", migration)

          allow(queue[0]).to receive(:delete).and_return(true)
          allow(queue[1]).to receive(:delete).and_return(true)
        end

        it 'enqueues the migration again and re-raises the error' 

      end
    end

    context 'when there are scheduled jobs present', :sidekiq, :redis do
      it 'steals all jobs from the scheduled sets' 

    end

    context 'when there are enqueued and scheduled jobs present', :sidekiq, :redis do
      it 'steals from the scheduled sets queue first' 

    end
  end

  describe '.perform' do
    let(:migration) { spy(:migration) }

    before do
      stub_const("#{described_class.name}::Foo", migration)
    end

    it 'performs a background migration' 

  end
end

