require 'spec_helper'

describe Projects::TransferService do
  include GitHelpers

  let(:gitlab_shell) { Gitlab::Shell.new }
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:project) { create(:project, :repository, :legacy_storage, namespace: user.namespace) }

  context 'namespace -> namespace' do
    before do
      allow_any_instance_of(Gitlab::UploadsTransfer)
        .to receive(:move_project).and_return(true)
      allow_any_instance_of(Gitlab::PagesTransfer)
        .to receive(:move_project).and_return(true)
      group.add_owner(user)
      @result = transfer_project(project, user, group)
    end

    it { expect(@result).to be_truthy }
    it { expect(project.namespace).to eq(group) }
  end

  context 'when transfer succeeds' do
    before do
      group.add_owner(user)
    end

    it 'sends notifications' 


    it 'invalidates the user\'s personal_project_count cache' 


    it 'executes system hooks' 


    it 'disk path has moved' 


    it 'updates project full path in .git/config' 

  end

  context 'when transfer fails' do
    let!(:original_path) { project_path(project) }

    def attempt_project_transfer(&block)
      expect do
        transfer_project(project, user, group, &block)
      end.to raise_error(ActiveRecord::ActiveRecordError)
    end

    before do
      group.add_owner(user)

      expect_any_instance_of(Labels::TransferService).to receive(:execute).and_raise(ActiveRecord::StatementInvalid, "PG ERROR")
    end

    def project_path(project)
      Gitlab::GitalyClient::StorageSettings.allow_disk_access do
        project.repository.path_to_repo
      end
    end

    def current_path
      project_path(project)
    end

    it 'rolls back repo location' 


    it 'rolls back project full path in .git/config' 


    it "doesn't send move notifications" 


    it "doesn't run system hooks" 

  end

  context 'namespace -> no namespace' do
    before do
      @result = transfer_project(project, user, nil)
    end

    it { expect(@result).to eq false }
    it { expect(project.namespace).to eq(user.namespace) }
    it { expect(project.errors.messages[:new_namespace].first).to eq 'Please select a new namespace for your project.' }
  end

  context 'disallow transfering of project with tags' do
    let(:container_repository) { create(:container_repository) }

    before do
      stub_container_registry_config(enabled: true)
      stub_container_registry_tags(repository: :any, tags: ['tag'])
      project.container_repositories << container_repository
    end

    subject { transfer_project(project, user, group) }

    it { is_expected.to be_falsey }
  end

  context 'namespace -> not allowed namespace' do
    before do
      @result = transfer_project(project, user, group)
    end

    it { expect(@result).to eq false }
    it { expect(project.namespace).to eq(user.namespace) }
  end

  context 'namespace which contains orphan repository with same projects path name' do
    let(:repository_storage) { 'default' }
    let(:repository_storage_path) { Gitlab.config.repositories.storages[repository_storage].legacy_disk_path }

    before do
      group.add_owner(user)

      unless gitlab_shell.create_repository(repository_storage, "#{group.full_path}/#{project.path}")
        raise 'failed to add repository'
      end

      @result = transfer_project(project, user, group)
    end

    after do
      gitlab_shell.remove_repository(repository_storage, "#{group.full_path}/#{project.path}")
    end

    it { expect(@result).to eq false }
    it { expect(project.namespace).to eq(user.namespace) }
    it { expect(project.errors[:new_namespace]).to include('Cannot move project') }
  end

  context 'target namespace containing the same project name' do
    before do
      group.add_owner(user)
      project.update(name: 'new_name')

      create(:project, name: 'new_name', group: group, path: 'other')

      @result = transfer_project(project, user, group)
    end

    it { expect(@result).to eq false }
    it { expect(project.namespace).to eq(user.namespace) }
    it { expect(project.errors[:new_namespace]).to include('Project with same name or path in target namespace already exists') }
  end

  context 'target namespace containing the same project path' do
    before do
      group.add_owner(user)

      create(:project, name: 'other-name', path: project.path, group: group)

      @result = transfer_project(project, user, group)
    end

    it { expect(@result).to eq false }
    it { expect(project.namespace).to eq(user.namespace) }
    it { expect(project.errors[:new_namespace]).to include('Project with same name or path in target namespace already exists') }
  end

  def transfer_project(project, user, new_namespace)
    service = Projects::TransferService.new(project, user)

    yield(service) if block_given?

    service.execute(new_namespace)
  end

  context 'visibility level' do
    let(:internal_group) { create(:group, :internal) }

    before do
      internal_group.add_owner(user)
    end

    context 'when namespace visibility level < project visibility level' do
      let(:public_project) { create(:project, :public, :repository, namespace: user.namespace) }

      before do
        transfer_project(public_project, user, internal_group)
      end

      it { expect(public_project.visibility_level).to eq(internal_group.visibility_level) }
    end

    context 'when namespace visibility level > project visibility level' do
      let(:private_project) { create(:project, :private, :repository, namespace: user.namespace) }

      before do
        transfer_project(private_project, user, internal_group)
      end

      it { expect(private_project.visibility_level).to eq(Gitlab::VisibilityLevel::PRIVATE) }
    end
  end

  context 'missing group labels applied to issues or merge requests' do
    it 'delegates tranfer to Labels::TransferService' 

  end

  context 'when hashed storage in use' do
    let(:hashed_project) { create(:project, :repository, namespace: user.namespace) }

    before do
      group.add_owner(user)
    end

    it 'does not move the directory' 

  end

  describe 'refreshing project authorizations' do
    let(:group) { create(:group) }
    let(:owner) { project.namespace.owner }
    let(:group_member) { create(:user) }

    before do
      group.add_user(owner, GroupMember::MAINTAINER)
      group.add_user(group_member, GroupMember::DEVELOPER)
    end

    it 'refreshes the permissions of the old and new namespace' 


    it 'only schedules a single job for every user' 

  end

  def rugged_config
    rugged_repo(project.repository).config
  end
end

