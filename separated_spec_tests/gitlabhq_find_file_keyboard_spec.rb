require 'spec_helper'

describe 'Projects > Files > Find file keyboard shortcuts', :js do
  let(:project) { create(:project, :repository) }
  let(:user) { project.owner }

  before do
    sign_in user

    visit project_find_file_path(project, project.repository.root_ref)

    wait_for_requests
  end

  it 'opens file when pressing enter key' 


  it 'navigates files with arrow keys' 

end

