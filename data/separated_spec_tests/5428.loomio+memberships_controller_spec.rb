require 'rails_helper'
describe API::MembershipsController do

  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:user_named_biff) { create :user, name: "Biff Bones" }
  let(:user_named_bang) { create :user, name: "Bang Whamfist" }
  let(:alien_named_biff) { create :user, name: "Biff Beef", email: 'beef@biff.com' }
  let(:alien_named_bang) { create :user, name: 'Bang Beefthrong' }
  let(:pending_named_barb) { create :user, name: 'Barb Backspace' }

  let(:group) { create :formal_group }
  let(:another_group) { create :formal_group }
  let(:discussion) { create :discussion, group: group }
  let(:comment_params) {{
    body: 'Yo dawg those kittens be trippin for some dippin',
    discussion_id: discussion.id
  }}

  before do
    group.add_admin! user
    group.add_member! user_named_biff
    group.add_member! user_named_bang
    another_group.add_member! user
    another_group.add_member! alien_named_bang
    another_group.add_member! alien_named_biff
    group.memberships.create!(user: pending_named_barb, accepted_at: nil)
    sign_in user
  end

  describe 'create' do
    it 'sets the membership volume' 

  end

  describe 'resend' do
    let(:group) { create :formal_group }
    let(:discussion) { create :discussion }
    let(:poll) { create :poll }
    let(:user) { create :user }
    let(:group_invite) { create :membership, accepted_at: nil, inviter: user, group: group }
    let(:discussion_invite) { create :membership, accepted_at: nil, inviter: user, group: discussion.guest_group }
    let(:poll_invite) { create :membership, accepted_at: nil, inviter: user, group: poll.guest_group }

    before { sign_in user }

    it 'can resend a group invite' 


    it 'can resend a discussion invite' 


    it 'can resend a poll invite' 


    it 'does not send if not the inviter' 


    it 'does not send if accepted' 

  end

  describe 'set_volume' do
    before do
      @discussion = FactoryBot.create(:discussion, group: group)
      @another_discussion = FactoryBot.create(:discussion, group: group)
      @membership = group.membership_for(user)
      @membership.set_volume! 'quiet'
      @second_membership = another_group.membership_for(user)
      @second_membership.set_volume! 'quiet'
      @reader = DiscussionReader.for(discussion: @discussion, user: user)
      @reader.save!
      @reader.set_volume! 'normal'
      @second_reader = DiscussionReader.for(discussion: @another_discussion, user: user)
      @second_reader.save!
      @second_reader.set_volume! 'normal'
    end
    it 'updates the discussion readers' 

    context 'when apply to all is true' do
      it 'updates the volume for all memberships' 

    end
    context 'when apply to all is false' do
      it 'updates the volume for a single membership' 

    end
  end

  describe 'add_to_subgroup' do
    context 'permitted' do
      let(:parent_member) { FactoryBot.create(:user) }
      let(:parent_group) { FactoryBot.create(:formal_group) }
      let(:subgroup) { create(:formal_group, parent: parent_group) }

      before do
        parent_group.add_member!(user)
        parent_group.add_member!(parent_member)
        subgroup.add_member!(user)
        sign_in user
      end

      it "adds parent members to subgroup" 


      it "does not add aliens to subgroup" 

    end
  end

  describe 'index' do
    context 'success' do
      it 'returns users filtered by group' 


      it 'returns pending users' 


      context 'logged out' do
        before { @controller.stub(:current_user).and_return(LoggedOutUser.new) }
        let(:private_group) { create(:formal_group, is_visible_to_public: false) }

        it 'returns users filtered by group for a public group' 


        it 'responds with unauthorized for private groups' 

      end
    end
  end

  describe 'for_user' do
    let(:public_group) { create :formal_group, is_visible_to_public: true }
    let(:private_group) { create :formal_group, is_visible_to_public: false }
    let(:guest_group) { create :guest_group }

    it 'returns visible groups for the given user' 

  end

  describe 'autocomplete' do
    let(:emrob_jones) { create :user, name: 'emrob jones' }
    let(:rob_jones) { create :user, name: 'rob jones' }
    let(:jim_robinson) { create :user, name: 'jim robinson' }
    let(:jim_emrob) { create :user, name: 'jim emrob' }
    let(:rob_othergroup) { create :user, name: 'rob othergroup' }

    context 'success' do
      before do
        emrob_jones
        rob_jones
        jim_robinson
        jim_emrob
        group.add_member!(emrob_jones)
        group.add_member!(rob_jones)
        group.add_member!(jim_robinson)
        group.add_member!(jim_emrob)
        another_group.add_member!(rob_othergroup)
      end
      it 'returns users filtered by query' 

    end

    context 'failure' do
      it 'does not allow access to an unauthorized group' 

    end
  end

  describe 'invitables' do

    context 'success' do
      it 'returns users in shared groups' 


      it 'does not return deactivated users' 


      it 'can search by email address' 


      it 'does not return duplicate users' 


    end
  end

  describe 'save_experience' do

    it 'successfully saves an experience' 


    it 'responds with forbidden when user is logged out' 


    it 'responds with bad request when no experience is given' 

  end

  describe 'undecided' do
    let(:poll) { create :poll, discussion: discussion }
    let(:another_poll) { create :poll }
    let(:stance) { create :stance, poll: poll, participant: another_user, stance_choices_attributes: [{ poll_option_id: poll.poll_options.first.id }] }

    it 'fetches an undecided membership' 


    it 'does not fetch a membership from another group' 


    it 'does not fetch a membership who has voted' 


    it 'does not fetch memberships for polls you dont have access to' 

  end

end

