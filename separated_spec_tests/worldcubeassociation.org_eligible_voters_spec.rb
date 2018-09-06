# frozen_string_literal: true

require "rails_helper"
require "csv"

RSpec.feature "Eligible voters csv" do
  before { Timecop.freeze(Time.utc(2016, 5, 5, 10, 5, 3)) }
  after { Timecop.return }

  let!(:wrc_team_id) { Team.find_by_friendly_id("wrc") }

  let!(:user) { FactoryBot.create(:user) }
  let!(:former_team_leader) {
    FactoryBot.create(:user, :wrc_member).tap do |user|
      user.team_members.find_by_team_id(wrc_team_id).update!(team_leader: true, end_date: 1.day.ago)
    end
  }
  let!(:team_leader) {
    FactoryBot.create(:user, :wrc_member).tap do |user|
      user.team_members.find_by_team_id(wrc_team_id).update!(team_leader: true)
    end
  }
  let!(:team_member) { FactoryBot.create(:user, :wrc_member) }
  let!(:candidate_delegate) { FactoryBot.create(:candidate_delegate) }
  let!(:delegate) { FactoryBot.create(:delegate) }
  let!(:delegate_who_is_also_team_leader) {
    FactoryBot.create(:delegate, :wrc_member).tap do |user|
      user.team_members.find_by_team_id(wrc_team_id).update!(team_leader: true)
    end
  }
  let!(:senior_delegate) { FactoryBot.create(:senior_delegate) }
  let!(:board_member) { FactoryBot.create(:user, :board_member) }

  before :each do
    sign_in board_member
  end

  it 'includes all voters' 

end

