require 'spec_helper'

describe 'User activates HipChat' do
  let(:project) { create(:project) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(project_settings_integrations_path(project))

    click_link('HipChat')
  end

  context 'with standart settings' do
    it 'activates service' 

  end

  context 'with custom settings' do
    it 'activates service' 

  end
end

