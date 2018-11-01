require 'spec_helper'

describe Locomotive::API::Resources::ContentEntryResource do

  include_context 'api site setup'

  let(:content_type) { create('article content type', :with_select_field_and_options, site: site) }
  let!(:content_entry) { content_type.entries.create(title: 'Hello world', body: 'Lorem ipsum', site: site) }
  let(:url_prefix) { "/locomotive/acmi/api/v3/content_types/#{content_type.slug}/entries" }

  context 'authenticated site' do
    include_context 'api header setup'

    describe "GET index" do
      context 'JSON' do
        before { get "#{url_prefix}.json" }

        it 'returns a successful response' 


        describe 'pagination' do

          before do
            content_type.entries.create title: 'Lorem ipsum'
            get "#{url_prefix}.json", page: 2, per_page: 1
          end

          it 'returns a successful response' 


        end

      end
    end

    describe "GET show" do
      context 'JSON' do
        before { get "#{url_prefix}/#{content_entry._slug}.json" }
        it 'returns a successful response' 

      end
    end

    describe "POST create" do

      context 'JSON' do
        let(:content_entry_params) do
          {
            title:          'Article #1',
            body:           'Lorem ipsum',
            featured:       true,
            picture:        rack_asset('5k.png'),
            published_on:   '2009/09/10 09:00:00',
            author_email:   'john@doe.net',
            grade:          4.2,
            duration:       420,
            tags:           ['foo', 'bar'],
            price:          '$42.0',
            category:       'Development',
            archived_at:    '2009/09/12'
          }
        end

        subject { post("#{url_prefix}.json", content_entry: content_entry_params) }

        it 'creates a content entry' 


        it 'returns the new content entry' 


        context 'the content entry is invalid' do

          let(:content_entry_params) { { body: 'Lorem ipsum' } }

          it 'returns 422' 


        end

      end
    end

    describe "PUT update" do
      context 'JSON' do

        let(:locale) { 'en' }
        let(:content_entry_params) { { title: 'Hello world [UPDATED]' } }

        let(:put_request) { put("#{url_prefix}/#{content_entry.id}.json", { content_entry: content_entry_params }, { 'HTTP_X_LOCOMOTIVE_LOCALE' => locale }) }

        it 'does not change the number of existing content entries' 


        it 'updates the existing content entry' 


        context 'updates an existing and localized content entry' do

          let(:content_type) { create('localized article content type', site: site) }
          let(:content_entry_params) { { title: 'Bonjour monde' } }
          let(:locale) { 'fr' }

          it 'updates the existing content entry' 


        end

        context 'the content entry exists but we pass the slug instead of the id' do

          let(:put_request) { put("#{url_prefix}/#{content_entry._slug}.json", content_entry: content_entry_params) }

          it 'does not change the number of existing content entries' 


          it 'updates the existing content entry' 


        end

        context 'the content entry does not exist so create it' do

          let(:content_entry) { instance_double('ContentEntry', id: 'another-content-entry') }
          let(:content_entry_params) { { title: 'A new test', _slug: 'another-content-entry' } }

          it 'changes the number of existing content entries' 


          it 'creates a new content entry' 


          context 'the content entry is invalid' do

            let(:content_entry_params) { { body: 'Lorem ipsum' } }

            it 'returns 422' 


          end

        end

        context 'resetting the auth attributes (set by Steam)' do

          let!(:content_entry) { content_type.entries.create(title: 'Hello world', body: 'Lorem ipsum', site: site, _auth_reset_token: '42', _auth_reset_sent_at: 'tomorrow') }
          let(:content_entry_params) { { title: 'Hello world [UPDATED]', _auth_reset_token: '', _auth_reset_sent_at: '' } }

          it 'updates the _auth_reset_token and _auth_reset_sent_at columns' 


        end

      end
    end

    describe "DELETE destroy" do
      context 'JSON' do
        let(:delete_request) { delete("#{url_prefix}/#{content_entry.id}.json") }

        it 'deletes the content entry' 


      end
    end

  end

end

