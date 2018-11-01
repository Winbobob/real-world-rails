require 'spec_helper'

describe Locomotive::API::Resources::ThemeAssetResource do

  include_context 'api site setup'

  let!(:theme_asset)  { create(:theme_asset, site: site, source: rack_theme_image('rails.png')) }
  let(:params)        { { locale: :en } }
  let(:url_prefix)    { '/locomotive/acmi/api/v3/theme_assets' }

  context 'authenticated site' do
    include_context 'api header setup'

    describe 'GET index' do
      context 'JSON' do
        before { get "#{url_prefix}.json" }
        it 'returns a successful response' 

      end
    end

    describe 'GET checksums' do
      context 'JSON' do
        before { get "#{url_prefix}/checksums.json" }
        it 'returns a successful response' 

      end
    end

    describe 'GET show' do
      context 'JSON' do
        before { get "#{url_prefix}/#{theme_asset.id}.json"}

        it 'returns a successful response' 

      end
    end

    describe 'POST create' do
      context 'JSON' do
        let(:theme_asset) do
          attributes_for(:theme_asset).tap do |attributes|
            attributes[:source] = rack_theme_image('rails_2.png')
          end
        end

        it 'creates a theme_asset on the current site' 

      end
    end

    describe "PUT update" do
      context 'JSON' do
        let(:put_request) { put("#{url_prefix}/#{theme_asset.id}.json", theme_asset: { source: nil }) }

        it 'does not change the number of existing theme assets' 


      end
    end

    describe "DELETE destroy" do
      context 'JSON' do
        let(:delete_request) { delete("#{url_prefix}/#{theme_asset.id}.json") }

        it 'deletes the theme asset' 


      end
    end

  end

end

