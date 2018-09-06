require 'spec_helper'

describe LocksController do
  include_context :logged_in_as_user
  before do
    # We have to create all the lock types.... Could be improved ;)
    ['U-lock', 'Chain with lock', 'Cable', 'Locking skewer', 'Other style'].each do |name|
      LockType.create(name: name)
    end
  end
  let(:manufacturer) { FactoryGirl.create(:manufacturer) }
  let(:lock) { FactoryGirl.create(:lock) }
  let(:owner_lock) { FactoryGirl.create(:lock, user: user) }
  let(:lock_type) { LockType.last }
  let(:valid_attributes) do
    {
      lock_type_id: lock_type.id,
      manufacturer_id: manufacturer.id,
      manufacturer_other: '',
      has_key: true,
      has_combination: false,
      key_serial: '321',
      combination: ''
    }
  end

  describe 'new' do
    it 'renders' 

  end

  describe 'edit' do
    context 'not lock owner' do
      it 'redirects to user_home' 

    end
    context 'lock owner' do
      it 'renders' 

    end
  end

  describe 'update' do
    context 'not lock owner' do
      it 'redirects to user_home' 

    end
    context 'lock owner' do
      it 'renders' 

    end
  end

  describe 'create' do
    context 'success' do
      it 'redirects you to user_home locks table' 

    end
  end

  describe 'destroy' do
    context 'not lock owner' do
      it 'redirects to user_home' 

    end
    context 'lock owner' do
      it 'renders' 

    end
  end
end

