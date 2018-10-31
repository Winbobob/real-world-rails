require 'spec_helper'

describe Groups::SharedProjectsController do
  def get_shared_projects(params = {})
    get :index, params.reverse_merge(format: :json, group_id: group.full_path)
  end

  def share_project(project)
    Projects::GroupLinks::CreateService.new(
      project,
      user,
      link_group_access: ProjectGroupLink::DEVELOPER
    ).execute(group)
  end

  set(:group) { create(:group) }
  set(:user) { create(:user) }
  set(:shared_project) do
    shared_project = create(:project, namespace: user.namespace)
    share_project(shared_project)

    shared_project
  end

  let(:json_project_ids) { json_response.map { |project_info| project_info['id'] } }

  before do
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns only projects shared with the group' 


    it 'allows filtering shared projects' 


    it 'allows sorting projects' 


    it 'does not include archived projects' 

  end
end

