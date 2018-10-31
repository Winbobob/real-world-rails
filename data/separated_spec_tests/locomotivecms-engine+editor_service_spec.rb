# encoding: utf-8

describe Locomotive::EditorService do

  let(:account)     { double(:account) }
  let(:page)        { double(:page) }
  let(:service)     { described_class.new(site, account, page) }

  describe '#find_resources' do

    let(:site)  { create(:site) }
    let(:query) { 'none' }

    subject { service.find_resources(query) }

    it { is_expected.to eq [] }

    context 'with a bunch of pages' do

      before do
        create(:page, title: 'Hello', slug: nil, site: site, published: false)
        create(:page, title: 'Hello layout', slug: nil, site: site, is_layout: true)
        2.times { |i| create(:page, title: "Hello world #{i}", slug: nil, site: site) }
        3.times { |i| create(:page, title: "Another page #{i}", slug: nil, site: site) }
      end

      let(:query) { 'Hello' }

      it 'returns the pages whose titles match the query' 


    end

    context 'with a bunch of content entries' do

      let(:content_type)  { create(:content_type, :article, site: site) }
      let(:query)         { 'Article' }

      before do
        klass_name = content_type.entries_class_name
        create(:page, title: 'Article template', slug: nil, site: site, target_klass_name: klass_name)
        content_type.entries.create(title: "Article", visible: false)
        3.times { |i| content_type.entries.create(title: "Article #{i}", visible: true) }
      end

      it 'returns the articles whose titles match the query' 


    end

  end

  describe '#save' do

    let(:site)        { double(:site) }
    let(:activities)  { double(:activities) }

    let(:site_attributes) { {
      sections_content:
      <<-JSON
        {
          "header_01": {
            "settings": {},
            "blocks": [
              {
                "type": "menu_item",
                "id": "0"
              },
              {
                "type": "menu_item",
                "id": "1"
              },
              {
                "type": "menu_item",
                "id": "2"
              }
            ]
          }
        }
      JSON
      }
    }

    let(:page_attributes) { {
      sections_dropzone_content:
        <<-JSON
          [{
            "id": "10ebe2f8-af88-4d87-9df8-58e3e624d662",
            "name": "Cover 04",
            "settings": {},
            "blocks": [
              {
                "type": "slide",
                "id": "72a28230-62fb-429c-b7ae-69ae377015b8"
              },
              {
                "type": "slide",
                "id": "bc06c67a-d268-44fb-a6de-cff5df845ed7"
              }
            ]
          }]
        JSON
    } }

    subject { service.save(site_attributes, page_attributes) }

    it 'save the page sections dropzone' 


  end
end

