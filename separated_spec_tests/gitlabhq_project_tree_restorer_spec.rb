require 'spec_helper'
include ImportExport::CommonUtil

describe Gitlab::ImportExport::ProjectTreeRestorer do
  describe 'restore project tree' do
    before(:context) do
      # Using an admin for import, so we can check assignment of existing members
      @user = create(:admin)
      @existing_members = [
        create(:user, username: 'bernard_willms'),
        create(:user, username: 'saul_will')
      ]

      RSpec::Mocks.with_temporary_scope do
        @project = create(:project, :builds_disabled, :issues_disabled, name: 'project', path: 'project')
        @shared = @project.import_export_shared
        allow(@shared).to receive(:export_path).and_return('spec/lib/gitlab/import_export/')

        allow_any_instance_of(Repository).to receive(:fetch_ref).and_return(true)
        allow_any_instance_of(Gitlab::Git::Repository).to receive(:branch_exists?).and_return(false)

        expect_any_instance_of(Gitlab::Git::Repository).to receive(:create_branch).with('feature', 'DCBA')
        allow_any_instance_of(Gitlab::Git::Repository).to receive(:create_branch)

        project_tree_restorer = described_class.new(user: @user, shared: @shared, project: @project)
        @restored_project_json = project_tree_restorer.restore
      end
    end

    context 'JSON' do
      it 'restores models based on JSON' 


      it 'restore correct project features' 


      it 'has the project description' 


      it 'has the same label associated to two issues' 


      it 'has milestones associated to two separate issues' 


      it 'creates a valid pipeline note' 


      it 'restores pipelines with missing ref' 


      it 'preserves updated_at on issues' 


      it 'has multiple issue assignees' 


      it 'contains the merge access levels on a protected branch' 


      it 'contains the push access levels on a protected branch' 


      it 'contains the create access levels on a protected tag' 


      context 'event at forth level of the tree' do
        let(:event) { Event.where(action: 6).first }

        it 'restores the event' 


        it 'has the action' 


        it 'event belongs to note, belongs to merge request, belongs to a project' 

      end

      it 'has the correct data for merge request diff files' 


      it 'has the correct data for merge request diff commits' 


      it 'has the correct data for merge request latest_merge_request_diff' 


      it 'has labels associated to label links, associated to issues' 


      it 'has project labels' 


      it 'has no group labels' 


      it 'has a project feature' 


      it 'has custom attributes' 


      it 'has badges' 


      it 'restores the correct service' 


      context 'Merge requests' do
        it 'always has the new project as a target' 


        it 'has the same source project as originally if source/target are the same' 


        it 'has the new project as target if source/target differ' 


        it 'has no source if source/target differ' 

      end

      context 'tokens are regenerated' do
        it 'has a new CI trigger token' 


        it 'has a new CI build token' 

      end

      context 'has restored the correct number of records' do
        it 'has the correct number of merge requests' 


        it 'has the correct number of triggers' 


        it 'has the correct number of pipelines and statuses' 

      end

      context 'when restoring hierarchy of pipeline, stages and jobs' do
        it 'restores pipelines' 


        it 'restores pipeline stages' 


        it 'correctly restores association between stage and a pipeline' 


        it 'restores statuses' 


        it 'correctly restores association between a stage and a job' 


        it 'correctly restores association between a pipeline and a job' 

      end
    end
  end

  shared_examples 'restores project successfully' do
    it 'correctly restores project' 

  end

  shared_examples 'restores project correctly' do |**results|
    it 'has labels' 


    it 'has label priorities' 


    it 'has milestones' 


    it 'has issues' 


    it 'has issue with group label and project label' 

  end

  shared_examples 'restores group correctly' do |**results|
    it 'has group label' 


    it 'has group milestone' 


    it 'has issue with group label' 

  end

  context 'Light JSON' do
    let(:user) { create(:user) }
    let(:shared) { project.import_export_shared }
    let!(:project) { create(:project, :builds_disabled, :issues_disabled, name: 'project', path: 'project') }
    let(:project_tree_restorer) { described_class.new(user: user, shared: shared, project: project) }
    let(:restored_project_json) { project_tree_restorer.restore }

    before do
      allow(shared).to receive(:export_path).and_return('spec/lib/gitlab/import_export/')
    end

    context 'with a simple project' do
      before do
        project_tree_restorer.instance_variable_set(:@path, "spec/lib/gitlab/import_export/project.light.json")

        restored_project_json
      end

      it_behaves_like 'restores project correctly',
                      issues: 1,
                      labels: 1,
                      milestones: 1,
                      first_issue_labels: 1

      context 'project.json file access check' do
        it 'does not read a symlink' 

      end

      context 'when there is an existing build with build token' do
        before do
          create(:ci_build, token: 'abcd')
        end

        it_behaves_like 'restores project successfully'
      end
    end

    context 'when the project has overriden params in import data' do
      it 'overwrites the params stored in the JSON' 


      it 'does not allow setting params that are excluded from import_export settings' 

    end

    context 'with a project that has a group' do
      let!(:project) do
        create(:project,
               :builds_disabled,
               :issues_disabled,
               name: 'project',
               path: 'project',
               group: create(:group))
      end

      before do
        project_tree_restorer.instance_variable_set(:@path, "spec/lib/gitlab/import_export/project.group.json")

        restored_project_json
      end

      it_behaves_like 'restores project successfully'
      it_behaves_like 'restores project correctly',
                      issues: 2,
                      labels: 1,
                      milestones: 1,
                      first_issue_labels: 1

      it_behaves_like 'restores group correctly',
                      labels: 1,
                      milestones: 1,
                      first_issue_labels: 1
    end
  end
end

