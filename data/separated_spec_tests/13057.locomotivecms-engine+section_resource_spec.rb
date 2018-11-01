require 'spec_helper'

describe Locomotive::API::Resources::SectionResource do

  include_context 'api site setup'

  let(:url_prefix) { '/locomotive/acmi/api/v3/sections' }
  let!(:section) { create(:section) }

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
        before { get "#{url_prefix}/#{section.id}.json" }
        it 'returns a successful response' 

      end
    end

    describe "POST create" do
      context 'JSON' do
        let(:section) { attributes_for(:section) }

        it 'creates a section' 

      end
    end

    describe "PUT update" do
      context 'JSON' do
        let(:updated_section) do
          section.serializable_hash.merge(name: 'new section')
        end

        let(:put_request) { put("#{url_prefix}/#{section.id}.json", section: updated_section) }

        it 'does not change the number of existing sections' 


        it 'updates the existing section' 


        context 'the section exists but we pass the slug instead of the id' do

          let(:put_request) { put("#{url_prefix}/#{section.slug}.json", section: updated_section) }

          it 'does not change the number of existing sections' 


          it 'updates the existing section' 


        end

        context 'the section does not exist so create it' do

          let(:section) { instance_double('Section', id: 'another-section') }
          let(:updated_section) { { name: 'Another section', template: 'Hello world', definition: attributes_for(:section)[:definition] } }

          it 'changes the number of existing sections' 


          it 'creates a new section' 


        end

      end
    end

    describe "DELETE destroy" do
      context 'JSON' do
        let(:delete_request) { delete("#{url_prefix}/#{section.id}.json") }

        it 'deletes the section' 


      end
    end

  end

end

