require 'spec_helper'

describe UserProjectsRepository do
  subject { described_class.new(user, user_memberships_repository, projects_repository) }
  let(:user_memberships_repository) { UserMembershipsRepository.new(user) }
  let(:projects_repository) { ProjectsRepository.new }
  let!(:user) { create(:user) }

  describe '#potential' do
    let!(:potential_project) { create(:project, potential: true) }
    let!(:potential_membership) { create(:membership, user: user, project: potential_project) }
    let!(:not_potential_membership) { create(:membership, user: user) }

    it 'returns potential projects that the user has memberships in' 

  end

  describe '#next' do
    let!(:next_project) { create(:project, archived: false, potential: false) }
    let!(:next_membership) do
      create(:membership,
        user: user, starts_at: Time.local(2014, 12, 30), ends_at: Time.local(2015, 1, 30),
        project: next_project)
    end
    let!(:not_next_membership) { create(:membership, user: user, starts_at: Time.local(2014, 10, 10)) }

    before { Timecop.freeze(2014, 12, 1) }

    it 'returns next projects that the user has memberships in' 

  end

  describe '#current' do
    let!(:current_project) { create(:project, archived: false, potential: false) }
    let!(:current_membership) do
      create(:membership,
        user: user, starts_at: Time.local(2014, 11, 30), ends_at: Time.local(2014, 12, 29),
        project: current_project)
    end
    let!(:not_current_membership) { create(:membership) }

    before { Timecop.freeze(2014, 12, 1) }

    it 'returns current proects that the user has memberships in' 

  end

  describe '#items' do
    let!(:membership) { create(:membership) }

    it 'returns ProjectSearch results' 

  end
end

