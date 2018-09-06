require 'rails_helper'

describe Api::UserConfigsController, type: :controller do

  before :each do
    @user = FactoryBot.create :user,
                               show_main_tour: true,
                               show_mobile_tour: true,
                               show_feed_tour: true,
                               show_entry_tour: true,
                               show_kb_shortcuts_tour: true
    login_user_for_unit @user
  end

  context 'GET show' do

    it 'returns success' 

  end

  context 'PATCH update' do

    it 'returns success' 


    context 'all flags' do

      it 'updates all config flags' 

    end

    context 'show_main_tour flag' do

      it 'updates flag' 


      it 'does not update flag if a wrong param value is passed' 

    end

    context 'show_mobile_tour flag' do

      it 'updates flag' 


      it 'does not update flag if a wrong param value is passed' 

    end

    context 'show_feed_tour flag' do

      it 'updates flag' 


      it 'does not update flag if a wrong param value is passed' 

    end

    context 'show_entry_tour flag' do

      it 'updates flag' 


      it 'does not update flag if a wrong param value is passed' 

    end

    context 'show_kb_shortcuts_tour flag' do

      it 'updates flag' 


      it 'does not update flag if a wrong param value is passed' 

    end
  end

end

