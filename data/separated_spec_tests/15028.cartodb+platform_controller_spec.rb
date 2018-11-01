# encoding: utf-8

require_relative '../../acceptance_helper'
require_relative '../../../app/controllers/superadmin/platform_controller'

describe Superadmin::PlatformController do
  before(:all) do
    @dbhost = '127.0.0.127'
    CartoDB::UserModule::DBService.any_instance.stubs(:enable_remote_db_user).returns(true)
    @user1 = FactoryGirl.create(:valid_user)
    @user2 = FactoryGirl.create(:valid_user)
    [@user1, @user2].each do |u|
      u.database_host = @dbhost
      u.save
    end
  end

  after(:all) do
    @user1.destroy
    @user2.destroy
  end

  describe '#databases info' do
    it 'returns just one database info if passed as argument' 


    it 'returns just two databases info if none passed as argument' 

  end

  describe '#database validation' do
    it 'returns 400 if request doesnt have database_host' 


    it 'validate for database checking for active users using metadata' 


    it 'validate for database checking for one active and one migrated user' 

  end
end

