require 'spec_helper'

describe Projects::EnableDeployKeyService do
  let(:deploy_key)  { create(:deploy_key, public: true) }
  let(:project)     { create(:project) }
  let(:user)        { project.creator}
  let!(:params)     { { key_id: deploy_key.id } }

  it 'enables the key' 


  context 'trying to add an unaccessable key' do
    let(:another_key) { create(:another_key) }
    let!(:params)     { { key_id: another_key.id } }

    it 'returns nil if the key cannot be added' 

  end

  context 'add the same key twice' do
    before do
      project.deploy_keys << deploy_key
    end

    it 'returns existing key' 

  end

  def service
    Projects::EnableDeployKeyService.new(project, user, params)
  end
end

