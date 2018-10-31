require 'spec_helper'

describe Locomotive::API::Resources::ContentTypeResource do

  include_context 'api site setup'

  let(:url_prefix) { '/locomotive/acmi/api/v3/content_types' }
  let!(:content_type) { create(:content_type, :with_field) }

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
        before { get "#{url_prefix}/#{content_type.id}.json" }
        it 'returns a successful response' 

      end
    end

    describe "POST create" do
      context 'JSON' do
        let(:content_type) do
          attributes_for('tasks content type').merge({
            fields: [attributes_for('text field')]
          })
        end

        it 'creates a content type' 

      end
    end

    describe "PUT update" do
      context 'JSON' do
        let(:updated_content_type) do
          content_type.serializable_hash.merge(name: 'new content type')
        end

        let(:put_request) { put("#{url_prefix}/#{content_type.id}.json", content_type: updated_content_type) }

        it 'does not change the number of existing content types' 


        it 'updates the existing content type' 


        context 'the content_type exists but we pass the slug instead of the id' do

          let(:put_request) { put("#{url_prefix}/#{content_type.slug}.json", content_type: updated_content_type) }

          it 'does not change the number of existing content types' 


          it 'updates the existing content type' 


        end

        context 'the content_type does not exist so create it' do

          let(:content_type) { instance_double('ContentType', id: 'another-content-type') }
          let(:updated_content_type) {
            attributes_for('tasks content type', slug: 'another-content-type').merge({
              fields: [attributes_for('text field')]
            })
           }

          it 'changes the number of existing content types' 


          it 'creates a new content type' 


        end

      end
    end

    describe "DELETE destroy" do
      context 'JSON' do
        let(:delete_request) { delete("#{url_prefix}/#{content_type.id}.json") }

        it 'deletes the content type' 


      end
    end

  end

end

