require 'spec_helper'

describe Locomotive::API::Resources::SiteResource do

  include_context 'api site setup'

  let(:locale) { :en }
  let(:params) { { locale: locale } }
  let(:url_prefix) { '/locomotive/acmi/api/v3/sites' }

  context 'authenticated site' do
    include_context 'api header setup'

    describe 'GET index' do
      context 'JSON' do
        before { get "#{url_prefix}.json" }
        it 'returns a successful response' 


      end
    end

    describe 'GET show' do
      context 'JSON' do
        before { get "#{url_prefix}/#{site.id}.json"}

        it 'returns a successful response' 

      end
    end

    describe 'POST create' do
      context 'JSON' do
        let(:new_site) do
          attributes_for('test site').tap do |test_site|
            test_site[:locales] = [:en, :fr, :nb]
            test_site[:domains] = ['another.example.com']
          end

        end

        it 'creates a site' 

      end
    end

    context 'additional existing site' do
      let!(:new_site) do
        new_site = create('test site', seo_title: 'Hi')
        create(:admin, account: account, site: new_site, role: 'admin')
        new_site
      end

      describe "PUT update" do
        context 'JSON' do
          let(:new_site_params) do
            new_site.serializable_hash.merge(name: 'changed name', metafields_schema: nil)
          end
          let(:put_request) { put("#{url_prefix}/#{new_site.id}.json", site: new_site_params, locale: locale) }

          it 'changes the site name' 


          context 'localized params' do
            let(:locale) { 'fr' }
            let(:new_site_params) do
              new_site.serializable_hash.merge(seo_title: 'Bonjour', metafields_schema: nil)
            end

            it 'changes the site seo_title' 

          end

          context 'metafields' do
            let(:new_site_params) do
              new_site.serializable_hash.merge({
                metafields_schema: [{ name: 'social', fields: [{ name: 'facebook', type: 'string' }, { name: 'twitter', type: 'string' }] }].to_json,
                metafields: { social: { facebook: 'fb.com/42', twitter: 'twitter.com/42' } }.to_json
              })
            end

            it 'changes the site metafields' 


          end
        end
      end

      describe "DELETE destroy" do
        context 'JSON' do
          let(:delete_request) { delete("#{url_prefix}/#{new_site.id}.json") }

          it 'deletes the site' 

        end
      end
    end

  end

end

