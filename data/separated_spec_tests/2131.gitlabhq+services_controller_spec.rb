require 'spec_helper'

describe Projects::ServicesController do
  let(:project) { create(:project, :repository) }
  let(:user)    { create(:user) }
  let(:service) { create(:hipchat_service, project: project) }
  let(:hipchat_client) { { '#room' => double(send: true) } }
  let(:service_params) { { token: 'hipchat_token_p', room: '#room' } }

  before do
    sign_in(user)
    project.add_maintainer(user)
  end

  describe '#test' do
    context 'when can_test? returns false' do
      it 'renders 404' 

    end

    context 'when validations fail' do
      let(:service_params) { { active: 'true', token: '' } }

      it 'returns error messages in JSON response' 

    end

    context 'success' do
      context 'with empty project' do
        let(:project) { create(:project) }

        context 'with chat notification service' do
          let(:service) { project.create_microsoft_teams_service(webhook: 'http://webhook.com') }

          it 'returns success' 

        end

        it 'returns success' 

      end

      it 'returns success' 


      context 'when service is configured for the first time' do
        before do
          allow_any_instance_of(ServiceHook).to receive(:execute).and_return(true)
        end

        it 'persist the object' 


        it 'creates the ServiceHook object' 


        def do_put
          put :test, namespace_id: project.namespace,
                     project_id: project,
                     id: 'buildkite',
                     service: { 'active' => '1', 'push_events' => '1', token: 'token', 'project_url' => 'http://test.com' }
        end
      end
    end

    context 'failure' do
      it 'returns success status code and the error message' 

    end
  end

  describe 'PUT #update' do
    context 'when param `active` is set to true' do
      it 'activates the service and redirects to integrations paths' 

    end

    context 'when param `active` is set to false' do
      it 'does not  activate the service but saves the settings' 

    end

    context 'with a deprecated service' do
      let(:service) { create(:kubernetes_service, project: project) }

      before do
        put :update,
          namespace_id: project.namespace, project_id: project, id: service.to_param, service: { namespace: 'updated_namespace' }
      end

      it 'should not update the service' 

    end
  end

  describe "GET #edit" do
    before do
      get :edit, namespace_id: project.namespace, project_id: project, id: service_id
    end

    context 'with approved services' do
      let(:service_id) { 'jira' }

      it 'should render edit page' 

    end

    context 'with a deprecated service' do
      let(:service_id) { 'kubernetes' }

      it 'should render edit page' 

    end
  end
end

