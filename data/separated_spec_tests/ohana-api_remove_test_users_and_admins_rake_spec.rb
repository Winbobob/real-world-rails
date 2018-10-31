require 'rails_helper'

describe 'remove_test_users_and_admins' do
  include_context 'rake'

  before do
    create(:user)
    create(:admin)
    allow_any_instance_of(IO).to receive(:puts)
    Rails.application.load_seed
  end

  its(:prerequisites) { should include('environment') }

  it 'only removes 2 users' 


  it 'only removes the demo users' 


  it 'only removes 3 admins' 


  it 'only removes the demo admins' 


  it 'can be run multiple times' 

end

