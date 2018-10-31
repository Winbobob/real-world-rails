require 'spec_helper'

describe MembershipSearch do
  describe '#search_user' do
    let!(:user) { create(:user) }
    let!(:membership) { create(:membership, user: user) }
    let!(:other_membership) { create(:membership) }

    it 'returns memberships that belong to the user' 

  end

  describe '#search_archived' do
    let!(:archived_project) { create(:project, archived: true) }
    let!(:membership) { create(:membership, project: archived_project) }
    let!(:other_membership) { create(:membership) }

    it 'returns memberships that belong to archived projects' 

  end

  describe '#search_potential' do
    let!(:potential_project) { create(:project, potential: true) }
    let!(:membership) { create(:membership, project: potential_project) }
    let!(:other_membership) { create(:membership) }

    it 'returns memberships that belong to potential projects' 

  end

  describe '#search_ends_later_than' do
    let!(:later_membership) { create(:membership, ends_at: Time.local(2014, 12, 30), starts_at: Time.local(2014, 11, 29)) }
    let!(:earlier_membership) { create(:membership, ends_at: Time.local(2014, 11, 30), starts_at: Time.local(2014, 11, 29)) }

    before { Timecop.freeze(Time.local(2014, 12, 1)) }

    it 'returns memberships which end later than specified time' 

  end

  describe '#search_starts_earlier_than' do
    let!(:later_membership) { create(:membership, starts_at: Time.local(2014, 12, 30)) }
    let!(:earlier_membership) { create(:membership, starts_at: Time.local(2014, 11, 30)) }

    before { Timecop.freeze(Time.local(2014, 12, 1)) }

    it 'returns memberships which start earlier than specified time' 

  end

  describe '#search_starts_later_than' do
    let!(:later_membership) { create(:membership, starts_at: Time.local(2014, 12, 30)) }
    let!(:earlier_membership) { create(:membership, starts_at: Time.local(2014, 11, 30)) }

    before { Timecop.freeze(Time.local(2014, 12, 1)) }

    it 'returns memberships which start later than specified time' 

  end

  describe '#search_booked' do
    let!(:booked_membership) { create(:membership, booked: true) }
    let!(:other_membership) { create(:membership) }

    it 'returns booked memberships' 

  end

  describe '#search_with_end_date' do
    let!(:membership_with_end_date) { create(:membership) }
    let!(:membership_without_end_date) { create(:membership_without_ends_at) }

    it 'when true it returns memberships with end date' 


    it 'when true it returns memberships with end date' 

  end
end

