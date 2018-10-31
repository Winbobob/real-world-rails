# frozen_string_literal: true

require 'rails_helper'

describe BatchEditsController do
  let(:user) { create(:user) }
  let(:admin_set) { create(:admin_set) }
  let!(:workflow) { Sipity::Workflow.create!(name: 'other', label: 'other', allows_access_grant: true) }
  let!(:permission_template) { Sufia::PermissionTemplate.find_or_create_by(admin_set_id: admin_set.id, workflow_name: 'default') }

  before do
    allow_any_instance_of(Devise::Strategies::HttpHeaderAuthenticatable).to receive(:remote_user).and_return(user.login)
    allow_any_instance_of(User).to receive(:groups).and_return([])
  end

  describe '#form_class' do
    subject { described_class.new }

    its(:form_class) { is_expected.to eq(::BatchEditForm) }
  end

  describe '#update' do
    let(:work1) { create(:private_work, depositor: user.login) }
    let(:work2) { create(:private_work, depositor: user.login) }
    let(:work3) { create(:public_work,  depositor: user.login) }

    before { request.env['HTTP_REFERER'] = 'where_i_came_from' }

    context 'when changing visibility' do
      let(:parameters) do
        {
          update_type:        'update',
          batch_edit_item:    { visibility: 'authenticated' },
          batch_document_ids: [work1.id, work2.id]
        }
      end

      it 'applies the new setting to all works' 

    end

    context 'when visibility is nil' do
      let(:parameters) do
        {
          update_type:        'update',
          batch_edit_item:    {},
          batch_document_ids: [work1.id, work3.id]
        }
      end

      it "preserves the objects' original permissions" 

    end

    context 'when visibility is unchanged' do
      let(:parameters) do
        {
          update_type:        'update',
          batch_edit_item:    { visibility: 'restricted' },
          batch_document_ids: [work1.id, work2.id]
        }
      end

      it "preserves the objects' original permissions" 

    end

    context 'when group permissions are changed' do
      let(:group_permission) { { '0' => { type: 'group', name: 'newgroop', access: 'edit' } } }
      let(:parameters) do
        {
          update_type:        'update',
          batch_edit_item:    { 'permissions_attributes' => group_permission, admin_set_id: admin_set.id },
          batch_document_ids: [work1.id, work2.id]
        }
      end

      it 'updates the permissions on all the works' 

    end

    context 'when user permissions are changed' do
      let(:user_permission) { { '2' => { 'type' => 'person', 'name' => 'cam156', 'access' => 'edit' } } }
      let(:parameters) do
        {
          update_type:        'update',
          batch_edit_item:    { 'permissions_attributes' => user_permission, admin_set_id: admin_set.id },
          batch_document_ids: [work1.id, work2.id]
        }
      end

      it 'updates the permissions on all the works' 

    end

    context 'when permissions are removed' do
      let(:work1) { create(:private_work, title: ['Work 1'], depositor: user.login, edit_users: ['cam156']) }
      let(:work2) { create(:private_work, title: ['Work 2'], depositor: user.login, edit_users: ['cam156']) }

      # Returns the id for a specific permission. The permissions edit form will have this information.
      let(:permission_id) do
        work1.permissions.map { |p| { p.id => p.to_hash } }.select do |h|
          h.values.include?(name: 'cam156', type: 'person', access: 'edit')
        end.first.keys.first
      end

      let(:user_permission) do
        {
          '0' => { 'access' => 'edit', 'type' => 'person', 'name' => 'mat141' },
          '1' => { 'access' => 'edit', 'type' => 'person', 'name' => 'cam156', '_destroy' => 'true', 'id' => permission_id }
        }
      end

      let(:parameters) do
        {
          update_type:        'update',
          batch_edit_item:    { 'permissions_attributes' => user_permission, admin_set_id: admin_set.id },
          batch_document_ids: [work1.id, work2.id]
        }
      end

      it 'removes the permission from each work' 

    end

    context 'when adding an embargo' do
      let(:parameters) do
        {
          update_type: 'update',
          batch_edit_item: {
            visibility: 'embargo',
            visibility_during_embargo: 'restricted',
            embargo_release_date: '2020-01-09',
            visibility_after_embargo: 'open'
          },
          batch_document_ids: [work1.id, work2.id]
        }
      end

      it 'adds the embargo to all works' 

    end

    context 'when adding a lease' do
      let(:parameters) do
        {
          update_type: 'update',
          batch_edit_item: {
            visibility: 'lease',
            visibility_during_lease: 'open',
            lease_expiration_date: '2020-01-09',
            visibility_after_lease: 'restricted'
          },
          batch_document_ids: [work1.id, work2.id]
        }
      end

      it 'adds the lease to all works' 

    end

    context 'when removing an embargo' do
      let(:work1) { create(:private_work, :with_public_embargo, depositor: user.login, embargo_release_date: (Time.zone.today + 7.days)) }
      let(:work2) { create(:private_work, :with_public_embargo, depositor: user.login, embargo_release_date: (Time.zone.today + 3.days)) }

      let(:parameters) do
        {
          update_type:        'update',
          batch_edit_item:    { visibility: 'authenticated' },
          batch_document_ids: [work1.id, work2.id]
        }
      end

      it 'deactivates the embargo in all works' 

    end

    context 'when removing a lease' do
      let(:work1) { create(:private_work, :with_public_lease, depositor: user.login, lease_expiration_date: (Time.zone.today + 7.days)) }
      let(:work2) { create(:private_work, :with_public_lease, depositor: user.login, lease_expiration_date: (Time.zone.today + 3.days)) }

      let(:parameters) do
        {
          update_type:        'update',
          batch_edit_item:    { visibility: 'authenticated' },
          batch_document_ids: [work1.id, work2.id]
        }
      end

      it 'deactivates the embargo in all works' 

    end
  end
end

