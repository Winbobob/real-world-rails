# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feedback/index.rss.builder', type: :view do
  describe 'rendering feedback' do
    let(:article) { build_stubbed :article }
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

    it 'renders a valid rss feed with two entries' 


    describe 'the comment entry' do
      let(:rendered_entry) { Feedjira::Feed.parse(rendered).entries.first }
      let(:xml_entry) { Nokogiri::XML.parse(rendered).css('item').first }

      it 'has all the required attributes' 

    end

    describe 'the trackback entry' do
      let(:rendered_entry) { Feedjira::Feed.parse(rendered).entries.last }
      let(:xml_entry) { Nokogiri::XML.parse(rendered).css('item').last }

      it 'has all the required attributes' 

    end
  end
end

