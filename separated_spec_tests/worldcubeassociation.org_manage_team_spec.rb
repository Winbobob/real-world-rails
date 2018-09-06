# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Manage team" do
  let!(:results_team) { Team.find_by_friendly_id("wrt") }
  let!(:results_team_member) { FactoryBot.create(:user, :wrt_member) }

  before(:each) { sign_in FactoryBot.create(:admin) }

  it 'remove member from team' 

end

