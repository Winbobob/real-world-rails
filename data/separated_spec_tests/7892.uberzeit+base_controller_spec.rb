require 'spec_helper'

describe Reports::BaseController do
  controller(Reports::BaseController) do
    def index
      render nothing: true
    end
  end

  let!(:user) { FactoryGirl.create(:admin) }
  let!(:another_user) { FactoryGirl.create(:user, teams: user.teams) }
  let!(:another_user_in_another_team) { FactoryGirl.create(:user) }

  before do
    test_sign_in user
  end

  it '@month' 


  it '@month_as_date' 


  it '@year' 


  describe '@users' do
    context 'user specified' do
      it 'sets only the requested user' 

    end

    context 'teams specified' do
      it 'sets only the requested teams' 

    end

    context 'nothing specified' do
      it 'sets all the accessible users' 

    end

    describe 'deactivated user handling' do
      let!(:deactivated_user) { FactoryGirl.create(:user, active: false) }
      it 'does not include deactivated users' 

    end
  end

  describe '@teams' do
    it 'sets the teams' 

  end

  describe '@requested_teams' do
    it 'sets the requested teams' 

  end

end

