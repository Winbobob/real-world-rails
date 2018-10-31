
require 'spec_helper'

describe 'roles filer' do

  let!(:pq_user) { create(:user, name: 'pquser', email:'pq@admin.com', password: 'password123') }
  let!(:finance_user) { create(:user, name: 'finance', email:'f@admin.com', password: 'password123', roles: User::ROLE_FINANCE) }
  let!(:fake_role_user) { create(:user, name: 'fake', email:'m@admin.com', password: 'password123', roles: 'BAD') }

  before(:each) do
    @token_service = TokenService.new
  end

  it 'PQUserFilter should allow to access a user with a PQ ROLE' 


  it 'PQUserFilter should not allow to access a user without a PQ ROLE' 


  it 'FinanceUserFilter should allow to access a user with a Finance ROLE' 


  it 'FinanceUserFilter should not allow to access a user without a Finance ROLE' 


end

