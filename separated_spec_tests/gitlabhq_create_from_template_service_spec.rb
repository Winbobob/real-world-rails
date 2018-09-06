require 'spec_helper'

describe Projects::CreateFromTemplateService do
  let(:user) { create(:user) }
  let(:project_params) do
    {
        path: user.to_param,
        template_name: 'rails',
        description: 'project description',
        visibility_level: Gitlab::VisibilityLevel::PUBLIC
    }
  end

  subject { described_class.new(user, project_params) }

  it 'calls the importer service' 


  it 'returns the project thats created' 


  context 'the result project' do
    before do
      Sidekiq::Testing.inline! do
        @project = subject.execute
      end

      @project.reload
    end

    it 'overrides template description' 


    it 'overrides template visibility_level' 

  end
end

