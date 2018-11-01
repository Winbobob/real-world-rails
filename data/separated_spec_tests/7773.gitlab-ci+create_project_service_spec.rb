require 'spec_helper'

describe CreateProjectService do
  let(:service) { described_class.new }
  let(:current_user) { double.as_null_object }
  let(:project_dump) { YAML.load File.read(Rails.root.join('spec/support/gitlab_stubs/raw_project.yml')) }

  before { allow_any_instance_of(Network).to receive_messages(enable_ci: true) }

  describe '#execute' do
    context 'valid params' do
      let(:project) { service.execute(current_user, project_dump, 'http://localhost/projects/:project_id') }

      it { expect(project).to be_kind_of(Project) }
      it { expect(project).to be_persisted }
    end

    context 'without project dump' do
      it 'should raise exception' 

    end

    context "forking" do
      it "uses project as a template for settings and jobs" 

    end
  end
end

