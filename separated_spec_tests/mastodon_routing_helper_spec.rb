# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoutingHelper, type: :helper do
  describe '.full_asset_url' do
    around do |example|
      use_s3 = Rails.configuration.x.use_s3
      example.run
      Rails.configuration.x.use_s3 = use_s3
    end

    shared_examples 'returns full path URL' do
      it 'with host' 


      it 'without host' 

    end

    context 'Do not use S3' do
      before do
        Rails.configuration.x.use_s3 = false
      end

      it_behaves_like 'returns full path URL'
    end

    context 'Use S3' do
      before do
        Rails.configuration.x.use_s3 = true
      end

      it_behaves_like 'returns full path URL'
    end
  end
end

