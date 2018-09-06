require 'spec_helper'

describe Projects::Settings::DeployKeysPresenter do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:deploy_key)  { create(:deploy_key, public: true) }

  let!(:deploy_keys_project) do
    create(:deploy_keys_project, project: project, deploy_key: deploy_key)
  end

  subject(:presenter) do
    described_class.new(project, current_user: user)
  end

  it 'inherits from Gitlab::View::Presenter::Simple' 


  describe '#enabled_keys' do
    it 'returns currently enabled keys' 


    it 'does not contain enabled_keys inside available_keys' 


    it 'returns the enabled_keys size' 


    it 'returns true if there is any enabled_keys' 

  end

  describe '#available_keys/#available_project_keys' do
    let(:other_deploy_key) { create(:another_deploy_key) }

    before do
      project_key = create(:deploy_keys_project, deploy_key: other_deploy_key)
      project_key.project.add_developer(user)
    end

    it 'returns the current available_keys' 


    it 'returns the current available_project_keys' 


    it 'returns the available_project_keys size' 


    it 'shows if there is an available key' 

  end
end

