require 'spec_helper'

describe ReportsController do
  let (:test_organization) { Fabricate(:organization) }
  let (:member1) { Fabricate(:member, organization: test_organization) }
  let (:member2) { Fabricate(:member, organization: test_organization) }
  let (:inactive_member) { Fabricate(:member, organization: test_organization, active: false) }
  let (:another_member) { Fabricate(:member) }
  let (:test_category) { Fabricate(:category) }
  let! (:active_organization_offers) do
    [member1, member2].map do |member|
      Fabricate(:offer,
                user: member.user,
                organization: member.organization,
                category: test_category)
    end
  end

  before do
    [another_member, inactive_member].map do |member|
      Fabricate(:offer,
                user: member.user,
                organization: member.organization,
                category: test_category)
    end
  end

  describe 'GET #post_list' do
    context 'with a logged user' do
      it 'do NOT show the inactive members' 

    end
  end
end

