require_relative '../../spec_helper'
require_relative '../../../lib/carto/user_db_size_cache'

describe Carto::UserDbSizeCache do
  let(:user_mock) do
    OpenStruct.new(id: 'kk', username: 'myusername', db_size_in_bytes: 123)
  end

  let(:umrc) do
    Carto::UserDbSizeCache.new
  end

  let(:redis_key) do
    umrc.send(:db_size_in_bytes_key, user_mock.username)
  end

  before(:each) do
    $users_metadata.del(redis_key)
  end

  describe '#update_if_old' do
    it 'sets db_size_in_bytes for users that have not been updated in 2 days' 


    it 'does not set db_size_in_bytes for users that have been updated in an hour' 

  end

  describe '#db_size_in_bytes_change_users' do
    it 'returns db_size_in_bytes_change in a hash with username keys' 

  end
end

