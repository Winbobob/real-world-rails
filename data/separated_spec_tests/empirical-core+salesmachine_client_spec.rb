require 'rails_helper'

describe SalesmachineClient do
  let(:subject) { described_class.new }
  let(:fake_sales_machine) { double(:sales_machine, batch: "batch", event: "event") }

  describe 'batch' do
    before do
      allow(described_class).to receive(:new) { fake_sales_machine }
    end

    it 'should call batch on a new machine' 

  end

  describe 'event' do
    before do
      allow(described_class).to receive(:new) { fake_sales_machine }
    end

    it 'should call event on a new machine' 

  end

  describe '#auth_header_value' do
    before do
      allow(Base64).to receive(:encode64) { |value| value }
    end

    it 'should return the base encoded api key' 

  end

  describe '#client' do
    it 'should return the faraday client with the correct url' 

  end

  describe '#batch' do
    it 'should make the request with the batch endpoint' 

  end
  
  describe '#event' do
    it 'should make the request with the batch endpoint' 

  end
end

