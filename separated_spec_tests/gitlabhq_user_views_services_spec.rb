require 'spec_helper'

describe 'User views services' do
  let(:project) { create(:project) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(project_settings_integrations_path(project))
  end

  it 'shows the list of available services' 

end

