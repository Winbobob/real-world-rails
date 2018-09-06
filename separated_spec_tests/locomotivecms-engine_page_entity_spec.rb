require 'spec_helper'

describe Locomotive::API::Entities::PageEntity do

  subject { described_class }

  attributes =
    %i(
      title
      parent_id
      position
      handle
      depth
      translated_in
      response_type
      slug
      fullpath
      redirect
      redirect_url
      redirect_type
      listed
      published
      templatized
      templatized_from_parent
      is_layout
      allow_layout
      cache_enabled
      seo_title
      meta_keywords
      meta_description
    )

  attributes.each do |exposure|
    it { is_expected.to represent(exposure) }
  end

  context 'overrides' do

    let(:site) { create(:site, locales: [:en, :fr]) }
    let(:parent_page) { create(:page, title: 'parent', slug: 'parent', site: site, raw_template: nil) }
    let(:page) { create(:page_with_editable_element, parent: parent_page) }

    subject { described_class.new(page) }

    let(:exposure) { subject.serializable_hash }

    describe 'editable_elements' do
      it 'returns the editable elements' 

    end

    describe 'template' do
      it 'returns the template' 

    end

    describe 'content_type' do

      let(:content_type) { instance_double('ContentType', slug: 'articles') }

      before { allow(page).to receive(:content_type).and_return(content_type) }


      it 'returns the target_entry_name' 

    end

    describe 'localized_fullpaths' do
      context 'with a current site' do

        subject { described_class.new(page, site: page.site) }

        it 'returns the localized_fullpaths' 

      end

      context 'without a current site' do
        it 'returns an empty hash' 

      end
    end

  end
end

