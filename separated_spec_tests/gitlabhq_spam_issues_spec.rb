require 'rails_helper'

describe 'New issue', :js do
  include StubENV

  let(:project) { create(:project, :public) }
  let(:user)    { create(:user)}

  before do
    stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')

    Gitlab::CurrentSettings.update!(
      akismet_enabled: true,
      akismet_api_key: 'testkey',
      recaptcha_enabled: true,
      recaptcha_site_key: 'test site key',
      recaptcha_private_key: 'test private key'
    )

    project.add_master(user)
    sign_in(user)
  end

  context 'when identified as a spam' do
    before do
      WebMock.stub_request(:any, /.*akismet.com.*/).to_return(body: "true", status: 200)

      visit new_project_issue_path(project)
    end

    it 'creates an issue after solving reCaptcha' 

  end

  context 'when not identified as a spam' do
    before do
      WebMock.stub_request(:any, /.*akismet.com.*/).to_return(body: 'false', status: 200)

      visit new_project_issue_path(project)
    end

    it 'creates an issue' 

  end
end

