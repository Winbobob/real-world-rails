require 'rails_helper'

describe SyncSalesAccountsWorker do
  let(:subject) { described_class.new }

  describe '#perform', redis: true do
    before do
      $redis.rpush("list", "key one")
      $redis.rpush("list", "key two")
      $redis.rpush("list" ,"key three")
      allow(SerializeSalesAccount).to receive(:new) { double(:serializer, data: "data") }
      allow(SalesmachineClient).to receive(:batch) { double(:response, success?: true) }
    end

    it 'should find the values from redis and trim it out of redis' 

  end
end

