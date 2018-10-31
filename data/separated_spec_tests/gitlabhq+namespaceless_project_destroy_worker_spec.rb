require 'spec_helper'

describe NamespacelessProjectDestroyWorker do
  include ProjectForksHelper

  subject { described_class.new }

  before do
    # Stub after_save callbacks that will fail when Project has no namespace
    allow_any_instance_of(Project).to receive(:ensure_storage_path_exists).and_return(nil)
    allow_any_instance_of(Project).to receive(:update_project_statistics).and_return(nil)
  end

  describe '#perform' do
    context 'project has namespace' do
      it 'does not do anything' 

    end

    context 'project has no namespace' do
      let!(:project) { create(:project) }

      before do
        allow_any_instance_of(Project).to receive(:namespace).and_return(nil)
      end

      context 'project not a fork of another project' do
        it "truncates the project's team" 


        it 'deletes the project' 


        it 'does not call unlink_fork' 


        it 'does not do anything in Project#remove_pages method' 

      end

      context 'project forked from another' do
        let!(:parent_project) { create(:project) }
        let(:project) do
          namespaceless_project = fork_project(parent_project)
          namespaceless_project.save
          namespaceless_project
        end

        it 'closes open merge requests' 


        it 'destroys fork network members' 

      end
    end

    context 'project has non-existing namespace' do
      let!(:project) do
        project = build(:project, namespace_id: Namespace.maximum(:id).to_i.succ)
        project.save(validate: false)
        project
      end

      it 'deletes the project' 

    end
  end
end

