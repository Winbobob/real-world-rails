require 'spec_helper'

describe 'projects/settings/ci_cd/_autodevops_form' do
  let(:project) { create(:project, :repository) }

  before do
    assign :project, project
  end

  context 'when kubernetes is not active' do
    context 'when auto devops domain is not defined' do
      it 'shows warning message' 

    end

    context 'when auto devops domain is defined' do
      before do
        project.build_auto_devops(domain: 'example.com')
      end

      it 'shows warning message' 

    end
  end

  context 'when kubernetes is active' do
    before do
      create(:kubernetes_service, project: project)
    end

    context 'when auto devops domain is not defined' do
      it 'shows warning message' 

    end

    context 'when auto devops domain is defined' do
      before do
        project.build_auto_devops(domain: 'example.com')
      end

      it 'does not show warning message' 

    end
  end
end
