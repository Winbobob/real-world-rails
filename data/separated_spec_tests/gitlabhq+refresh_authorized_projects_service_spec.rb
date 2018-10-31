require 'spec_helper'

describe Users::RefreshAuthorizedProjectsService do
  include ExclusiveLeaseHelpers

  # We're using let! here so that any expectations for the service class are not
  # triggered twice.
  let!(:project) { create(:project) }

  let(:user) { project.namespace.owner }
  let(:service) { described_class.new(user) }

  describe '#execute', :clean_gitlab_redis_shared_state do
    it 'refreshes the authorizations using a lease' 

  end

  describe '#execute_without_lease' do
    before do
      user.project_authorizations.delete_all
    end

    it 'updates the authorized projects of the user' 


    it 'sets the access level of a project to the highest available level' 


    it 'returns a User' 

  end

  describe '#update_authorizations' do
    context 'when there are no rows to add and remove' do
      it 'does not change authorizations' 

    end

    it 'removes authorizations that should be removed' 


    it 'inserts authorizations that should be added' 

  end

  describe '#fresh_access_levels_per_project' do
    let(:hash) { service.fresh_access_levels_per_project }

    it 'returns a Hash' 


    it 'sets the keys to the project IDs' 


    it 'sets the values to the access levels' 


    context 'personal projects' do
      it 'includes the project with the right access level' 

    end

    context 'projects the user is a member of' do
      let!(:other_project) { create(:project) }

      before do
        other_project.team.add_reporter(user)
      end

      it 'includes the project with the right access level' 

    end

    context 'projects of groups the user is a member of' do
      let(:group) { create(:group) }
      let!(:other_project) { create(:project, group: group) }

      before do
        group.add_owner(user)
      end

      it 'includes the project with the right access level' 

    end

    context 'projects of subgroups of groups the user is a member of', :nested_groups do
      let(:group) { create(:group) }
      let(:nested_group) { create(:group, parent: group) }
      let!(:other_project) { create(:project, group: nested_group) }

      before do
        group.add_maintainer(user)
      end

      it 'includes the project with the right access level' 

    end

    context 'projects shared with groups the user is a member of' do
      let(:group) { create(:group) }
      let(:other_project) { create(:project) }
      let!(:project_group_link) { create(:project_group_link, project: other_project, group: group, group_access: Gitlab::Access::GUEST) }

      before do
        group.add_maintainer(user)
      end

      it 'includes the project with the right access level' 

    end

    context 'projects shared with subgroups of groups the user is a member of', :nested_groups do
      let(:group) { create(:group) }
      let(:nested_group) { create(:group, parent: group) }
      let(:other_project) { create(:project) }
      let!(:project_group_link) { create(:project_group_link, project: other_project, group: nested_group, group_access: Gitlab::Access::DEVELOPER) }

      before do
        group.add_maintainer(user)
      end

      it 'includes the project with the right access level' 

    end
  end

  describe '#current_authorizations_per_project' do
    let(:hash) { service.current_authorizations_per_project }

    it 'returns a Hash' 


    it 'sets the keys to the project IDs' 


    it 'sets the values to the project authorization rows' 

  end

  describe '#current_authorizations' do
    context 'without authorizations' do
      it 'returns an empty list' 

    end

    context 'with an authorization' do
      let(:row) { service.current_authorizations.take }

      it 'returns the currently authorized projects' 


      it 'includes the project ID for every row' 


      it 'includes the access level for every row' 

    end
  end

  describe '#fresh_authorizations' do
    it 'returns the new authorized projects' 


    it 'returns the highest access level' 


    context 'every returned row' do
      let(:row) { service.fresh_authorizations.take }

      it 'includes the project ID' 


      it 'includes the access level' 

    end
  end
end

