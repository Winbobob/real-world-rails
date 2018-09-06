require 'rails_helper'

describe MembershipsController do
  let(:user)       { create(:user, :with_team_and_is_admin) }
  let(:project)    { create(:project) }
  let!(:ownership) { create(:ownership, team: user.teams.first, project: project) }

  before do
    sign_in user
    allow(subject).to receive_messages(current_user: user, current_team: user.teams.first)
  end

  describe 'POST #create' do
    let(:user_params) { { email: 'foo@bar.com' } }

    it 'redirects to the project members url path' 


    context 'when the user exists' do
      let!(:new_member) { create(:user, user_params) }

      context 'but its already enrolled to the project' do
        it 'displays a message that the user is already enrolled to the project' 

      end

      context 'and the user is not enrolled to the project yet' do
        it 'displays a message that the user was added to the project' 


        it 'enrolls the user to the project' 

      end
    end

    context 'when the user does not exist' do
      it 'displays that the user is not found' 

    end
  end
end

