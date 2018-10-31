# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'xml_sidebar/_content.html.erb', type: :view do
  let(:sidebar) { XmlSidebar.new }

  context 'by default' do
    before do
      render partial: sidebar.content_partial, locals: sidebar.to_locals_hash
    end

    it 'renders a link to the articles feed' 


    it 'renders a link to the feedback feed' 

  end

  context 'on an article page' do
    before do
      allow(controller).to receive(:controller_name).and_return 'articles'
      allow(controller).to receive(:action_name).and_return 'redirect'
      @article = create :article
      render partial: sidebar.content_partial, locals: sidebar.to_locals_hash
    end

    it 'renders a link to the article comments feed' 

  end

  context 'on a tags page' do
    before do
      sidebar.tag_feeds = true
      allow(controller).to receive(:controller_name).and_return 'tags'
      allow(controller).to receive(:action_name).and_return 'show'
      @tag = create :tag
      @auto_discovery_url_atom = 'foofoo'
      render partial: sidebar.content_partial, locals: sidebar.to_locals_hash
    end

    it 'renders a link to the tag feed' 

  end
end

