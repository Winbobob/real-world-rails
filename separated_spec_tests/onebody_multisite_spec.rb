require 'rails_helper'

describe 'MultiSite', type: :request do
  before do
    Site.current = Site.create!(name: 'Site One', host: 'host1')
    @user1 = FactoryGirl.create(:person, email: 'site1user@example.com', first_name: 'Jim', last_name: 'Williams')
    Site.current = Site.create!(name: 'Site Two', host: 'host2')
    @user2 = FactoryGirl.create(:person, email: 'site2user@example.com', first_name: 'Tom', last_name: 'Jones')
    Setting.set_global('Features', 'Multisite', true)
  end

  after do
    Setting.set_global('Features', 'Multisite', false)
    site! 'www.example.com'
    Site.current = Site.find(1)
  end

  it 'logs in' 


  it 'browses' 

end

