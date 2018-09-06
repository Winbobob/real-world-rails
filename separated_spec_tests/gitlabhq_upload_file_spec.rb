require 'spec_helper'

feature 'Multi-file editor upload file', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project, :repository) }
  let(:txt_file) { File.join(Rails.root, 'spec', 'fixtures', 'doc_sample.txt') }
  let(:img_file) { File.join(Rails.root, 'spec', 'fixtures', 'dk.png') }

  before do
    project.add_master(user)
    sign_in(user)

    visit project_tree_path(project, :master)

    wait_for_requests

    click_link('Web IDE')

    wait_for_requests
  end

  after do
    set_cookie('new_repo', 'false')
  end

  it 'uploads text file' 

end

