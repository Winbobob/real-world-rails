# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::UsersController, type: :controller do
  let(:user) { create(:user) }

  let(:state) { create(:state, state_code: 'NY') }
  let(:valid_address_attributes) do
    {
      firstname: 'Foo',
      lastname: 'Bar',
      city: "New York",
      country_id: state.country.id,
      state_id: state.id,
      phone: '555-555-5555',
      address1: '123 Fake St.',
      zipcode: '10001',
    }
  end

  context "#show" do
    stub_authorization! do |_user|
      can [:admin, :manage], Spree.user_class
    end

    it "redirects to edit" 

  end

  context '#authorize_admin' do
    context "with ability to admin users" do
      stub_authorization! do |_user|
        can [:manage], Spree.user_class
      end

      it 'can visit index' 


      it "allows admins to update a user's API key" 


      it "allows admins to clear a user's API key" 

    end

    context "without ability to admin users" do
      stub_authorization! do |_user|
      end

      it 'denies access' 

    end
  end

  describe "#create" do
    let(:dummy_role) { Spree::Role.create(name: "dummyrole") }

    # The created user
    def user
      Spree.user_class.last
    end

    stub_authorization! do |_user|
      can :manage, Spree.user_class
    end

    context "when the user can manage roles" do
      stub_authorization! do |_user|
        can :manage, Spree.user_class
        can :manage, Spree::Role
      end

      it "can create user with roles" 


      it "can create user without roles" 

    end

    context "when the user cannot manage roles" do
      it "cannot assign users roles" 


      it "can create user without roles" 

    end

    it "can create a shipping_address" 


    it "can create a billing_address" 


    it "can set stock locations" 

  end

  describe "#update" do
    let(:dummy_role) { Spree::Role.create(name: "dummyrole") }
    let(:ability) { Spree::Ability.new(user) }

    stub_authorization! do |_user|
      can :manage, Spree.user_class
    end

    context "when the user can manage roles" do
      stub_authorization! do |_user|
        can :manage, Spree.user_class
        can :manage, Spree::Role
      end

      it "can set roles" 


      it "can clear roles" 


      context 'when no role params are present' do
        it 'does not clear all present user roles' 

      end
    end

    context "when the user cannot manage roles" do
      it "cannot set roles" 


      it "cannot clear roles" 

    end

    context "allowed to update email" do
      stub_authorization! do |_user|
        can [:admin, :update, :update_email], Spree.user_class
      end

      it "can change email of a user" 

    end

    context "not allowed to update email" do
      stub_authorization! do |_user|
        can [:admin, :update], Spree.user_class
      end

      it "cannot change email of a user" 

    end

    it "can update ship_address attributes" 


    it "can update bill_address attributes" 


    it "can set stock locations" 

  end

  describe "#orders" do
    stub_authorization! do |_user|
      can :manage, Spree.user_class
    end

    let(:order) { create(:order) }
    before { user.orders << order }

    it "assigns a list of the users orders" 


    it "assigns a ransack search for Spree::Order" 

  end

  describe "#items" do
    stub_authorization! do |_user|
      can :manage, Spree.user_class
    end

    let(:order) { create(:order) }
    before { user.orders << order }

    it "assigns a list of the users orders" 


    it "assigns a ransack search for Spree::Order" 

  end
end

