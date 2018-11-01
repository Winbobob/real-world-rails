require 'spec_helper'

describe Projects::GroupLinksController do
  let(:group) { create(:group, :private) }
  let(:group2) { create(:group, :private) }
  let(:project) { create(:project, :private, group: group2) }
  let(:user) { create(:user) }

  before do
    project.add_maintainer(user)
    sign_in(user)
  end

  describe '#create' do
    shared_context 'link project to group' do
      before do
        post(:create, namespace_id: project.namespace,
                      project_id: project,
                      link_group_id: group.id,
                      link_group_access: ProjectGroupLink.default_access)
      end
    end

    context 'when project is not allowed to be shared with a group' do
      before do
        group.update(share_with_group_lock: false)
      end

      include_context 'link project to group'

      it 'responds with status 404' 

    end

    context 'when user has access to group he want to link project to' do
      before do
        group.add_developer(user)
      end

      include_context 'link project to group'

      it 'links project with selected group' 


      it 'redirects to project group links page' 

    end

    context 'when user doers not have access to group he want to link to' do
      include_context 'link project to group'

      it 'renders 404' 


      it 'does not share project with that group' 

    end

    context 'when project group id equal link group id' do
      before do
        post(:create, namespace_id: project.namespace,
                      project_id: project,
                      link_group_id: group2.id,
                      link_group_access: ProjectGroupLink.default_access)
      end

      it 'does not share project with selected group' 


      it 'redirects to project group links page' 

    end

    context 'when link group id is not present' do
      before do
        post(:create, namespace_id: project.namespace,
                      project_id: project,
                      link_group_access: ProjectGroupLink.default_access)
      end

      it 'redirects to project group links page' 

    end
  end
end

