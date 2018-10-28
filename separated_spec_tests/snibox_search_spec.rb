# TODO: add specs for keyboard navigation

require 'rails_helper'

describe 'Search', js: true do
  before do
    login
  end

  context 'shortcuts' do
    before do
      create(:snippet_with_tag)
    end

    it 'focus on slash' 


    it 'blur on escape' 

  end

  it 'show suggestions block' 


  it 'show first 5 results' 


  it 'open snippet when click on suggestion' 


  context 'search snippets' do
    context 'with label' do
      before do
        create(:snippet_with_tag)
        fill_search_after_delay
      end
      it 'show snippet with label' 

    end

    context 'without label' do
      before do
        create(:snippet_without_tag, title: 'snippet_1')
        fill_search_after_delay
      end
      it 'show snippet with untagged label' 

    end
  end

  private

  def fill_search_after_delay
    sleep 0.5
    find(:css, '.search').set('snippet1')
  end
end

