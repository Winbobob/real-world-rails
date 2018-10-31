require 'rails_helper'

RSpec.describe Admin::AccountsController, type: :controller do
  render_views

  let(:user) { Fabricate(:user, admin: true) }

  before do
    sign_in user, scope: :user
  end

  describe 'GET #index' do
    around do |example|
      default_per_page = Account.default_per_page
      Account.paginates_per 1
      example.run
      Account.paginates_per default_per_page
    end

    it 'filters with parameters' 


    it 'paginates accounts' 


    it 'returns http success' 

  end

  describe 'GET #show' do
    let(:account) { Fabricate(:account, username: 'bob') }

    it 'returns http success' 

  end
end

