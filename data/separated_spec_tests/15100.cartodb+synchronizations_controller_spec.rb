# encoding: utf-8

require_relative '../../../spec_helper'
require_relative 'synchronizations_controller_shared_examples'
require_relative '../../../../app/controllers/api/json/synchronizations_controller'

describe Api::Json::SynchronizationsController do
  include_context 'users helper'

  it_behaves_like 'synchronization controllers' do
  end

  before(:each) do
    login(@user1)
    @user1.sync_tables_enabled = true
    @user1.save
  end

  describe '#create' do
    let(:params) do
      {
        url: "fake_url",
        interval: 3600,
        content_guessing: true,
        type_guessing: true,
        create_vis: false
      }
    end

    describe 'for users without sync tables' do
      before(:each) do
        @user1.sync_tables_enabled = false
        @user1.save
      end

      it 'returns 401' 


      it 'creates a synchronization and enqueues a import job for external sources' 

    end

    it 'creates a synchronization and enqueues a import job' 

  end

  describe '#sync_now' do
    it 'syncs... now :D' 

  end

  describe '#update' do
    it 'updates the interval' 

  end

  describe '#destroy' do
    it 'destroys a sync' 

  end
end


