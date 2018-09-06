require 'spec_helper_min'

describe 'Carto::OverquotaUsersService' do
  before(:all) do
    @user = FactoryGirl.create(:carto_user, account_type: 'NOT_FREE')
    @user2 = FactoryGirl.create(:carto_user, account_type: 'FREE')
  end

  after(:all) do
    @user.destroy
    @user2.destroy
  end

  # Filter overquota users to only those created by this spec
  def overquota(delta = 0)
    service = Carto::OverquotaUsersService.new
    $users_metadata.del(service.send(:date_key))
    service.store_overquota_users(delta)
    users = service.get_stored_overquota_users.map { |u| u['id'] }.select { |uid| [@user.id, @user2.id].include?(uid) }

    users
  end

  it "should return users near their geocoding quota" 


  it "should return users near their here isolines quota" 


  it "should return users near their data observatory snapshot quota" 


  it "should return users near their data observatory general quota" 

  it "should return users near their twitter quota" 


  it "should not return organization users" 

end

