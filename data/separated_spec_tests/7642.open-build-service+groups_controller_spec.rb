require 'rails_helper'

RSpec.describe Webui::GroupsController do
  let(:group) { create(:group) }
  let(:another_group) { create(:group, title: "#{group.title}-#{SecureRandom.hex}") }
  let(:user) { create(:user) }

  # except [:show, :tokens, :autocomplete]
  it { is_expected.to use_before_action(:require_login) }
  # only: [:show, :update, :edit]
  it { is_expected.to use_before_action(:set_group) }
  # except: [:show, :autocomplete, :tokens]
  it { is_expected.to use_after_action(:verify_authorized) }

  describe 'GET show' do
    it 'is successful as nobody' 


    it 'assigns @group' 


    it 'redirects to root_path if group does not exist' 

  end

  describe 'GET autocomplete' do
    it 'returns list with one group for a match' 


    it 'returns list with more than one group for a match' 


    it 'returns empty list if no match' 

  end

  describe 'GET edit' do
    let(:users_of_group) { create_list(:user, 3) }

    before do
      group.users << users_of_group

      login(user)
    end

    context 'as a normal user' do
      it 'does not allow to see the edit form used for updating a group' 

    end

    context 'as a group maintainer' do
      before do
        create(:group_maintainer, user: user, group: group)
      end

      it 'shows edit form and populates it with data' 

    end
  end

  describe 'POST create' do
    let(:users_to_add) { create_list(:user, 3) }

    before do
      group.users << create(:user, login: 'existing_group_user')

      login(user)
    end

    context 'as a normal user' do
      it 'does not allow to create a group' 

    end

    context 'as an admin' do
      before do
        login(create(:admin_user))
      end

      context 'creating a new group' do
        it 'creates a group with members' 

      end

      context 'creating a group with invalid data' do
        it 'shows a flash message with the validation error' 

      end
    end
  end

  describe 'POST update' do
    let(:user_to_add) { create(:user) }
    let(:group_maintainer) { create(:group_maintainer, group: group) }

    context 'as a normal user' do
      before do
        login(user)

        post :update, params: { title: group.title, group: { members: user_to_add.login } }
      end

      it { expect(flash[:error]).to eq('Sorry, you are not authorized to update this Group.') }
      it { expect(response).to redirect_to(root_path) }
    end

    context 'as a maintainer of the group' do
      before do
        login(group_maintainer.user)

        post :update, params: { title: group.title, group: { members: user_to_add.login } }
      end

      it { expect(flash[:success]).to eq("Group '#{group.title}' successfully updated.") }
      it { expect(response).to redirect_to(group_edit_title_path(title: group.title)) }
    end

    context 'as an admin' do
      let(:admin) { create(:admin_user) }

      before do
        login(admin)

        post :update, params: { title: group.title, group: { members: user_to_add.login } }
      end

      it { expect(flash[:success]).to eq("Group '#{group.title}' successfully updated.") }
      it { expect(response).to redirect_to(group_edit_title_path(title: group.title)) }
    end
  end
end

