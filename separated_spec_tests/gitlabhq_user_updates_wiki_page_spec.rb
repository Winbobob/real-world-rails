require 'spec_helper'

describe 'User updates wiki page' do
  shared_examples 'wiki page user update' do
    let(:user) { create(:user) }
    before do
      project.add_master(user)
      sign_in(user)
    end

    context 'when wiki is empty' do
      before do
        visit(project_wikis_path(project))
      end

      context 'in a user namespace' do
        let(:project) { create(:project, :wiki_repo, namespace: user.namespace) }

        it 'redirects back to the home edit page' 


        it 'updates a page that has a path', :js do
          click_on('New page')

          page.within('#modal-new-wiki') do
            fill_in(:new_wiki_path, with: 'one/two/three-test')
            click_on('Create page')
          end

          page.within '.wiki-form' do
            fill_in(:wiki_content, with: 'wiki content')
            click_on('Create page')
          end

          expect(current_path).to include('one/two/three-test')
          expect(find('.wiki-pages')).to have_content('Three')

          first(:link, text: 'Three').click

          expect(find('.nav-text')).to have_content('Three')

          click_on('Edit')

          expect(current_path).to include('one/two/three-test')
          expect(page).to have_content('Edit Page')

          fill_in('Content', with: 'Updated Wiki Content')
          click_on('Save changes')

          expect(page).to have_content('Updated Wiki Content')
        end
      end
    end

    context 'when wiki is not empty' do
      let(:project_wiki) { create(:project_wiki, project: project, user: project.creator) }
      let!(:wiki_page) { create(:wiki_page, wiki: project_wiki, attrs: { title: 'home', content: 'Home page' }) }

      before do
        visit(project_wikis_path(project))
      end

      context 'in a user namespace' do
        let(:project) { create(:project, :wiki_repo, namespace: user.namespace) }

        it 'updates a page' 


        it 'shows a validation error message' 


        it 'shows the autocompletion dropdown', :js do
          click_link('Edit')

          find('#wiki_content').native.send_keys('')
          fill_in(:wiki_content, with: '@')

          expect(page).to have_selector('.atwho-view')
        end

        it 'shows the error message' 


        it 'updates a page' 


        it 'cancels edititng of a page' 

      end

      context 'in a group namespace' do
        let(:project) { create(:project, :wiki_repo, namespace: create(:group, :public)) }

        it 'updates a page' 

      end
    end

    context 'when the page is in a subdir' do
      let!(:project) { create(:project, :wiki_repo, namespace: user.namespace) }
      let(:project_wiki) { create(:project_wiki, project: project, user: project.creator) }
      let(:page_name) { 'page_name' }
      let(:page_dir) { "foo/bar/#{page_name}" }
      let!(:wiki_page) { create(:wiki_page, wiki: project_wiki, attrs: { title: page_dir, content: 'Home page' }) }

      before do
        visit(project_wiki_edit_path(project, wiki_page))
      end

      it 'moves the page to the root folder', :skip_gitaly_mock do
        fill_in(:wiki_title, with: "/#{page_name}")

        click_button('Save changes')

        expect(current_path).to eq(project_wiki_path(project, page_name))
      end

      it 'moves the page to other dir' 


      it 'remains in the same place if title has not changed' 


      it 'can be moved to a different dir with a different name' 


      it 'can be renamed and moved to the root folder' 


      it 'squishes the title before creating the page' 

    end
  end

  context 'when Gitaly is enabled' do
    it_behaves_like 'wiki page user update'
  end

  context 'when Gitaly is disabled', :skip_gitaly_mock do
    it_behaves_like 'wiki page user update'
  end
end

