require 'rails_helper'

RSpec.describe Healthcheck, type: :service do
  let(:components) do
    [
      { name: 'rabbit_mq', available: true },
      { name: 'barclaycard_gateway', available: true },
      { name: 'sendgrid', available: true }
    ]
  end

  let(:success_json) do
    { status: 'ok', components: components }
  end

  before do
    Rails.cache.clear
    allow(Healthcheck).to receive(:components).once.and_return components
  end

  after do
    Rails.cache.clear
  end

  context 'when healthcheck is cached' do
    before do
      Healthcheck.report # caches report
    end

    it "don't create new report" 


    it "returns a cached healthcheck report" 

  end

  context 'when healthcheck is not cached' do
    it "create new resort" 


    it "returns a new healthcheck report" 

  end
end

