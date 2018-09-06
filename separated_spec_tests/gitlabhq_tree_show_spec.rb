require 'spec_helper'

feature 'Projects tree' do
  let(:user) { create(:user) }
  let(:project) { create(:project, :repository) }

  before do
    project.add_master(user)
    sign_in(user)

    visit project_tree_path(project, 'master')
  end

  it 'renders tree table' 


  context 'LFS' do
    before do
      visit project_tree_path(project, File.join('master', 'files/lfs'))
    end

    it 'renders LFS badge on blob item' 

  end

  context 'web IDE', :js do
    before do
      visit project_tree_path(project, File.join('master', 'bar'))

      click_link 'Web IDE'

      find('.ide-file-list')
    end

    it 'opens folder in IDE' 

  end
end

