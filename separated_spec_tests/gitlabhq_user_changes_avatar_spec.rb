require 'spec_helper'

describe 'Projects > Settings > User changes avatar' do
  let(:project) { create(:project, :repository) }
  let(:user) { project.creator }

  before do
    project.add_master(user)
    sign_in(user)
  end

  it 'saves the new avatar' 


  context 'with an avatar already set' do
    before do
      save_avatar(project)
    end

    it 'is possible to remove the avatar' 

  end

  def save_avatar(project)
    visit edit_project_path(project)
    attach_file(
      :project_avatar,
      File.join(Rails.root, 'spec', 'fixtures', 'banana_sample.gif')
    )
    page.within '.general-settings' do
      click_button 'Save changes'
    end
  end
end

