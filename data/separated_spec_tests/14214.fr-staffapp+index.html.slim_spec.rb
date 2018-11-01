require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  subject { rendered }

  let(:users) { create_list(:user, 2) }

  let(:user_new?) { false }
  let(:user_list_deleted?) { false }

  before do
    assign(:users, users)
    allow(view).to receive(:current_user).and_return(instance_double(User, admin?: true))
    allow(view).to receive(:policy).with(:user).and_return(instance_double(UserPolicy, new?: user_new?, list_deleted?: user_list_deleted?))
    allow(view).to receive(:policy).with(users[0]).and_return(instance_double(UserPolicy, edit?: true, invite?: true))
    allow(view).to receive(:policy).with(users[1]).and_return(instance_double(UserPolicy, edit?: false, invite?: false))

    render
  end

  describe 'Link to change user details' do
    context 'when user has permission to change the other user\'s details' do
      it 'is rendered' 

    end

    context 'when user does not have permission to change the other user\'s details' do
      it 'is not rendered' 

    end
  end

  describe 'The link to invite user' do
    context 'when user has permission to create new users' do
      let(:user_new?) { true }

      it 'is rendered' 

    end

    context 'when user does not have permission to create new users' do
      it 'is not rendered' 

    end
  end

  describe 'The link to deleted users page' do
    context 'when user has permission to list deleted users' do
      let(:user_list_deleted?) { true }

      it 'is rendered' 

    end

    context 'when user does not have permission to list deleted users' do
      it 'is not rendered' 

    end
  end

  describe 'The link to re-invite user' do
    context 'When staff have permission to re-invite a user' do
      context 'The user has not accepted the invitation yet' do
        let(:users) { create_list(:user, 2, :invitation_sent, :invitation_not_accepted) }

        it 'is rendered' 

      end

      context 'The user has accepted the invitation' do
        let(:users) { create_list(:user, 2, :invitation_sent, :invitation_accepted) }

        it 'is not rendered' 

      end
    end

    context 'When staff does not have permission to re-invite user' do
      it 'is not rendered' 

    end
  end
end

