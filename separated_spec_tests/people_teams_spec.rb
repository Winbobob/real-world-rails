require 'spec_helper'

describe 'Team view', js: true do
  let(:admin_user) { create(:user, :admin, email: AppConfig.emails.admin[0]) }
  let(:hidden_role) { create(:role, show_in_team: false) }
  let(:team) { create(:team) }

  let(:added_user_first_name) { 'Developer' }
  let(:added_user_last_name) { 'Daisy' }
  let!(:dev_user) { create(:user, :admin, :developer, first_name: added_user_first_name,
      last_name: added_user_last_name) }
  let!(:non_dev_user) { create(:user, :intern, first_name: 'Nondev Nigel') }
  let!(:archived_user) { create(:user, first_name: 'Archived Arthur', archived: true) }
  let!(:no_role_user) { create(:user, first_name: 'Norole Nicola') }
  let!(:hidden_user) { create(:user, first_name: 'Hidden Amanda', primary_role: hidden_role,
    teams: [team]) }
  let!(:hidden_user_position) { create(:position, :primary, user: hidden_user, role: hidden_role) }
  let!(:team_user) { create(:user, :developer, first_name: 'Developer Dave', teams: [team]) }
  let!(:junior_team_user) { create(:user, :junior, first_name: 'Junior Jake', teams: [team]) }

  let!(:teams_page) { App.new.teams_page }

  before do
    log_in_as admin_user
    teams_page.load
    wait_for_ajax
  end

  describe "'show users without team' button" do
    before { teams_page.show_users_button.click }

    it "doesn't show archived users" 


    it 'shows only users with roles chosen by admin' 

  end

  describe "'new team' button" do
    before { teams_page.new_team_button.click }

    it 'shows new team form' 


    it 'adds new team' 

  end

  describe "'promote to leader' button" do
    let(:promoted_user) { [team_user, junior_team_user].sort_by(&:last_name).first.decorate }
    let(:success_msg) { 'New leader promoted!' }

    it 'promotes member to leader' 

  end

  describe "'add user to team' dropdown" do
    context 'when current_user is not an admin' do
      it 'is not visible' 

    end

    context 'when current_user is an admin' do
      it 'is visible' 


      it 'adds a new member to the team' 

    end
  end

  describe '.member-details' do
    it 'displays archived label for archived users' 

  end

  describe '.devs-indicator' do
    it 'shows number of users in team' 

  end
end

