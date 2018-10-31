require 'spec_helper'

describe Locomotive::API::Resources::TranslationResource do

  include_context 'api site setup'

  let!(:translation) { Timecop.freeze(Time.zone.local(2015, 4, 1, 12, 0, 0)) { create(:translation, site: site) } }
  let(:params) { { locale: :en } }
  let(:url_prefix) { '/locomotive/acmi/api/v3/translations' }

  let(:translation_hash) do
    values = translation.values.stringify_keys
    { 'key' => translation.key, 'values' => values, 'created_at' => '2015-04-01T12:00:00Z', 'updated_at' => '2015-04-01T12:00:00Z' }
  end

  context 'no authenticated site' do
    describe "GET /locomotive/acme/api/v3/translations.json" do
      context 'JSON' do
        it 'returns unauthorized message' 


        it 'returns unauthorized response' 

      end
    end
  end

  context 'authenticated site' do
    include_context 'api header setup'

    describe "GET index" do
      context 'JSON' do

        before { get "#{url_prefix}.json" }

        it 'returns a successful response' 


        it 'returns the translation in an array' 

      end
    end

    describe "GET show" do
      context 'JSON' do
        before { get "#{url_prefix}/#{translation.id}.json" }
        it 'returns a successful response' 

      end
    end

    describe "POST create" do
      context 'JSON' do
        let(:json) { { key: :site, values: { one: :uno } } }

        it 'creates a translation on the current site' 

      end
    end

    describe "PUT update" do
      context 'JSON' do
        let(:json) { { key: translation.key, values: { one: :uno } } }
        let(:put_request) { put("#{url_prefix}/#{translation.id}.json", translation: json) }

        it 'does not change the number of existing translations' 


        it 'updates the existing translation' 

      end
    end

    describe "DELETE destroy" do
      context 'JSON' do
        let(:delete_request) { delete("#{url_prefix}/#{translation.id}.json") }

        it 'deletes the translation' 


        it 'returns the deleted translation' 

      end
    end

  end

end

