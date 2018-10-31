require 'spec_helper'

describe DeploymentTargetMetadataRefreshesController do
  describe '#create' do
    subject { response }
    let(:format) { :html }
    let(:post_create) { post :create, deployment_target_id: '19', format: format }
    before { allow(DeploymentTargetMetadataRefresh).to receive(:create).and_call_original }

    context 'when refresh is successful' do
      before { post_create }

      it 'creates a DeploymentTargetMetadataRefresh with the expected DeploymentTarget' 


      context 'HTML format' do
        it 'sets a flash success message' 


        it { should redirect_to(deployment_targets_path) }
      end

      context 'JSON format' do
        let(:format) { :json }

        its(:status) { should eq(201) }

        it 'does not set a flash message' 


        describe 'the JSON response' do
          subject(:hash) { JSON.parse(response.body) }
          its(:keys) { should include('agent_version', 'adapter_type') }
        end
      end
    end

    context 'when refresh fails' do
      before do
        allow(DeploymentTargetMetadataRefresh).to receive(:create).and_raise(error)
        post_create
      end

      context 'due to ActiveResource::ServerError' do
        let(:error) { ActiveResource::ServerError.new('Troubles') }

        context 'HTML format' do
          it { should redirect_to(deployment_targets_path) }

          it 'sets a flash alert message' 

        end

        context 'JSON format' do
          let(:format) { :json }

          it 'does not set a flash message' 


          its(:status) { should eq(409) }
          its(:headers) { should include('Location' => deployment_targets_path) }

          describe 'the JSON response' do
            subject { JSON.parse(response.body) }
            its(['error']) { should eq(I18n.t('deployment_targets.metadata_refresh.failure')) }
          end
        end
      end
    end
  end
end

