# encoding: utf-8

require 'sequel'
require 'rack/test'
require_relative '../../../spec_helper'
require_relative '../../api/json/synchronizations_controller_shared_examples'
require_relative '../../../../app/controllers/carto/api/synchronizations_controller'

describe Carto::Api::SynchronizationsController do
  include Rack::Test::Methods
  include Warden::Test::Helpers
  include CacheHelper

  it_behaves_like 'synchronization controllers' do
  end

  describe 'main behaviour' do
    # INFO: this tests come from spec/requests/api/json/synchronizations_controller_spec.rb

    before(:all) do
      @old_resque_inline_status = Resque.inline
      Resque.inline = false
      @user = create_user(
        sync_tables_enabled: true
      )
      @api_key = @user.api_key
    end

    before(:each) do
      @db = SequelRails.connection
      Sequel.extension(:pagination)

      CartoDB::Synchronization.repository = DataRepository::Backend::Sequel.new(@db, :synchronizations)

      bypass_named_maps
      delete_user_data @user
      @headers = {
        'CONTENT_TYPE' => 'application/json'
      }
      host! "#{@user.username}.localhost.lan"
    end

    after(:all) do
      Resque.inline = @old_resque_inline_status
      bypass_named_maps
      @user.destroy
    end

    describe 'GET /api/v1/synchronizations/:id' do
      it 'returns a synchronization record' 


      it 'returns 404 for unknown synchronizations' 

    end

    describe 'GET /api/v1/synchronizations/:id/sync_now' do
      it 'returns sync status' 

    end

    describe 'GET /api/v1/synchronizations/' do
      it 'returns sync list' 

    end
  end

end

