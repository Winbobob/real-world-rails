# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Extensions: Database Event' do
  subject { Instance.default }

  self::NOTIFICATION = 'database_event_test'

  def signal
    Thread.new do
      ActiveRecord::Base.connection_pool.with_connection do
        ActiveRecord::Base.signal(self.class::NOTIFICATION)
      end
    end
  end

  describe '.wait' do
    context 'when a timeout is specified' do
      context 'when the timeout elapses without a signal' do
        it 'returns nil' 

      end
    end

    context 'when a timeout is not specified' do
      it 'returns the notification event notified' 

    end

    context 'when a while_callback is specified' do
      it 'is called' 


      context 'when the callback returns false on the first time' do
        it 'returns false' 

      end

      context 'when the callback returns false on subsequent times' do
        context 'when no notification was received' do
          it 'returns nil' 

        end

        context 'when a notification was received' do
          it 'returns the notification' 

        end
      end
    end
  end

  describe '#wait' do
    it 'respects the timeout' 


    it 'respects the while_callback' 


    it 'automatically generates a notification identifier' 

  end

  describe '#signal' do
    it 'automatically generates a notification identifier' 

  end
end

