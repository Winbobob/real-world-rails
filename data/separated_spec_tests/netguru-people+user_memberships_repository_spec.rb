require 'spec_helper'

describe UserMembershipsRepository do
  subject { UserMembershipsRepository.new(user) }
  let!(:user) { create(:user) }

  context 'potential' do
    let!(:potential_project) do
      create(:project, potential: true, starts_at: nil, end_at: nil)
    end
    let!(:not_potential_project) do
      create(:project, potential: false, starts_at: nil, end_at: nil)
    end
    let(:potential_membership) do
      create(:membership, project: potential_project, user: user)
    end
    let(:not_potential_membership) do
      create(:membership, project: not_potential_project, user: user)
    end

    before do
      potential_membership # lazy load
      not_potential_membership # lazy load
    end

    describe '#potential' do
      it 'returns potential memberships' 

    end

    describe '#not_potential' do
      it 'returns non-potential memberships' 

    end
  end

  context 'archived' do
    let!(:archived_project) { create(:project, archived: true) }
    let!(:not_archived_project) { create(:project, archived: false) }
    let(:archived_membership) { create(:membership, project: archived_project, user: user) }
    let(:not_archived_membership) do
      create(:membership, project: not_archived_project, user: user)
    end

    before do
      archived_membership # lazy load
      not_archived_membership # lazy load
    end

    describe '#archived' do
      it 'returns archived memberships' 

    end

    describe '#not_archived' do
      it 'returns non-archived memberships' 

    end
  end

  context 'booked' do
    let(:booked_membership) { create(:membership, user: user, booked: true) }
    let(:not_booked_membership) { create(:membership, user: user, booked: false) }

    before do
      booked_membership # lazy load
      not_booked_membership # lazy load
    end

    describe '#booked' do
      it 'returns booked memberships' 

    end

    describe '#not_booked' do
      it 'returns non-booked memberships' 

    end
  end

  context 'with_end_date' do
    let!(:membership_with_end_date) { create(:membership, user: user) }
    let!(:membership_without_end_date) { create(:membership_without_ends_at, user: user) }

    describe '#with_end_date' do
      it 'returns with_end_date memberships' 

    end

    describe '#not_with_end_date' do
      it 'returns memberships without end date' 

    end

    describe '#without_end_date' do
      it 'is alias to #not_with_end_date' 

    end
  end

  describe '#not_ended' do
    let(:not_ended_membership) do
      create(:membership, user: user, ends_at: Time.local(2014, 12, 30))
    end
    let(:ended_membership) do
      create(:membership, user: user, ends_at: Time.local(2014, 11, 30))
    end
    let(:membership_without_end_date) { create(:membership, user: user, ends_at: nil) }

    before do
      Timecop.freeze(Time.local(2014, 12, 1))
    end

    after { Timecop.return }

    it 'returns ended memberships' 

  end

  describe 'started' do
    let(:started_membership) do
      create(:membership, user: user, starts_at: Time.local(2014, 11, 30))
    end
    let(:not_started_membership) do
      create(:membership, user: user, starts_at: Time.local(2014, 12, 30))
    end

    before do
      started_membership # lazy load
      not_started_membership # lazy load
      Timecop.freeze(Time.local(2014, 12, 1))
    end

    describe '#started' do
      it 'returns started memberships' 

    end

    describe '#not_started' do
      it 'returns not started memberships' 

    end
  end

  describe '#current' do
    let!(:not_potential_or_archived_project1) do
      create(
        :project,
        archived: false,
        potential: false,
        starts_at: Time.local(2013, 11, 30),
        end_at: Time.local(2015, 12, 25))
    end
    let!(:not_potential_or_archived_project2) do
      create(
        :project,
        archived: false,
        potential: false,
        starts_at: Time.local(2013),
        end_at: Time.local(2014, 12, 25)
      )
    end

    let!(:current_membership_with_end_date) do
      create(:membership,
             user: user, starts_at: Time.local(2014, 11, 30), ends_at: Time.local(2014, 12, 25),
             project: not_potential_or_archived_project1)
    end
    let!(:current_membership_without_end_date) do
      create(:membership,
             user: user, starts_at: Time.local(2014, 11, 30), ends_at: nil,
             project: not_potential_or_archived_project2)
    end
    let!(:not_started_membership) do
      create(:membership,
             user: user, starts_at: Time.local(2014, 12, 30),
             ends_at: Time.local(2015, 1, 30),
             project: not_potential_or_archived_project1)
    end
    let!(:booked_membership) do
      create(:membership,
             user: user, starts_at: Time.local(2014, 12, 27), ends_at: Time.local(2014, 12, 29),
             project: not_potential_or_archived_project1, booked: true)
    end

    before do
      Timecop.freeze(Time.local(2014, 12, 1))
    end

    it 'returns current memberships' 


    it 'returns memberships which are not potential, not booked, not archived, started and not ended' 

  end

  describe '#next' do
    let!(:not_potential_or_archived_project1) do
      create(
        :project,
        archived: false,
        potential: false,
        starts_at: Time.local(2014, 12, 30), end_at: Time.local(2015, 6, 30))
    end
    let(:ended_project) do
      create(
        :project,
        archived: false, potential: false, starts_at: Time.local(2013), end_at: Time.local(2014)
      )
    end
    let!(:not_potential_or_archived_project2) do
      create(:project, archived: false, potential: false)
    end
    let!(:next_membership_with_end_date) do
      create(
        :membership,
        user: user, starts_at: Time.local(2014, 12, 30), ends_at: Time.local(2015, 1, 30),
        project: not_potential_or_archived_project1)
    end
    let!(:next_membership_without_end_date) do
      create(:membership,
             user: user, starts_at: Time.local(2014, 12, 30), ends_at: nil,
             project: not_potential_or_archived_project2)
    end
    let!(:started_membership) do
      create(:membership,
             user: user, starts_at: Time.local(2014, 11, 30), ends_at: Time.local(2014, 12, 29),
             project: not_potential_or_archived_project1)
    end
    let!(:next_membership) do
      create(:membership,
             user: user, starts_at: Time.local(2013, 12, 30), ends_at: nil,
             project: ended_project)
    end

    before do
      Timecop.freeze(Time.local(2014, 12, 1))
    end

    it 'returns next memberships' 


    it 'returns memberships which are not started, not ended, not potential and not booked' 

  end

  describe '#items' do
    let(:membership) { create(:membership) }
    it 'clears search params' 


    it 'returns membership search results' 

  end
end

