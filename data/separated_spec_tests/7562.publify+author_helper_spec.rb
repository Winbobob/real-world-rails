# frozen_string_literal: true

require 'rails_helper'

describe AuthorsHelper, type: :helper do
  describe 'display_profile_item' do
    it 'displays the item as a list item if show_item is true' 


    it 'does not display the item empty' 


    it 'displays a link if the item is an url' 

  end

  describe 'author_link' do
    let!(:blog) { create(:blog) }

    context 'with an article' do
      let(:article) { build(:article, author: author) }

      context 'with an author with a name to this article' do
        let(:author) { build(:user, name: 'Henri') }

        it { expect(author_link(article)).to eq(author.name) }
      end

      context 'with an author without a name to this article' do
        let(:author) { build(:user, name: '') }

        it { expect(author_link(article)).to eq(author.login) }
      end
    end
  end
end
