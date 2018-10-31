require 'spec_helper'
require 'spree/testing_support/bar_ability'

describe Spree::Admin::UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:mock_user) { mock_model Spree.user_class }

  before do
    allow(controller).to receive_messages spree_current_user: user
    user.spree_roles.clear
    stub_const('Spree::User', user.class)
  end

  context '#show' do
    before do
      user.spree_roles << Spree::Role.find_or_create_by(name: 'admin')
    end

    it 'redirects to edit' 

  end

  context '#authorize_admin' do
    before { use_mock_user }

    it 'grant access to users with an admin role' 


    it "allows admins to update a user's API key" 


    it "allows admins to clear a user's API key" 


    it 'deny access to users without an admin role' 


    describe 'deny access to users with an bar role' do
      before do
        user.spree_roles << Spree::Role.find_or_create_by(name: 'bar')
        Spree::Ability.register_ability(BarAbility)
      end

      it '#index' 


      it '#update' 

    end
  end

  describe '#create' do
    before do
      use_mock_user
      user.spree_roles << Spree::Role.find_or_create_by(name: 'admin')
    end

    it 'can create a shipping_address' 


    it 'can create a billing_address' 


    it 'redirects to user edit page' 

  end

  describe '#update' do
    before do
      use_mock_user
      user.spree_roles << Spree::Role.find_or_create_by(name: 'admin')
    end

    it 'allows shipping address attributes through' 


    it 'allows billing address attributes through' 


    it 'allows updating without password resetting' 


    it 'redirects to user edit page' 


    it 'render edit page when update got errors' 

  end

  describe '#orders' do
    let(:order) { create(:order) }

    before do
      user.orders << order
      user.spree_roles << Spree::Role.find_or_create_by(name: 'admin')
    end

    it 'assigns a list of the users orders' 


    it 'assigns a ransack search for Spree::Order' 

  end

  describe '#items' do
    let(:order) { create(:order) }

    before do
      user.orders << order
      user.spree_roles << Spree::Role.find_or_create_by(name: 'admin')
    end

    it 'assigns a list of the users orders' 


    it 'assigns a ransack search for Spree::Order' 

  end
end

def use_mock_user
  allow(mock_user).to receive(:save).and_return(true)
  allow(Spree.user_class).to receive(:find).with(mock_user.id.to_s).and_return(mock_user)
  allow(Spree.user_class).to receive(:new).and_return(mock_user)
end

