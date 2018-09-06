require 'rails_helper'

describe 'Projects > Snippets > Create Snippet', :js do
  include DropzoneHelper

  let(:user) { create(:user) }
  let(:project) { create(:project, :public) }

  def fill_form
    fill_in 'project_snippet_title', with: 'My Snippet Title'
    fill_in 'project_snippet_description', with: 'My Snippet **Description**'
    page.within('.file-editor') do
      find('.ace_text-input', visible: false).send_keys('Hello World!')
    end
  end

  context 'when a user is authenticated' do
    before do
      project.add_master(user)
      sign_in(user)

      visit project_snippets_path(project)

      click_on('New snippet')
    end

    it 'creates a new snippet' 


    it 'uploads a file when dragging into textarea' 


    it 'creates a snippet when all reuiqred fields are filled in after validation failing' 

  end

  context 'when a user is not authenticated' do
    it 'shows a public snippet on the index page but not the New snippet button' 

  end
end

