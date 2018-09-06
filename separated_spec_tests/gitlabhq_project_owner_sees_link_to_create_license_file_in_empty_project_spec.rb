require 'spec_helper'

describe 'Projects > Files > Project owner sees a link to create a license file in empty project', :js do
  let(:project) { create(:project_empty_repo) }
  let(:project_master) { project.owner }

  before do
    sign_in(project_master)
  end

  it 'project master creates a license file from a template' 


  def select_template(template)
    page.within('.js-license-selector-wrap') do
      click_button 'Apply a license template'
      click_link template
      wait_for_requests
    end
  end
end

