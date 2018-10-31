require 'rails_helper'
require 'pundit/rspec'

module Suppliers
  describe GroupPolicy do
    let(:user) do
      user = FactoryGirl.create(:user)
      User.find(user.id)
    end
    let(:group) { FactoryGirl.create(:group) }

    subject { described_class }

    permissions :show?, :index? do
      context 'when the user is associated to the group' do
        let!(:membership) do
          ::BasicResources::Membership.create(
            basic_resource_group_id: group.id,
            user_id: user.id,
            role: role
          )
        end

        context 'as `admin`' do
          let(:role) { Membership::ROLES[:admin] }

          it 'grants access' 

        end

        context 'as `member`' do
          let(:role) { Membership::ROLES[:member] }

          it 'grants access' 

        end
      end
    end

    permissions :create?, :update?, :destroy? do
      context 'when the user is associated to the group' do
        let!(:membership) do
          ::BasicResources::Membership.create(
            basic_resource_group_id: group.id,
            user_id: user.id,
            role: role
          )
        end

        context 'as `admin`' do
          let(:role) { Membership::ROLES[:admin] }

          it 'grants access' 

        end

        context 'as `member`' do
          let(:role) { Membership::ROLES[:member] }

          it 'denies access' 

        end
      end
    end
  end
end

