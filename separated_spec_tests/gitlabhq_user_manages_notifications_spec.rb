require 'spec_helper'

describe 'Projects > Show > User manages notifications', :js do
  let(:project) { create(:project, :public, :repository) }

  before do
    sign_in(project.owner)
    visit project_path(project)
  end

  it 'changes the notification setting' 

end

