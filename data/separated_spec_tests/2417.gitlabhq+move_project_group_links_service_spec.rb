require 'spec_helper'

describe Projects::MoveProjectGroupLinksService do
  let!(:user) { create(:user) }
  let(:project_with_groups) { create(:project, namespace: user.namespace) }
  let(:target_project) { create(:project, namespace: user.namespace) }
  let(:maintainer_group) { create(:group) }
  let(:reporter_group) { create(:group) }
  let(:developer_group) { create(:group) }

  subject { described_class.new(target_project, user) }

  describe '#execute' do
    before do
      project_with_groups.project_group_links.create(group: maintainer_group, group_access: Gitlab::Access::MAINTAINER)
      project_with_groups.project_group_links.create(group: developer_group, group_access: Gitlab::Access::DEVELOPER)
      project_with_groups.project_group_links.create(group: reporter_group, group_access: Gitlab::Access::REPORTER)
    end

    it 'moves the group links from one project to another' 


    it 'does not move existent group links in the current project' 


    it 'rollbacks changes if transaction fails' 


    context 'when remove_remaining_elements is false' do
      let(:options) { { remove_remaining_elements: false } }

      it 'does not remove remaining project group links' 

    end
  end
end

