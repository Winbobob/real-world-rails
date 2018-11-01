require 'spec_helper'

describe NewsController do
  context 'legacy' do
    describe 'index' do
      it 'renders' 

    end

    describe 'show' do
      let(:user) { FactoryGirl.create(:user) }
      let(:blog) { Blog.create(title: 'foo title', body: 'ummmmm good', user_id: user.id, old_title_slug: 'an-older-title') }
      context 'title slug' do
        it 'renders' 

      end
      context 'old title slug' do
        it 'renders' 

      end
      context 'id' do
        it 'renders' 

      end
    end
  end

  context 'revised' do
    describe 'index' do
      context 'html' do
        it 'renders' 

      end
      context 'xml' do
        it 'redirects to atom' 

      end
      context 'atom' do
        it 'renders' 

      end
    end

    describe 'show' do
      let(:user) { FactoryGirl.create(:user) }
      let(:blog) { Blog.create(title: 'foo title', body: 'ummmmm good', user_id: user.id, old_title_slug: 'an-older-title') }
      it 'renders' 

    end
  end
end

