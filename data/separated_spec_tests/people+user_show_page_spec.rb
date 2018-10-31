require 'spec_helper'

describe UserShowPage do
  let(:user) { create(:developer_in_project) }
  let(:active_project) { create(:project) }
  let(:booked_project) { create(:project, end_at: nil) }
  let(:archived_project) { create(:project, :archived) }
  let!(:active_membership) do
    create(:membership, user: user, project: active_project, role: user.roles.first)
  end
  let!(:archived_membership) do
    create(
      :membership,
      user: user,
      project: archived_project,
      role: user.roles.first,
      project_archived: true
    )
  end
  let!(:booked_membership) do
    create(
      :membership,
      :booked,
      user: user,
      project: booked_project,
      role: user.roles.first,
      starts_at: Time.current + 12.months,
      ends_at: nil
    )
  end

  describe '#user_all_memberships' do
    let(:instance) do
      described_class.new(user: user, projects_repository: nil, user_projects_repository: nil)
    end

    it 'returns all memberships of the user' 

  end

  describe '#user_active_memberships' do
    let(:instance) do
      described_class.new(user: user, projects_repository: nil, user_projects_repository: nil)
    end

    it 'returns collection of memberships with active projects' 

  end

  describe '#user_archived_memberships' do
    let(:instance) do
      described_class.new(user: user, projects_repository: nil, user_projects_repository: nil)
    end

    it 'returns collection of memberships with archived projects' 

  end

  describe '#user_booked_memberships' do
    let(:instance) do
      described_class.new(user: user, projects_repository: nil, user_projects_repository: nil)
    end

    it 'returns collection of memberships with booked projects' 

  end
end

