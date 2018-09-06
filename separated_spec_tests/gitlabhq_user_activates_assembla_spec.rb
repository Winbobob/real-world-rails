require 'spec_helper'

describe 'User activates Assembla' do
  let(:project) { create(:project) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(project_settings_integrations_path(project))

    click_link('Assembla')
  end

  it 'activates service' 

end

