require('spec_helper')

describe Projects::Settings::CiCdController do
  set(:user) { create(:user) }
  set(:project_auto_devops) { create(:project_auto_devops) }
  let(:project) { project_auto_devops.project }

  before do
    project.add_maintainer(user)
    sign_in(user)
  end

  describe 'GET show' do
    it 'renders show with 200 status code' 


    context 'with group runners' do
      let(:parent_group) { create(:group) }
      let(:group) { create(:group, parent: parent_group) }
      let(:group_runner) { create(:ci_runner, :group, groups: [group]) }
      let(:other_project) { create(:project, group: group) }
      let!(:project_runner) { create(:ci_runner, :project, projects: [other_project]) }
      let!(:shared_runner) { create(:ci_runner, :instance) }

      it 'sets assignable project runners only' 

    end
  end

  describe '#reset_cache' do
    before do
      sign_in(user)

      project.add_maintainer(user)

      allow(ResetProjectCacheService).to receive_message_chain(:new, :execute).and_return(true)
    end

    subject { post :reset_cache, namespace_id: project.namespace, project_id: project, format: :json }

    it 'calls reset project cache service' 


    context 'when service returns successfully' do
      it 'returns a success header' 

    end

    context 'when service does not return successfully' do
      before do
        allow(ResetProjectCacheService).to receive_message_chain(:new, :execute).and_return(false)
      end

      it 'returns an error header' 

    end
  end

  describe 'PUT #reset_registration_token' do
    subject { put :reset_registration_token, namespace_id: project.namespace, project_id: project }
    it 'resets runner registration token' 


    it 'redirects the user to admin runners page' 

  end

  describe 'PATCH update' do
    let(:params) { { ci_config_path: '' } }

    subject do
      patch :update,
            namespace_id: project.namespace.to_param,
            project_id: project,
            project: params
    end

    it 'redirects to the settings page' 


    context 'when updating the auto_devops settings' do
      let(:params) { { auto_devops_attributes: { enabled: '', domain: 'mepmep.md' } } }

      context 'following the instance default' do
        let(:params) { { auto_devops_attributes: { enabled: '' } } }

        it 'allows enabled to be set to nil' 

      end

      context 'when run_auto_devops_pipeline is true' do
        before do
          expect_any_instance_of(Projects::UpdateService).to receive(:run_auto_devops_pipeline?).and_return(true)
        end

        context 'when the project repository is empty' do
          it 'sets a warning flash' 


          it 'does not queue a CreatePipelineWorker' 

        end

        context 'when the project repository is not empty' do
          let(:project) { create(:project, :repository) }

          it 'sets a success flash' 


          it 'queues a CreatePipelineWorker' 

        end
      end

      context 'when run_auto_devops_pipeline is not true' do
        before do
          expect_any_instance_of(Projects::UpdateService).to receive(:run_auto_devops_pipeline?).and_return(false)
        end

        it 'does not queue a CreatePipelineWorker' 

      end
    end

    context 'when updating general settings' do
      context 'when build_timeout_human_readable is not specified' do
        let(:params) { { build_timeout_human_readable: '' } }

        it 'set default timeout' 

      end

      context 'when build_timeout_human_readable is specified' do
        let(:params) { { build_timeout_human_readable: '1h 30m' } }

        it 'set specified timeout' 

      end
    end
  end
end

