require 'spec_helper'

RSpec.describe 'Batch' do
  module Sidekiq
    module Batch
      class Status
      end
    end
  end

  load File.expand_path(File.join(File.dirname(__FILE__), '../../../lib/rspec/sidekiq/batch.rb'))

  describe 'NullObject' do
    describe '#method_missing' do
      it 'returns itself' 

    end
  end

  describe 'NullBatch' do
  end

  describe 'NullStatus' do
    let(:batch) {  Sidekiq::Batch.new }

    subject { batch.status }

    describe '#total' do
      it 'returns 0 when no jobs' 


      it 'returns 1 when 1 job' 

    end

    describe '#failures' do
      it 'returns 0' 

    end

    describe '#bid' do
      it 'returns a bid' 

    end

    describe '#join' do
      class MyCallback
        def on_event(status, options); end
      end

      before(:each) do
        batch.on(:event, MyCallback, my_arg: 42)
      end

      it 'executes callbacks' 

    end

    describe '#initialize' do
      it 'uses default argument values when none are provided' 

    end
  end
end

