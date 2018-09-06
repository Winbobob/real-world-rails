require 'rails_helper'

RSpec.describe V1::Users do
  let(:api_token) { create :api_token }

  describe '#GET /api/v1/users' do
    context 'when api token is invalid' do
      let(:api_token) { double :api_token, token: 'foo' }

      it 'returns a authorization error' 

    end

    context 'when api token is linked with a team' do
      let(:user_1) { create :user, name: 'new_user_1', created_at: 1.hour.ago }
      let(:user_2) { create :user, name: 'new_user_2', created_at: 1.hour.ago }
      let(:some_team) { create :team, users: [user_1] }
      let(:api_token) { create :api_token, team: some_team }

      it 'returns only the users associated with current team' 

    end

    context 'when fetching' do
      before do
        create :user, name: 'new_user_1', created_at: 2.days.ago
        create :user, name: 'new_user_2', created_at: 3.days.ago
        create :user, name: 'new_user_3', created_at: 1.hour.ago
        create :user, name: 'new_user_4', created_at: 1.hour.ago
        create :user, name: 'new_user_5', created_at: 4.hours.ago
      end

      it 'return all users' 


      it 'accepts pagination' 


      it 'filter by created_at' 

    end
  end
end

