require 'spec_helper'

describe Projects::ForkService do
  include ProjectForksHelper
  let(:gitlab_shell) { Gitlab::Shell.new }
  context 'when forking a new project' do
    describe 'fork by user' do
      before do
        @from_user = create(:user)
        @from_namespace = @from_user.namespace
        avatar = fixture_file_upload("spec/fixtures/dk.png", "image/png")
        @from_project = create(:project,
                               :repository,
                               creator_id: @from_user.id,
                               namespace: @from_namespace,
                               star_count: 107,
                               avatar: avatar,
                               description: 'wow such project')
        @to_user = create(:user)
        @to_namespace = @to_user.namespace
        @from_project.add_user(@to_user, :developer)
      end

      context 'fork project' do
        context 'when forker is a guest' do
          before do
            @guest = create(:user)
            @from_project.add_user(@guest, :guest)
          end
          subject { fork_project(@from_project, @guest) }

          it { is_expected.not_to be_persisted }
          it { expect(subject.errors[:forked_from_project_id]).to eq(['is forbidden']) }

          it 'does not create a fork network' 

        end

        describe "successfully creates project in the user namespace" do
          let(:to_project) { fork_project(@from_project, @to_user, namespace: @to_user.namespace) }

          it { expect(to_project).to be_persisted }
          it { expect(to_project.errors).to be_empty }
          it { expect(to_project.owner).to eq(@to_user) }
          it { expect(to_project.namespace).to eq(@to_user.namespace) }
          it { expect(to_project.star_count).to be_zero }
          it { expect(to_project.description).to eq(@from_project.description) }
          it { expect(to_project.avatar.file).to be_exists }

          # This test is here because we had a bug where the from-project lost its
          # avatar after being forked.
          # https://gitlab.com/gitlab-org/gitlab-ce/issues/26158
          it "after forking the from-project still has its avatar" 


          it 'flushes the forks count cache of the source project' 


          it 'creates a fork network with the new project and the root project set' 


          it 'imports the repository of the forked project' 

        end

        context 'creating a fork of a fork' do
          let(:from_forked_project) { fork_project(@from_project, @to_user) }
          let(:other_namespace) do
            group = create(:group)
            group.add_owner(@to_user)
            group
          end
          let(:to_project) { fork_project(from_forked_project, @to_user, namespace: other_namespace) }

          it 'sets the root of the network to the root project' 


          it 'sets the forked_from_project on the membership' 

        end
      end

      context 'project already exists' do
        it "fails due to validation, not transaction failure" 

      end

      context 'repository already exists' do
        let(:repository_storage) { 'default' }
        let(:repository_storage_path) { Gitlab.config.repositories.storages[repository_storage].legacy_disk_path }

        before do
          gitlab_shell.create_repository(repository_storage, "#{@to_user.namespace.full_path}/#{@from_project.path}")
        end

        after do
          gitlab_shell.remove_repository(repository_storage, "#{@to_user.namespace.full_path}/#{@from_project.path}")
        end

        it 'does not allow creation' 

      end

      context 'GitLab CI is enabled' do
        it "forks and enables CI for fork" 

      end

      context "when project has restricted visibility level" do
        context "and only one visibility level is restricted" do
          before do
            @from_project.update(visibility_level: Gitlab::VisibilityLevel::INTERNAL)
            stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::INTERNAL])
          end

          it "creates fork with lowest level" 

        end

        context "and all visibility levels are restricted" do
          before do
            stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::PUBLIC, Gitlab::VisibilityLevel::INTERNAL, Gitlab::VisibilityLevel::PRIVATE])
          end

          it "creates fork with private visibility levels" 

        end
      end
    end

    describe 'fork to namespace' do
      before do
        @group_owner = create(:user)
        @developer   = create(:user)
        @project     = create(:project, :repository,
                              creator_id: @group_owner.id,
                              star_count: 777,
                              description: 'Wow, such a cool project!')
        @group = create(:group)
        @group.add_user(@group_owner, GroupMember::OWNER)
        @group.add_user(@developer,   GroupMember::DEVELOPER)
        @project.add_user(@developer,   :developer)
        @project.add_user(@group_owner, :developer)
        @opts = { namespace: @group }
      end

      context 'fork project for group' do
        it 'group owner successfully forks project into the group' 

      end

      context 'fork project for group when user not owner' do
        it 'group developer fails to fork project into the group' 

      end

      context 'project already exists in group' do
        it 'fails due to validation, not transaction failure' 

      end

      context 'when the namespace has a lower visibility level than the project' do
        it 'creates the project with the lower visibility level' 

      end
    end
  end

  context 'when linking fork to an existing project' do
    let(:fork_from_project) { create(:project, :public) }
    let(:fork_to_project) { create(:project, :public) }
    let(:user) { create(:user) }

    subject { described_class.new(fork_from_project, user) }

    def forked_from_project(project)
      project.fork_network_member&.forked_from_project
    end

    context 'if project is already forked' do
      it 'does not create fork relation' 

    end

    context 'if project is not forked' do
      it 'creates fork relation' 


      it 'flushes the forks count cache of the source project' 


      it 'leaves no LFS objects dangling' 


      context 'if the fork is not allowed' do
        let(:fork_from_project) { create(:project, :private) }

        it 'does not delete the LFS objects' 

      end
    end
  end
end

