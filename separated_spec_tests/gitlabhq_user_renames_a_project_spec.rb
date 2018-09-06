require 'spec_helper'

describe 'Projects > Settings > User renames a project' do
  let(:user) { create(:user) }
  let(:project) { create(:project, namespace: user.namespace, path: 'gitlab', name: 'sample') }

  before do
    sign_in(user)
    visit edit_project_path(project)
  end

  def rename_project(project, name: nil, path: nil)
    fill_in('project_name', with: name) if name
    fill_in('Path', with: path) if path
    click_button('Rename project')
    wait_for_edit_project_page_reload
    project.reload
  end

  def wait_for_edit_project_page_reload
    expect(find('.project-edit-container')).to have_content('Rename repository')
  end

  context 'with invalid characters' do
    it 'shows errors for invalid project path/name' 

  end

  it 'shows a successful notice when the project is updated' 


  context 'when changing project name' do
    it 'renames the repository' 


    context 'with emojis' do
      it 'shows error for invalid project name' 

    end
  end

  context 'when changing project path' do
    let(:project) { create(:project, :repository, namespace: user.namespace, name: 'gitlabhq') }

    before(:context) do
      TestEnv.clean_test_path
    end

    after do
      TestEnv.clean_test_path
    end

    it 'the project is accessible via the new path' 


    it 'the project is accessible via a redirect from the old path' 


    context 'and a new project is added with the same path' do
      it 'overrides the redirect' 

    end
  end
end

