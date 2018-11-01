# frozen_string_literal: true

require 'rails_helper'

class TestBrokenSidebar < Sidebar
  description 'Invalid test sidebar'
  def parse_request(_contents, _request_params)
    raise "I'm b0rked!"
  end
end

describe BaseHelper, type: :helper do
  describe '#link_to_permalink' do
    describe 'for a simple ascii-only permalink' do
      let(:article) { build(:article, published_at: Date.new(2004, 6, 1).to_datetime, title: 'An Article sample') }

      it { expect(link_to_permalink(article, 'title')).to eq("<a href=\"#{article.permalink_url}\">title</a>") }
    end

    describe 'for a multibyte permalink' do
      let(:article) { build(:article, permalink: 'ルビー') }

      it { expect(link_to_permalink(article, 'title')).to include('%E3%83%AB%E3%83%93%E3%83%BC') }
    end
  end

  describe '#stop_index_robots?' do
    subject { helper.stop_index_robots?(blog) }

    let(:blog) { build :blog }

    context 'default' do
      it { expect(subject).to be_falsey }
    end

    context 'with year:2010' do
      before { params[:year] = 2010 }

      it { expect(subject).to be_truthy }
    end

    context 'with page:2' do
      before { params[:page] = 2 }

      it { expect(subject).to be_truthy }
    end

    context 'for the tags controller' do
      before { allow(helper).to receive(:controller_name).and_return('tags') }

      context 'with unindex_tags set in blog' do
        before { expect(blog).to receive(:unindex_tags).and_return(true) }

        it { expect(subject).to be_truthy }
      end

      context 'with unindex_tags set in blog' do
        before { expect(blog).to receive(:unindex_tags).and_return(false) }

        it { expect(subject).to be_falsey }
      end
    end

    context 'for the categories controller' do
      before { allow(helper).to receive(:controller_name).and_return('categories') }

      context 'with unindex_tags set in blog' do
        before { expect(blog).to receive(:unindex_categories).and_return(true) }

        it { expect(subject).to be_truthy }
      end

      context 'with unindex_tags set in blog' do
        before { expect(blog).to receive(:unindex_categories).and_return(false) }

        it { expect(subject).to be_falsey }
      end
    end
  end

  describe '#get_reply_context_url' do
    it "returns a link to the reply's URL if given" 


    it "returns a link to the reply's user if no URL is given" 

  end

  describe '#get_reply_context_twitter_link' do
    let(:reply) do
      { 'id_str' => '123456789',
        'created_at' => 'Thu Jan 23 13:47:00 +0000 2014',
        'user' => {
          'screen_name' => 'a_screen_name',
          'entities' => { 'url' => { 'urls' => [{ 'expanded_url' => 'an url' }] } }
        } }
    end

    it 'returns a link with the creation date and time' 


    it 'displays creation date and time in the current time zone' 

  end

  describe '#nofollowified_link_to' do
    it 'with dofollowify disabled, links should be nofollowed' 


    it 'with dofollowify enabled, links should be nofollowed' 

  end

  describe '#nofollowify_links' do
    before do
      @blog = create :blog
    end

    it 'with dofollowify disabled, links should be nofollowed' 


    it 'with dofollowify enabled, links should be nofollowed' 

  end

  describe '#render_sidebars' do
    let(:blog) { create :blog }

    before do
      allow(controller).to receive(:render_to_string).and_return 'Rendered'
    end

    describe 'with an invalid sidebar' do
      before do
        TestBrokenSidebar.new(blog: blog).save
      end

      def logger
        fake_logger = double('fake logger')
        expect(fake_logger).to receive(:error)
        fake_logger
      end

      it 'returns a friendly error message' 

    end

    describe 'with a valid sidebar' do
      before do
        Sidebar.new(blog: blog).save
      end

      it 'renders the sidebar' 

    end
  end

  describe '#display_date' do
    ['%d/%m/%y', '%m/%m/%y', '%d %b %Y', '%b %d %Y', '%I:%M%p', '%H:%M', '%Hh%M'].each do |spec|
      it "use #{spec} format from blog to render date" 

    end
  end

  describe '#link_to_permalink' do
    it 'returns just the title for unpublished articles' 

  end
end

