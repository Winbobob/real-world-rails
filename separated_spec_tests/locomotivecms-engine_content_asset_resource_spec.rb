require 'spec_helper'

describe Locomotive::API::Resources::ContentAssetResource do

  include_context 'api site setup'

  let!(:asset) { create(:asset, site: site, source: rack_theme_image('rails.png')) }
  let(:params) { { locale: :en } }
  let(:url_prefix) { '/locomotive/acmi/api/v3/content_assets' }

  context 'authenticated site' do
    include_context 'api header setup'

    describe 'GET index' do
      context 'JSON' do
        before { get "#{url_prefix}.json" }
        it 'returns a successful response' 


        it 'contains one asset' 

      end
    end

    describe 'GET show' do
      context 'JSON' do
        before { get "#{url_prefix}/#{asset.id}.json"}

        it 'returns a successful response' 

      end
    end

    describe 'POST create' do
      context 'JSON' do
        let(:asset) do
          attributes_for(:asset).tap do |attributes|
            attributes[:source] = rack_theme_image('rails_2.png')
          end
        end

        it 'creates a content_asset on the current site' 

      end
    end

    describe "PUT update" do
      context 'JSON' do
        let(:put_request) { put("#{url_prefix}/#{asset.id}.json", content_asset: { source: nil }) }

        it 'does not change the number of existing content assets' 


      end
    end

    describe "DELETE destroy" do
      context 'JSON' do
        let(:delete_request) { delete("#{url_prefix}/#{asset.id}.json") }

        it 'deletes the content asset' 


      end
    end

  end

end

