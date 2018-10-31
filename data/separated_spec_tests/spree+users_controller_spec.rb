require 'spec_helper'

module Spree
  describe Api::V1::UsersController, type: :controller do
    render_views

    let(:user) { create(:user, spree_api_key: rand.to_s) }
    let(:stranger) { create(:user, email: 'stranger@example.com') }
    let(:attributes) { [:id, :email, :created_at, :updated_at] }

    context 'as a normal user' do
      it 'can get own details' 


      it 'cannot get other users details' 


      it 'can learn how to create a new user' 


      it 'can create a new user' 


      # there's no validations on LegacyUser?
      xit 'cannot create a new user with invalid attributes' do
        api_post :create, user: {}, token: user.spree_api_key
        expect(response.status).to eq(422)
        expect(json_response['error']).to eq('Invalid resource. Please fix errors and try again.')
      end

      it 'can update own details' 


      it 'cannot update other users details' 


      it 'can delete itself' 


      it 'cannot delete other user' 


      it 'only gets own details on index' 

    end

    context 'as an admin' do
      before { stub_authentication! }

      sign_in_as_admin!

      it 'gets all users' 


      it 'can control the page size through a parameter' 


      it 'can query the results through a paramter' 


      it 'can create' 


      it 'can destroy user without orders' 


      it 'cannot destroy user with orders' 

    end
  end
end

