require 'feature_helper'

describe 'Teams' do
  before { sign_in user }

  context 'when user is not a team admin' do
    let!(:user) { create :user, :with_team }

    describe 'create team' do
      it 'should create a new team and set the user as admin' 

    end
  end

  context 'when user is a team admin' do
    let!(:user) { create :user, :with_team_and_is_admin }

    describe 'update team' do
      it 'should update a team and set a team logo' 

    end
  end

  context 'when current user is the current team admin or the root' do
    describe 'trying to add a existing user that is not in the current team' do
      let!(:user) { create :user, :with_team_and_is_admin }
      let!(:user_to_be_added) { create :user, email: 'user@example.com' }

      it 'should update the team with this user' 

    end

    describe 'trying to add an email that is not registered' do
      let!(:user)  { create :user, :with_team_and_is_admin }

      it 'shows an error message' 

    end

    describe 'trying to add a user that is not enrolled in the current team' do
      let!(:user) { create :user, :with_team_and_is_admin }
      let!(:user_to_be_added) { create :user, teams: [user.teams.first], email: 'user@example.com' }

      it 'shows a message saying that the user is already on the team' 

    end
  end
end

