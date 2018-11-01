# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  render_views

  let(:blog) { create(:blog) }

  with_each_theme do |theme, _view_path|
    context "with theme #{theme}" do
      before do
        blog.theme = theme
        blog.save
      end

      describe '#index' do
        before do
          @tag = create(:tag)
          @tag.contents << create(:article)
        end

        it 'works' 

      end

      describe '#show' do
        let(:parsed_body) { Capybara.string(response.body) }
        let(:article) { create(:article) }

        before do
          create(:tag, name: 'foo', contents: [article])
          get 'show', params: { id: 'foo' }
        end

        it 'has good rss feed link in head' 


        it 'has good atom feed link in head' 


        it 'has a canonical URL' 


        context 'with a password protected article' do
          let(:article) { create(:article, password: 'password') }

          it 'article in tag should be password protected' 

        end
      end
    end
  end
end

