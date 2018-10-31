require 'rails_helper'

describe API::AnnouncementsController do
  let(:user)  { create :user }
  let(:group) { create :formal_group }
  let(:another_group) { create :formal_group }
  let(:an_unknown_group) { create :formal_group }

  before do
    group.add_admin! user
    sign_in user
  end

  describe 'search' do
    let!(:a_friend)        { create :user, name: "Friendly Fran" }
    let!(:an_acquaintance) { create :user, name: "Acquaintance Annie" }
    let!(:a_stranger)      { create :user, name: "Alien Alan" }

    before do
      group.add_member! a_friend
      another_group.add_member! user
      another_group.add_member! an_acquaintance
    end

    it 'returns an existing user you know' 


    it 'does not return an existing user you dont know' 


    it 'returns an email address' 


    it 'finds potential members when a group is given' 


    it 'filters out group members if a group is given' 


    it 'filters out group member email addresses' 


    it 'authorizes the group' 

  end

  describe 'audience' do
    let(:group)      { create :formal_group }
    let(:discussion) { create :discussion, group: group }
    let(:subgroup)   { create :formal_group, parent: group }
    let(:both_user)  { create :user }
    let(:parent_user){ create :user }

    it 'parent_group' 


    it 'formal_group' 


    it 'discussion_group' 


    it 'voters' 


    it 'non_voters' 

  end

  describe 'create' do
    let(:notified_user) { create :user }

    describe 'discussion' do
      let(:discussion)    { create :discussion, author: user }

      it 'does not permit non author to announce' 


      it 'notify exising user' 


      it 'notify new user by email' 


      it 'notify existing user by email' 

    end

    describe 'poll' do
      let(:poll)          { create :poll, author: user }

      it 'does not permit non author to announce' 


      it 'notify exising user' 


      it 'notify new user by email' 


      it 'notify existing user by email' 

    end

    describe 'outcome' do
      let(:poll)    { create :poll, author: user, closed_at: 1.day.ago }
      let(:outcome) { create :outcome, author: user, poll: poll }

      it 'does not permit non author to announce' 


      it 'notify exising user' 


      it 'notify new user by email' 


      it 'notify existing user by email' 

    end

    describe 'group' do
      let(:group) { create :formal_group, creator: user}

      it 'does not permit non author to announce' 


      it 'notify exising user' 


      it 'notify new user by email' 


      it 'notify existing user by email' 

    end
  end
end

