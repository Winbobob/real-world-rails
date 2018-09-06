require 'spec_helper'

describe MailScheduler::NotificationServiceWorker do
  let(:worker) { described_class.new }
  let(:method) { 'new_key' }
  set(:key) { create(:personal_key) }

  def serialize(*args)
    ActiveJob::Arguments.serialize(args)
  end

  describe '#perform' do
    it 'deserializes arguments from global IDs' 


    context 'when the arguments cannot be deserialized' do
      it 'does nothing' 

    end

    context 'when the method is not a public method' do
      it 'raises NoMethodError' 

    end
  end

  describe '.perform_async' do
    it 'serializes arguments as global IDs when scheduling' 

  end
end

