require 'rails_helper'

RSpec.describe Healthcheck do
  subject { described_class.new }

  let(:mailers_queue) { [] }
  let(:zendesk_queue) { [] }

  before do
    allow(Sidekiq::Queue).
      to receive(:new).
      with('mailers').
      and_return mailers_queue
    allow(Sidekiq::Queue).
      to receive(:new).
      with('zendesk').
      and_return zendesk_queue
  end

  shared_examples 'everything is OK' do
    it { is_expected.to be_ok }

    it 'reports the overall status as OK' 

  end

  shared_examples 'everything is not OK' do
    it { is_expected.not_to be_ok }

    it 'reports the overall status as not OK' 

  end

  context 'when everything is OK' do
    it 'describes each service' 


    context 'with empty queues' do
      it_behaves_like 'everything is OK'

      it 'reports all services as OK' 


      it 'reports the queue status' 

    end

    context 'with only fresh queue items' do
      let(:mq_created_at) { 9.minutes.ago }
      let(:zq_created_at) { 8.minutes.ago }
      let(:mailers_queue) {
        [double(Sidekiq::Job, created_at: mq_created_at)]
      }
      let(:zendesk_queue) {
        [double(Sidekiq::Job, created_at: zq_created_at)]
      }

      it_behaves_like 'everything is OK'

      it 'reports all services as OK' 


      it 'reports the queue status' 

    end
  end

  context 'when there is a problem' do
    context 'with stale mailers queue items' do
      let(:mq_created_at) { 11.minutes.ago }
      let(:mailers_queue) {
        [double(Sidekiq::Job, created_at: mq_created_at)]
      }

      it_behaves_like 'everything is not OK'

      it 'reports the mailers check as false' 


      it 'reports the mailers queue status' 

    end

    context 'with stale zendesk queue items' do
      let(:zq_created_at) { 11.minutes.ago }
      let(:zendesk_queue) {
        [double(Sidekiq::Job, created_at: zq_created_at)]
      }

      it_behaves_like 'everything is not OK'

      it 'reports the zendesk check as false' 


      it 'reports the zendesk queue status' 

    end

    context 'with an inactive database' do
      before do
        allow(ActiveRecord::Base.connection).
          to receive(:active?).
          and_return(false)
      end

      it_behaves_like 'everything is not OK'

      it 'reports the database check as false' 

    end

    context 'with an unreachable database' do
      before do
        allow(ActiveRecord::Base.connection).
          to receive(:active?).
          and_raise(PG::ConnectionBad)
      end

      it_behaves_like 'everything is not OK'

      it 'reports the database check as false' 

    end

    context 'with another database exception' do
      before do
        allow(ActiveRecord::Base.connection).
          to receive(:active?).
          and_raise(StandardError)
      end

      it_behaves_like 'everything is not OK'

      it 'reports the database check as false' 

    end

    context 'with the Sidekiq API' do
      before do
        allow(Sidekiq::Queue).to receive(:new).and_raise('queue problem')
      end

      it 'reports the queue checks as false' 


      it 'reports the queue status' 

    end
  end
end

