require 'spec_helper'

describe DeployTokens::CreateService do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:deploy_token_params) { attributes_for(:deploy_token) }

  describe '#execute' do
    subject { described_class.new(project, user, deploy_token_params).execute }

    context 'when the deploy token is valid' do
      it 'should create a new DeployToken' 


      it 'should create a new ProjectDeployToken' 


      it 'returns a DeployToken' 

    end

    context 'when expires at date is not passed' do
      let(:deploy_token_params) { attributes_for(:deploy_token, expires_at: '') }

      it 'should set Forever.date' 

    end

    context 'when the deploy token is invalid' do
      let(:deploy_token_params) { attributes_for(:deploy_token, read_repository: false, read_registry: false) }

      it 'should not create a new DeployToken' 


      it 'should not create a new ProjectDeployToken' 

    end
  end
end

