# frozen_string_literal: true

describe Admin::UsersController, :type => :controller do
  before do
    @user = FactoryGirl.create :user
    Role.add_admin(@user.person)

    sign_in @user, scope: :user
  end

  describe '#close_account' do
    it 'queues a job to disable the given account' 

  end

  describe '#lock_account' do
    it 'it locks the given account' 

  end

  describe '#unlock_account' do
    it 'it unlocks the given account' 

  end

end

