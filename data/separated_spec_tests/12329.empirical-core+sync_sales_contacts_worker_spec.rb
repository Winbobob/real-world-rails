require 'rails_helper'

describe SyncSalesContactsWorker do
  let(:subject) { described_class.new }

  describe '#perform', redis: true do
    before do
      $redis.rpush("list", "key one")
      $redis.rpush("list", "key two")
      allow(SerializeSalesContact).to receive(:new) { double(:serializer, data: "data") }
      allow(SalesmachineClient).to receive(:batch) { double(:response, success?: true) }
    end

    it 'should serialize the sales contact and call the salemachine client with the data' 

  end
end

