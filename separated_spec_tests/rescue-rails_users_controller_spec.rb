# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  name                         :string(255)
#  email                        :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#  encrypted_password           :string(255)
#  salt                         :string(255)
#  admin                        :boolean          default(FALSE)
#  password_reset_token         :string(255)
#  password_reset_sent_at       :datetime
#  is_foster                    :boolean          default(FALSE)
#  phone                        :string(255)
#  address1                     :string(255)
#  address2                     :string(255)
#  city                         :string(255)
#  region                       :string(2)
#  postal_code                  :string(255)
#  duties                       :string(255)
#  edit_dogs                    :boolean          default(FALSE)
#  share_info                   :text
#  edit_my_adopters             :boolean          default(FALSE)
#  edit_all_adopters            :boolean          default(FALSE)
#  locked                       :boolean          default(FALSE)
#  edit_events                  :boolean          default(FALSE)
#  other_phone                  :string(255)
#  lastlogin                    :datetime
#  lastverified                 :datetime
#  available_to_foster          :boolean          default(FALSE)
#  foster_dog_types             :text
#  complete_adopters            :boolean          default(FALSE)
#  add_dogs                     :boolean          default(FALSE)
#  ban_adopters                 :boolean          default(FALSE)
#  dl_resources                 :boolean          default(TRUE)
#  agreement_id                 :integer
#  house_type                   :string(40)
#  breed_restriction            :boolean
#  weight_restriction           :boolean
#  has_own_dogs                 :boolean
#  has_own_cats                 :boolean
#  children_under_five          :boolean
#  has_fenced_yard              :boolean
#  can_foster_puppies           :boolean
#  parvo_house                  :boolean
#  admin_comment                :text
#  is_photographer              :boolean          default(FALSE)
#  writes_newsletter            :boolean          default(FALSE)
#  is_transporter               :boolean          default(FALSE)
#  mentor_id                    :integer
#  latitude                     :float
#  longitude                    :float
#  dl_locked_resources          :boolean          default(FALSE)
#  training_team                :boolean          default(FALSE)
#  confidentiality_agreement_id :integer
#  medical_behavior_permission  :boolean          defualt(FALSE)

require 'rails_helper'

describe UsersController, type: :controller do
  let!(:admin) { create(:user, :admin, name: 'Admin') }
  let!(:active_user) { create(:user, city: 'Old York') }
  let!(:inactive_user) { create(:user, :inactive_user, city: 'Some Old City') }

  describe 'GET index' do
    let(:jones) { create(:user, name: 'Frank Jones') }

    context 'Logged in as an Admin User' do
      before :each do
        allow(controller).to receive(:current_user) { admin }
      end

      it 'returns all users' 


      it 'returns the searched for user' 


      it 'returns the searched for user email' 


      it 'returns users near the searched location' 


      it 'returns the training team members' 


      it 'returns the newsletter team members' 


      it 'returns the public relations team members' 


      it 'returns the fundraising team members' 


      it 'returns the translator team members' 


      it 'returns the active team members' 

    end

    context 'logged in as an inactive user' do
      before :each do
        allow(controller).to receive(:current_user) { inactive_user }
      end

      it 'cannot view users index' 

    end
  end

  describe 'GET show' do
    context 'logged in as an inactive user' do
      before :each do
        allow(controller).to receive(:current_user) { inactive_user }
      end

      it 'cannot view another users profile' 


      it 'can view their own profile' 

    end
  end

  describe 'POST create' do
    context 'logged in as an admin' do
      before :each do
        allow(controller).to receive(:current_user) { admin }
      end

      it 'is able to create a user' 

    end

    context 'logged in as active user' do
      before :each do
        allow(controller).to receive(:current_user) { active_user }
      end

      it 'is not able to create a user' 

    end

    context 'logged in as inactive user' do
      before :each do
        allow(controller).to receive(:current_user) { inactive_user }
      end

      it 'is not able to create a user' 

    end
  end

  describe 'PATCH update' do
    let!(:test_user) { create(:user, name: 'Original Name', admin: false) }
    let(:change_permissions_request) { -> { patch :update, params: { id: test_user.id, user: attributes_for(:user, admin: true) } } }
    let(:change_name_request) { -> { patch :update, params: { id: test_user.id, user: attributes_for(:user, name: 'New Name') } } }

    context 'logged in as admin' do
      before :each do
        allow(controller).to receive(:current_user) { admin }
      end

      it 'updates the users permissions' 

    end

    context 'logged in as active user' do
      before :each do
        allow(controller).to receive(:current_user) { active_user }
      end

      it 'is not able to modify user permissions' 


      it 'is able to update own profile' 


      it "is not able to edit another user's profile" 

    end

    context 'logged in as inactive user' do
      before :each do
        allow(controller).to receive(:current_user) { inactive_user }
      end

      it 'is not able to modify user permissions' 


      it 'is able to update own profile' 


      it 'is not able to edit another user\'s profile' 

    end
  end
end

