require 'rails_helper'
describe API::DraftsController do

  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:group) { create :formal_group }
  let(:another_group) { create :formal_group }
  let(:discussion) { create :discussion, group: group }

  let(:user_draft) { create :draft, user: user, draftable: user }
  let(:group_draft) { create :draft, user: user, draftable: group }
  let(:discussion_draft) { create :draft, user: user, draftable: discussion }

  let(:user_draft_params) {{
    payload: {
      group: {
        name: 'Draft group name',
        description: 'Draft group description'
      }
    }
  }}

  let(:group_draft_params) {{
    payload: {
      discussion: {
        title: 'Draft discussion title',
        description: 'Draft discussion description'
      }
    }
  }}
  let(:discussion_draft_params) {{
    payload: {
      comment: {
        body: 'Draft comment body'
      }
    }
  }}

  context 'signed out' do
    describe 'show' do
      it 'returns unauthorized for a group' 


      it 'returns unauthorized for a discussion' 


    end
  end

  context 'signed in' do
    before do
      sign_in user
      group.add_member! user
    end

    describe 'create' do
      it 'creates a new user draft' 


      it 'creates a new group draft' 


      it 'creates a new discussion draft' 



      it 'overwrites a user draft' 


      it 'overwrites a group draft' 


      it 'overwrites a discussion draft' 


      it 'cannot access a group the user does not have access to' 

    end
  end
end

