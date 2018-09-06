require 'spec_helper'

describe TeamUsersRepository do
  let(:user) { create(:user) }
  let(:team) { create(:team_with_members, user_id: user.id, users: [user]) }

  before { team.reload }

  subject { TeamUsersRepository.new(team) }

  describe '#all' do
    it 'retrieves all users' 

  end

  describe '#leader' do
    it 'retrieves leader' 

  end

  describe '#subordinates' do
    it 'retrieves all users except leader' 


    context 'with archived users' do
      let(:archived_user) { create(:user, archived: true) }

      before do
        team.users << archived_user
      end

      it 'retrieves all users except archived team members' 

    end
  end
end

