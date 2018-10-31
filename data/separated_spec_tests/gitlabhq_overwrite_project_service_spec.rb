require 'spec_helper'

describe Projects::OverwriteProjectService do
  include ProjectForksHelper

  let(:user) { create(:user) }
  let(:project_from) { create(:project, namespace: user.namespace) }
  let(:project_to) { create(:project, namespace: user.namespace) }
  let!(:lvl1_forked_project_1) { fork_project(project_from, user) }
  let!(:lvl1_forked_project_2) { fork_project(project_from, user) }
  let!(:lvl2_forked_project_1_1) { fork_project(lvl1_forked_project_1, user) }
  let!(:lvl2_forked_project_1_2) { fork_project(lvl1_forked_project_1, user) }

  subject { described_class.new(project_to, user) }

  before do
    allow(project_to).to receive(:import_data).and_return(double(data: { 'original_path' => project_from.path }))
  end

  describe '#execute' do
    shared_examples 'overwrite actions' do
      it 'moves deploy keys' 


      it 'moves notification settings' 


      it 'moves users stars' 


      it 'moves project group links' 


      it 'moves memberships and authorizations' 


      context 'moves lfs objects relationships' do
        before do
          create_list(:lfs_objects_project, 3, project: project_from)
        end

        it do
          lfs_objects_count = project_from.lfs_objects.count

          subject.execute(project_from)

          expect(project_to.lfs_objects.count).to eq lfs_objects_count
        end
      end

      it 'removes the original project' 


      it 'renames the project' 

    end

    context 'when project does not have any relation' do
      it_behaves_like 'overwrite actions'
    end

    context 'when project with elements' do
      it_behaves_like 'overwrite actions' do
        let(:master_user) { create(:user) }
        let(:reporter_user) { create(:user) }
        let(:developer_user) { create(:user) }
        let(:master_group) { create(:group) }
        let(:reporter_group) { create(:group) }
        let(:developer_group) { create(:group) }

        before do
          create_list(:deploy_keys_project, 2, project: project_from)
          create_list(:notification_setting, 2, source: project_from)
          create_list(:users_star_project, 2, project: project_from)
          project_from.project_group_links.create(group: master_group, group_access: Gitlab::Access::MASTER)
          project_from.project_group_links.create(group: developer_group, group_access: Gitlab::Access::DEVELOPER)
          project_from.project_group_links.create(group: reporter_group, group_access: Gitlab::Access::REPORTER)
          project_from.add_master(master_user)
          project_from.add_developer(developer_user)
          project_from.add_reporter(reporter_user)
        end
      end
    end

    context 'forks' do
      context 'when moving a root forked project' do
        it 'moves the descendant forks' 


        it 'updates the fork network' 

      end
      context 'when moving a intermediate forked project' do
        let(:project_to) { create(:project, namespace: lvl1_forked_project_1.namespace) }

        it 'moves the descendant forks' 


        it 'moves the ascendant fork' 


        it 'does not update fork network' 

      end
    end

    context 'if an exception is raised' do
      it 'rollbacks changes' 


      it 'tries to restore the original project repositories' 

    end
  end
end

