# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AdminUsersAccountSuspensionsController do

  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user) }

    let(:valid_params) do
      { user_id: user.id, suspension_reason: 'Banned for spamming' }
    end

    context 'with valid params' do
      before { post :create, valid_params }

      it 'finds the user to suspend' 


      it 'sets the suspension reason' 


      it 'bans the user' 


      it 'tells the admin that the user was banned' 


      it 'redirects to the user page' 

    end

    context 'with invalid params' do
      it 'renders a 404' 

    end

    context 'without a suspension_reason' do
      before { post :create, user_id: user.id }

      it 'sets a default suspension reason' 

    end

  end

end

