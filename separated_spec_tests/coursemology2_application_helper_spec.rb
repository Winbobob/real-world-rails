# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'sidebar navigation' do
    it 'defaults to not having a sidebar' 


    describe '#sidebar!' do
      it 'sets #sidebar?' 

    end

    describe '#sidebar' do
      it 'sets #sidebar?' 


      it 'accepts a block as the sidebar contents' 

    end
  end

  describe 'sidebar items' do
    let(:sidebar_items) do
      [
        {
          title: 'Announcements',
          path: 'courses/1/announcements',
          unread: 1
        },
        {
          title: 'Levels',
          path: 'courses/1/levels'
        }
      ]
    end

    describe '#link_to_sidebar_item' do
      let(:sidebar_item) { sidebar_items.sample }
      subject { helper.link_to_sidebar_item(sidebar_item) }

      it 'generates a link with title' 


      it 'shows the unread badge' 

    end

    describe '#sidebar_items' do
      context 'when function is called' do
        subject { helper.sidebar_items(sidebar_items) }

        it 'displays all the sidebar items' 

      end

      it 'sets #sidebar?' 

    end
  end

  describe 'page title helper' do
    subject { helper.page_title }

    context 'when the page title is not set' do
      it { is_expected.to eq(t('layout.coursemology')) }
    end

    context 'when the page title is explicitly set' do
      let(:test_title) { 'this is a test' }
      before { helper.content_for(:page_title, test_title) }
      it { is_expected.to eq("#{test_title} - #{t('layout.coursemology')}") }
    end

    context 'when there are breadcrumbs present' do
      let!(:breadcrumbs) { ['a', 'b', 'c'] }
      before do
        bc = breadcrumbs
        helper.define_singleton_method(:breadcrumb_names) { bc }
      end
      it { is_expected.to eq("#{breadcrumbs.reverse.join(' - ')} - #{t('layout.coursemology')}") }
    end
  end

  describe '#page_header' do
    context 'when custom header text is provided' do
      let(:header) { 'Custom header' }
      subject { helper.page_header(header) }

      it 'shows the custom header text' 

    end
  end
end

