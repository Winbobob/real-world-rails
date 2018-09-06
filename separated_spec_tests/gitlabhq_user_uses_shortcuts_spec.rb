require 'spec_helper'

describe 'User uses shortcuts', :js do
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(project_path(project))
  end

  context 'when navigating to the Project pages' do
    it 'redirects to the details page' 


    it 'redirects to the activity page' 

  end

  context 'when navigating to the Repository pages' do
    it 'redirects to the repository files page' 


    it 'redirects to the repository commits page' 


    it 'redirects to the repository graph page' 


    it 'redirects to the repository charts page' 

  end

  context 'when navigating to the Issues pages' do
    it 'redirects to the issues list page' 


    it 'redirects to the new issue page' 

  end

  context 'when navigating to the Merge Requests pages' do
    it 'redirects to the merge requests page' 

  end

  context 'when navigating to the Snippets pages' do
    it 'redirects to the snippets page' 

  end

  context 'when navigating to the Wiki pages' do
    it 'redirects to the wiki page' 

  end
end

