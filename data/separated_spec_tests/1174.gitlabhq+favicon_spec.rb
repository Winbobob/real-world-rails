require 'rails_helper'

RSpec.describe Gitlab::Favicon, :request_store do
  describe '.main' do
    it 'defaults to favicon.png' 


    it 'has blue favicon for development' 


    it 'has yellow favicon for canary' 


    it 'uses the custom favicon if a favicon appearance is present' 


    context 'asset host' do
      before do
        allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('production'))
      end

      it 'returns a relative url when the asset host is not configured' 


      it 'returns a full url when the asset host is configured' 

    end
  end

  describe '.status_overlay' do
    subject { described_class.status_overlay('favicon_status_created') }

    it 'returns the overlay for the status' 

  end

  describe '.available_status_names' do
    subject { described_class.available_status_names }

    it 'returns the available status names' 

  end
end

