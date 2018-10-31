require 'spec_helper'

describe Locomotive::API::Resources::CurrentSiteResource do

  include_context 'api site setup'

  let(:params) { { locale: :en } }
  let(:url_prefix) { '/locomotive/acmi/api/v3/current_site' }

  context 'unknown site' do
    include_context 'api header setup'

    before { header('X-Locomotive-Site-Handle', nil) }

    describe 'GET show' do
      context 'JSON' do
        before { get "#{url_prefix}.json" }
        it 'returns an 404 error' 

      end
    end

  end

  context 'authenticated site' do
    include_context 'api header setup'

    describe 'GET show' do
      context 'JSON' do
        before { get "#{url_prefix}.json" }
        it 'returns the current site' 

      end
    end

    describe 'PUT update' do
      context 'JSON' do
        let(:site_params) { { name: 'emca, Inc.' } }
        let(:put_request) { put("#{url_prefix}.json", site: site_params) }

        it 'changes the site name' 


        context 'the site is invalid' do

            let(:site_params) { { name: '' } }

            it 'returns 422' 


          end

      end
    end

    describe 'DELETE destroy' do
      context 'JSON' do
        let(:delete_request) { delete("#{url_prefix}.json") }

        it 'deletes the site' 

      end
    end

  end

end

