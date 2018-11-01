# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeamsController do
  let(:team) { FactoryBot.create :team }

  describe "GET #index" do
    context "when not signed in" do
      sign_out

      it 'redirects to the sign in page' 

    end

    context "when signed in as admin" do
      sign_in { FactoryBot.create :admin }

      it 'shows the teams index page' 

    end

    context 'when signed in as a regular user' do
      sign_in { FactoryBot.create :user }

      it 'does not allow access' 

    end
  end

  describe 'GET #edit' do
    context 'when signed in as a team leader without rights to manage all teams' do
      let(:team_where_is_leader) { Team.wrc }
      let(:team_where_is_not_leader) { Team.wst }
      let(:leader) do
        user = FactoryBot.create(:user)
        FactoryBot.create(:team_member, team_id: team_where_is_leader.id, user_id: user.id, team_leader: true)
        user
      end

      before :each do
        sign_in leader
      end

      it 'can edit his team' 


      it 'cannot edit other teams' 

    end
  end

  describe 'POST #update' do
    context 'when signed in as an admin' do
      let(:admin) { FactoryBot.create :admin }
      before :each do
        sign_in admin
      end

      it 'cannot change friendly ID' 


      it 'can add a member' 


      it 'can deactivate a member' 


      it 'cannot demote oneself' 


      it 'cannot set start_date < end_date' 


      it 'cannot add overlapping membership periods for the same user' 


      it 'cannot add another membership for the same user without start_date' 


      it 'cannot add a membership with end_date but without start_date' 

    end
  end
end

