require 'rails_helper'

RSpec.describe GroupActionLogger do
  let(:group_owner) { Fabricate(:user) }
  let(:group) { Fabricate(:group) }
  let(:user) { Fabricate(:user) }

  subject { described_class.new(group_owner, group) }

  before do
    group.add_owner(group_owner)
  end

  describe '#log_make_user_group_owner' do
    it 'should create the right record' 

  end

  describe '#log_remove_user_as_group_owner' do
    it 'should create the right record' 

  end

  describe '#log_add_user_to_group' do
    describe 'as a group owner' do
      it 'should create the right record' 

    end

    context 'as a normal user' do
      subject { described_class.new(user, group) }

      describe 'user cannot freely exit group' do
        it 'should not be allowed to log the action' 

      end

      describe 'user can freely exit group' do
        before do
          group.update!(public_admission: true)
        end

        it 'should create the right record' 

      end
    end
  end

  describe '#log_remove_user_from_group' do
    describe 'as group owner' do
      it 'should create the right record' 

    end

    context 'as a normal user' do
      subject { described_class.new(user, group) }

      describe 'user cannot freely exit group' do
        it 'should not be allowed to log the action' 

      end

      describe 'user can freely exit group' do
        before do
          group.update!(public_exit: true)
        end

        it 'should create the right record' 

      end
    end
  end

  describe '#log_change_group_settings' do
    it 'should create the right record' 

  end
end

