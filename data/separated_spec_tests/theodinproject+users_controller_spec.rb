require 'rails_helper'

RSpec.describe UsersController do
  let(:user) { FactoryBot.create(:user) }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe 'GET show' do
    it 'renders the users profile page' 


    it 'assigns @user' 

  end

  describe 'PUT update' do
    let(:serialized_user) {
      {
        'id' => user.id,
        'admin' => false,
        'username' => 'Joey',
        'email' => user.email,
      }
    }

    it 'renders the user in json format' 

  end
end

