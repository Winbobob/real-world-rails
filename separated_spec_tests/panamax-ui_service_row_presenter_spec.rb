require 'spec_helper'

describe ServiceRowPresenter do
  let(:fake_app) do
    double(:fake_app,
      id: 77
    )
  end
  let(:fake_service) do
    double(:fake_group,
      id: 99,
      name: 'shaka',
      icon: 'shaka.svg',
      status: 'loading',
      app: fake_app
    )
  end

  subject { ServiceRowPresenter.new(fake_service) }

  describe '#name' do
    it 'exposes the service name' 

  end

  describe '#icon' do
    it 'exposes the service icon' 

  end

  describe '#status' do
    it 'exposes the service status' 

  end

  describe '#service_url' do
    it 'exposes the service_url' 

  end
end

