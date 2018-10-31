# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Spree::RoleConfiguration do
  class DummyPermissionSet < Spree::PermissionSets::Base
    def activate!
      can :manage, :things
    end
  end
  class OtherDummyPermissionSet < Spree::PermissionSets::Base; end

  let(:instance) { Spree::RoleConfiguration.new }

  describe ".configure" do
    around(:each) do |example|
      Spree::Deprecation.silence { example.run }
    end

    it "yields with the instance" 


    it "only yields once" 

  end

  describe "#assign_permissions" do
    let(:name) { "thing" }
    subject { instance.assign_permissions name, [DummyPermissionSet] }

    context "when a role for the name exists" do
      before do
        instance.roles[name] = described_class::Role.new(name, Set.new(existing_roles))
      end

      context "when adding duplicate permission sets" do
        let(:existing_roles) { [DummyPermissionSet] }

        it "does not add another role" 


        it "does not add duplicate permission sets" 

      end

      context "when adding new permission sets to an existing role" do
        let(:existing_roles) { [OtherDummyPermissionSet] }

        it "does not add another role" 


        it "appends the permission set to the existing role" 

      end
    end

    context "when a role for the name does not yet exist" do
      it "creates a new role" 


      it "sets the roles name accordingly" 


      it "sets the permission sets accordingly" 

    end
  end

  describe "#activate_permissions!" do
    let(:user) { build :user }
    let(:role_name) { "testrole" }
    let(:ability) { DummyAbility.new }

    before do
      user.spree_roles = user_roles.map do |role|
        Spree::Role.create!(name: role)
      end
    end

    subject { instance.activate_permissions! ability, user }

    context "when the configuration has roles" do
      before do
        instance.roles[role_name] = described_class::Role.new(role_name, [DummyPermissionSet])
      end

      context "default_role" do
        let(:role_name) { 'default' }

        context "when the user has no roles" do
          let(:user_roles) { [] }

          it "activates the applicable permissions on the ability" 

        end

        context "when the user has a different role" do
          let(:user_roles) { [] }

          it "activates the applicable permissions on the ability" 

        end
      end

      context "when the configuration has applicable roles" do
        let(:user_roles) { [role_name, "someotherrandomrole"] }

        it "activates the applicable permissions on the ability" 

      end

      context "when the configuration does not have applicable roles" do
        let(:user_roles) { ["somerandomrole"] }

        it "doesn't activate non matching roles" 

      end
    end

    context "when the configuration does not have roles" do
      let(:user_roles) { ["somerandomrole"] }

      it "doesnt activate any new permissions" 

    end
  end
end

