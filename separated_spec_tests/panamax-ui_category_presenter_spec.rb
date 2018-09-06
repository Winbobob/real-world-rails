require 'spec_helper'

describe CategoryPresenter do
  let(:fake_category) do
    double(:fake_category,
      name: 'shaka',
      id: 77
    )
  end
  let(:fake_app) do
    double(:fake_app,
      id: 1
    )
  end
  let(:fake_service) do
    double(:fake_service,
      name: 'boom_service'
    )
  end
  let(:fake_services) do
    double(:fake_services,
      first: fake_service
    )
  end

  subject { CategoryPresenter.new(fake_app, fake_category, fake_services) }

  describe '#name' do
    it 'exposes the category name' 

  end

  describe '#id' do
    it 'exposes the category id' 

  end

  describe '#app_id' do
    it 'exposed the application id' 

  end

  describe '#services' do
    it 'exposes the category services' 

  end
end

