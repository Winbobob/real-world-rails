require 'spec_helper'

describe 'User reverts a commit', :js do
  include RepoHelpers

  let(:project) { create(:project, :repository, namespace: user.namespace) }
  let(:user) { create(:user) }

  before do
    sign_in(user)

    visit(project_commit_path(project, sample_commit.id))
  end

  def click_revert
    find('.header-action-buttons .dropdown').click
    find('a[href="#modal-revert-commit"]').click
  end

  context 'without creating a new merge request' do
    before do
      click_revert
      page.within('#modal-revert-commit') do
        uncheck('create_merge_request')
        click_button('Revert')
      end
    end

    it 'reverts a commit' 


    it 'does not revert a previously reverted commit' 

  end

  context 'with creating a new merge request' do
    before do
      click_revert
    end

    it 'reverts a commit' 

  end

  context 'when the project is archived' do
    let(:project) { create(:project, :repository, :archived, namespace: user.namespace) }

    it 'does not show the revert link' 

  end
end

