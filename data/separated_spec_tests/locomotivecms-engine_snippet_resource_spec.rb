require 'spec_helper'

describe Locomotive::API::Resources::SnippetResource do

  include_context 'api site setup'

  let(:url_prefix) { '/locomotive/acmi/api/v3/snippets' }
  let!(:snippet) { create(:snippet) }

  context 'authenticated site' do
    include_context 'api header setup'

    describe "GET index" do
      context 'JSON' do
        before { get "#{url_prefix}.json" }

        it 'returns a successful response' 


      end
    end

    describe "GET show" do
      context 'JSON' do
        before { get "#{url_prefix}/#{snippet.id}.json" }
        it 'returns a successful response' 

      end
    end

    describe "POST create" do
      context 'JSON' do
        let(:snippet) { attributes_for(:snippet) }

        it 'creates a snippet' 

      end
    end

    describe "PUT update" do
      context 'JSON' do
        let(:updated_snippet) do
          snippet.serializable_hash.merge(name: 'new snippet')
        end

        let(:put_request) { put("#{url_prefix}/#{snippet.id}.json", snippet: updated_snippet) }

        it 'does not change the number of existing snippets' 


        it 'updates the existing snippet' 


        context 'the snippet exists but we pass the slug instead of the id' do

          let(:put_request) { put("#{url_prefix}/#{snippet.slug}.json", snippet: updated_snippet) }

          it 'does not change the number of existing snippets' 


          it 'updates the existing snippet' 


        end

        context 'the snippet does not exist so create it' do

          let(:snippet) { instance_double('Snippet', id: 'another-snippet') }
          let(:updated_snippet) { { name: 'Another snippet', template: 'Hello world' } }

          it 'changes the number of existing snippets' 


          it 'creates a new snippet' 


        end

      end
    end

    describe "DELETE destroy" do
      context 'JSON' do
        let(:delete_request) { delete("#{url_prefix}/#{snippet.id}.json") }

        it 'deletes the translation' 


      end
    end

  end

end

