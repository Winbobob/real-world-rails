require 'rails_helper'

RSpec.describe Admin::InstancesController, type: :controller do
  render_views

  before do
    sign_in Fabricate(:user, admin: true), scope: :user
  end

  describe 'GET #index' do
    around do |example|
      default_per_page = Account.default_per_page
      Account.paginates_per 1
      example.run
      Account.paginates_per default_per_page
    end

    it 'renders instances' 

  end
end

