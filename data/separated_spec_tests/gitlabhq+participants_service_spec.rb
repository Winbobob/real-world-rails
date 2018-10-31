require 'spec_helper'

describe Projects::ParticipantsService do
  describe '#groups' do
    describe 'avatar_url' do
      let(:project) { create(:project, :public) }
      let(:group) { create(:group, avatar: fixture_file_upload('spec/fixtures/dk.png')) }
      let(:user) { create(:user) }
      let!(:group_member) { create(:group_member, group: group, user: user) }

      it 'should return an url for the avatar' 


      it 'should return an url for the avatar with relative url' 

    end
  end
end

