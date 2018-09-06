require 'spec_helper'

describe 'User uses header search field' do
  include FilteredSearchHelpers

  let(:project) { create(:project) }
  let(:user) { create(:user) }

  before do
    project.add_reporter(user)
    sign_in(user)
  end

  context 'when user is in a global scope', :js do
    before do
      visit(root_path)
      page.find('#search').click
    end

    context 'when clicking issues' do
      it 'shows assigned issues' 


      it 'shows created issues' 

    end

    context 'when clicking merge requests' do
      let!(:merge_request) { create(:merge_request, source_project: project, author: user, assignee: user) }

      it 'shows assigned merge requests' 


      it 'shows created merge requests' 

    end
  end

  context 'when user is in a project scope' do
    before do
      visit(project_path(project))
    end

    it 'starts searching by pressing the enter key', :js do
      fill_in('search', with: 'gitlab')
      find('#search').native.send_keys(:enter)

      page.within('.breadcrumbs-sub-title') do
        expect(page).to have_content('Search')
      end
    end

    it 'contains location badge' 


    context 'when clicking the search field', :js do
      before do
        page.find('#search').click
      end

      it 'shows category search dropdown' 


      context 'when clicking issues' do
        let!(:issue) { create(:issue, project: project, author: user, assignees: [user]) }

        it 'shows assigned issues' 


        it 'shows created issues' 

      end

      context 'when clicking merge requests' do
        let!(:merge_request) { create(:merge_request, source_project: project, author: user, assignee: user) }

        it 'shows assigned merge requests' 


        it 'shows created merge requests' 

      end
    end

    context 'when entering text into the search field', :js do
      before do
        page.within('.search-input-wrap') do
          fill_in('search', with: project.name[0..3])
        end
      end

      it 'does not display the category search dropdown' 

    end
  end
end

