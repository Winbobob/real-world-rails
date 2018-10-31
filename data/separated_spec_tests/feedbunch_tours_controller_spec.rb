require 'rails_helper'

describe Api::ToursController, type: :controller do

  before :each do
    @user = FactoryBot.create :user
    login_user_for_unit @user
  end

  context 'GET show_main' do

    it 'returns success' 

  end

  context 'GET show_mobile' do

    it 'returns success' 

  end

end

