require 'spec_helper'

describe Reports::WorkController do
  render_views

  before(:all) do
    @team = FactoryGirl.create(:team, users_count: 1, leaders_count: 1)
    @another_team = FactoryGirl.create(:team, users_count: 1, leaders_count: 1)
    @admin = FactoryGirl.create(:admin, teams: [@team])
    @year = 2013

    [@team, @another_team].map(&:members).flatten.each do |user|
      Day.create_or_regenerate_days_for_user_and_year!(user, @year)
    end
  end

  after(:all) do
    Team.delete_all
    Membership.delete_all
    User.delete_all
    Day.delete_all
  end

  let(:team) { @team }
  let(:another_team) { @another_team }

  let(:user) { team.members.first }
  let(:team_leader) { team.leaders.first }
  let(:admin) { @admin }
  let(:year) { @year }
  let(:month) { 3 }

  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    controller.stub(:current_ability) { @ability }
  end

  context 'for non-signed in users' do
    it 'redirects to login' 

  end

  context 'for signed-in users' do
    before do
      test_sign_in user
    end

    context 'user has rights to view this report' do
      before do
        @ability.can :manage, :work
      end

      it 'allows to view this report when user has rights' 

    end

    context 'user has no rights to view this report' do
      before do
        @ability.cannot :manage, :work
      end

      it 'denies to view this report when user has rights' 

    end
  end

end

