require 'spec_helper'

describe Projects::CreateFromTemplateService do
  let(:user) { create(:user) }
  let(:template_name) { 'rails' }
  let(:project_params) do
    {
        path: user.to_param,
        template_name: template_name,
        description: 'project description',
        visibility_level: Gitlab::VisibilityLevel::PUBLIC
    }
  end

  subject { described_class.new(user, project_params) }

  it 'calls the importer service' 


  it 'returns the project thats created' 


  context 'when template is not present' do
    let(:template_name) { 'non_existent' }
    let(:project) { subject.execute }

    before do
      expect(project).to be_saved
    end

    it 'does not set import set import type' 


    it 'does not set import set import source' 


    it 'is not scheduled' 


    it 'repository is empty' 

  end

  context 'the result project' do
    before do
      perform_enqueued_jobs do
        @project = subject.execute
      end

      @project.reload
    end

    it 'overrides template description' 


    it 'overrides template visibility_level' 

  end
end

