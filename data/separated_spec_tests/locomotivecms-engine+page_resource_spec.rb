require 'spec_helper'

describe Locomotive::API::Resources::PageResource do

  include_context 'api site setup'

  let(:params) { { locale: :en } }
  let(:url_prefix) { '/locomotive/acmi/api/v3/pages' }
  let(:page) { create(:page, :index, site: site) }

  context 'authenticated site' do
    include_context 'api header setup'

    describe 'GET index' do
      context 'JSON' do
        before { get "#{url_prefix}.json" }

        it 'returns a successful response' 


      end
    end

    describe 'GET fullpaths' do
      context 'JSON' do

        let(:locale) { nil }

        before { get "#{url_prefix}/fullpaths.json", {}, { 'HTTP_X_LOCOMOTIVE_LOCALE' => locale } }

        it 'returns a successful response' 


        context 'in a different locale' do

          let(:locale) { 'fr' }

          it 'returns a successful response' 


        end

      end
    end

    describe 'GET show' do
      context 'JSON' do
        before { get "#{url_prefix}/#{page.id}.json"}

        it 'returns a successful response' 

      end
    end

    describe 'POST create' do
      let(:new_page) do
        attributes_for('page').merge({
          title:    'title',
          slug:     'slug',
          parent:   site.pages.first.id,
          template: 'Hello world',
          editable_elements: [
            {
              "block"   => "banner",
              "slug"    => "page_image",
              "content" => rack_asset('5k.png')
            }
          ]
        })
      end

      context 'JSON' do
        it 'creates a page' 

      end
    end

    describe "PUT update" do
      context 'JSON' do
        let(:page_params) { page.serializable_hash.merge(title: 'changed title').tap { |params|
          params['sections_content']           = params['sections_content'].to_json
          params['sections_dropzone_content']  = params['sections_dropzone_content'].to_json
        } }
        let(:put_request) { put("#{url_prefix}/#{page.id}.json", page: page_params) }

        it 'changes the page title' 

      end
    end

    describe "DELETE destroy" do
      context 'JSON' do
        let!(:page_to_be_destroyed) { create(:sub_page, site: site) }
        let(:delete_request) { delete("#{url_prefix}/#{page_to_be_destroyed.id}.json") }

        it 'deletes the page' 

      end
    end

  end

end

