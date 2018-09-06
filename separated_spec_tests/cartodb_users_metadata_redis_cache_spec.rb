require_relative '../../spec_helper'
require_relative '../../../lib/carto/user_db_size_cache'

describe Carto::UserDbSizeCache do
  let(:user_mock) do
    OpenStruct.new(id: 'kk', username: 'myusername', db_size_in_bytes: 123)
  end

  let(:updatable_user_mock) do
    user_mock.stubs(:dashboard_viewed_at).returns(Time.now.utc - 2.days)
    user_mock
  end

  let(:umrc) do
    Carto::UserDbSizeCache.new
  end

  describe '#update_if_old' do
    it 'sets db_size_in_bytes for users that have not seen the dashboard in 2 days' 


    it 'does not set db_size_in_bytes for users that have seen the dashboard in 2 hours' 

  end

  describe '#db_size_in_bytes_change_users' do
    it 'returns db_size_in_bytes_change in a hash with username keys' 

  end
end

