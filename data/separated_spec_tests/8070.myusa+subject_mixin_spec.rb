require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  let(:role) { :foobar }

  describe '#grant_role!' do
    subject { -> { user.grant_role!(role) } }

    context 'role does not exist' do
      it 'creates the role' 

      it 'creates an association for user' 

    end

    context 'role exists' do
      before do
        Role.create(name: role)
      end

      context 'user does not have role' do
        it 'does not create a new role' 


        it 'creates an association for user' 

      end

      context 'user has role' do
        before do
          user.roles << Role.find_by_name(role)
        end

        it 'does not create a new role' 


        it 'does not create an association for user' 

      end
    end
  end

  describe '#revoke_role!' do
    let(:other_user) { FactoryGirl.create(:user) }

    before do
      user.grant_role!(role)
      other_user.grant_role!(role)
      user.grant_role!(:baz)
      user.revoke_role!(role)
    end

    it 'revokes role for user' 


    it 'does not revoke other role for user' 


    it 'does not revoke role for other user' 


    it 'does not destroy the role object' 

  end

  describe '#has_role?' do
    context 'global role (symbol only)' do
      before { Role.create(name: role) }

      context 'user does not have role' do
        it 'is false' 

      end

      context 'user has role' do
        before { user.roles << Role.find_by_name(role) }

        it 'is true' 

      end
    end

    context 'associated role (role for object)' do
      let(:resource) { FactoryGirl.create(:application) }

      before do
        Role.create(name: role, authorizable: resource)
      end

      context 'user does not have role' do
        it 'is false' 

      end

      context 'user has role on object' do
        before do
          user.roles << Role.where(name: role, authorizable: resource).first
        end

        it 'is true' 

      end
    end
  end
end

