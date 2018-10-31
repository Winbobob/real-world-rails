# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feedback/index.atom.builder', type: :view do
  let(:parsed_feed) { Feedjira::Feed.parse(rendered) }

  describe 'rendering feedback' do
    let(:article) { build_stubbed(:article) }
    let(:comment) do
      build_stubbed(:comment,
                    article: article,
                    body: 'Comment body',
                    guid: '12313123123123123')
    end
    let(:trackback) { build_stubbed(:trackback, article: article) }

    before do
      assign(:feedback, [comment, trackback])
      render
    end

    it 'shows publify with the current version as the generator' 


    it 'renders a valid Atom feed with two items' 


    it 'links to the blog base url' 


    describe 'the comment entry' do
      let(:rendered_entry) { parsed_feed.entries.first }

      it 'has all the required attributes' 

    end

    describe 'the trackback entry' do
      let(:rendered_entry) { parsed_feed.entries.last }

      it 'has all the required attributes' 

    end
  end
end

