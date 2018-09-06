require 'spec_helper'

describe 'Projects > Files > Project owner creates a license file', :js do
  let(:project) { create(:project, :repository) }
  let(:project_master) { project.owner }

  before do
    project.repository.delete_file(project_master, 'LICENSE',
      message: 'Remove LICENSE', branch_name: 'master')
    sign_in(project_master)
    visit project_path(project)
  end

  it 'project master creates a license file manually from a template' 


  it 'project master creates a license file from the "Add license" link' 


  def select_template(template)
    page.within('.js-license-selector-wrap') do
      click_button 'Apply a license template'
      click_link template
      wait_for_requests
    end
  end
end

