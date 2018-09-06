require 'spec_helper'

describe 'User uses search filters', :js do
  let(:group) { create(:group) }
  let!(:group_project) { create(:project, group: group) }
  let(:project) { create(:project, namespace: user.namespace) }
  let(:user) { create(:user) }

  before do
    project.add_reporter(user)
    group.add_owner(user)
    sign_in(user)

    visit(search_path)
  end

  context' when filtering by group' do
    it 'shows group projects' 

  end

  context' when filtering by project' do
    it 'shows a project' 

  end
end

