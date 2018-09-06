require 'spec_helper'

describe 'User views a wiki page' do
  shared_examples 'wiki page user view' do
    let(:user) { create(:user) }
    let(:project) { create(:project, :wiki_repo, namespace: user.namespace) }
    let(:wiki_page) do
      create(:wiki_page,
        wiki: project.wiki,
        attrs: { title: 'home', content: 'Look at this [image](image.jpg)\n\n ![alt text](image.jpg)' })
    end

    before do
      project.add_master(user)
      sign_in(user)
    end

    context 'when wiki is empty' do
      before do
        visit(project_wikis_path(project))

        click_on('New page')

        page.within('#modal-new-wiki') do
          fill_in(:new_wiki_path, with: 'one/two/three-test')
          click_on('Create page')
        end

        page.within('.wiki-form') do
          fill_in(:wiki_content, with: 'wiki content')
          click_on('Create page')
        end
      end

      it 'shows the history of a page that has a path', :js do
        expect(current_path).to include('one/two/three-test')

        first(:link, text: 'Three').click
        click_on('Page history')

        expect(current_path).to include('one/two/three-test')

        page.within(:css, '.nav-text') do
          expect(page).to have_content('History')
        end
      end

      it 'shows an old version of a page', :js do
        expect(current_path).to include('one/two/three-test')
        expect(find('.wiki-pages')).to have_content('Three')

        first(:link, text: 'Three').click

        expect(find('.nav-text')).to have_content('Three')

        click_on('Edit')

        expect(current_path).to include('one/two/three-test')
        expect(page).to have_content('Edit Page')

        fill_in('Content', with: 'Updated Wiki Content')

        click_on('Save changes')
        click_on('Page history')

        page.within(:css, '.nav-text') do
          expect(page).to have_content('History')
        end

        find('a[href*="?version_id"]')
      end
    end

    context 'when a page does not have history' do
      before do
        visit(project_wiki_path(project, wiki_page))
      end

      it 'shows all the pages' 


      it 'shows a file stored in a page' 


      it 'shows the creation page if file does not exist' 

    end

    context 'when a page has history' do
      before do
        wiki_page.update(message: 'updated home', content: 'updated [some link](other-page)')
      end

      it 'shows the page history' 


      it 'does not show the "Edit" button' 

    end

    it 'opens a default wiki page', :js do
      visit(project_path(project))

      find('.shortcuts-wiki').click

      expect(page).to have_content('Home · Create Page')
    end
  end

  context 'when Gitaly is enabled' do
    it_behaves_like 'wiki page user view'
  end

  context 'when Gitaly is disabled', :skip_gitaly_mock do
    it_behaves_like 'wiki page user view'
  end
end

