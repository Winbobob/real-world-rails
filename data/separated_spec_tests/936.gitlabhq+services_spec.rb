require "spec_helper"

describe API::Services do
  set(:user) { create(:user) }
  set(:admin) { create(:admin) }
  set(:user2) { create(:user) }

  set(:project) do
    create(:project, creator_id: user.id, namespace: user.namespace)
  end

  Service.available_services_names.each do |service|
    describe "PUT /projects/:id/services/#{service.dasherize}" do
      include_context service

      it "updates #{service} settings" 


      it "returns if required fields missing" 

    end

    describe "DELETE /projects/:id/services/#{service.dasherize}" do
      include_context service

      before do
        initialize_service(service)
      end

      it "deletes #{service}" 

    end

    describe "GET /projects/:id/services/#{service.dasherize}" do
      include_context service

      # inject some properties into the service
      before do
        initialize_service(service)
      end

      it 'returns authentication error when unauthenticated' 


      it "returns all properties of service #{service} when authenticated as admin" 


      it "returns properties of service #{service} other than passwords when authenticated as project owner" 


      it "returns error when authenticated but not a project owner" 

    end
  end

  describe 'POST /projects/:id/services/:slug/trigger' do
    describe 'Mattermost Service' do
      let(:service_name) { 'mattermost_slash_commands' }

      context 'no service is available' do
        it 'returns a not found message' 

      end

      context 'the service exists' do
        let(:params) { { token: 'token' } }

        context 'the service is not active' do
          before do
            project.create_mattermost_slash_commands_service(
              active: false,
              properties: params
            )
          end

          it 'when the service is inactive' 

        end

        context 'the service is active' do
          before do
            project.create_mattermost_slash_commands_service(
              active: true,
              properties: params
            )
          end

          it 'returns status 200' 

        end

        context 'when the project can not be found' do
          it 'returns a generic 404' 

        end
      end
    end

    describe 'Slack Service' do
      let(:service_name) { 'slack_slash_commands' }

      before do
        project.create_slack_slash_commands_service(
          active: true,
          properties: { token: 'token' }
        )
      end

      it 'returns status 200' 

    end
  end

  describe 'Mattermost service' do
    let(:service_name) { 'mattermost' }
    let(:params) do
      { webhook: 'https://hook.example.com', username: 'username' }
    end

    before do
      project.create_mattermost_service(
        active: true,
        properties: params
      )
    end

    it 'accepts a username for update' 

  end
end

