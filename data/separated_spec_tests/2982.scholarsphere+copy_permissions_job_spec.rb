# frozen_string_literal: true

require 'rails_helper'

describe CopyPermissionsJob do
  context 'when changing visibility' do
    subject { file_set }

    let(:work)     { create(:public_work, edit_users: ['user1']) }
    let(:file_set) { create(:file_set) }

    before do
      work.ordered_members = [file_set]
      work.save
      described_class.perform_now(work)
    end

    its(:visibility) { is_expected.to eq('open') }
  end

  # This duplicates Sufia's InheritPermissionsJob spec tests
  context 'when changing permissions' do
    let(:user) { create(:user, login: 'user') }
    let(:work) { create(:work, :with_one_file, user: user) }

    before do
      work.permissions.build(name: name, type: type, access: access)
      work.save
    end

    context 'when edit people change' do
      let(:name) { 'abc@123.com' }
      let(:type) { 'person' }
      let(:access) { 'edit' }

      it 'copies permissions to its contained files' 


      context 'when people should be removed' do
        before do
          file_set = work.file_sets.first
          file_set.permissions.build(name: 'remove_me', type: type, access: access)
          file_set.save
        end

        it 'copies permissions to its contained files' 

      end
    end

    context 'when read people change' do
      let(:name) { 'abc@123.com' }
      let(:type) { 'person' }
      let(:access) { 'read' }

      it 'copies permissions to its contained files' 

    end

    context 'when read groups change' do
      let(:name) { 'my_read_group' }
      let(:type) { 'group' }
      let(:access) { 'read' }

      it 'copies permissions to its contained files' 

    end

    context 'when edit groups change' do
      let(:name) { 'my_edit_group' }
      let(:type) { 'group' }
      let(:access) { 'edit' }

      it 'copies permissions to its contained files' 

    end
  end

  context 'when work is embargoed' do
    let(:work)     { create(:public_work, :with_public_embargo, edit_users: ['user1']) }

    let(:file_set) { create(:file_set) }
    let(:date) { Date.tomorrow }

    before do
      work.ordered_members = [file_set]
      work.save
    end

    it 'copies embargo to its contained files' 

  end

  context 'when work is leased' do
    let(:work)     { create(:public_work, :with_public_lease, edit_users: ['user1']) }

    let(:file_set) { create(:file_set) }
    let(:date) { Date.tomorrow }

    before do
      work.ordered_members = [file_set]
      work.save
    end

    it 'copies embargo to its contained files' 

  end
end

