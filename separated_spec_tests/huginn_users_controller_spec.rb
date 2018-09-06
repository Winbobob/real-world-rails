require 'rails_helper'

describe Admin::UsersController do
  describe 'POST #create' do
    context 'with valid user params' do
      it 'imports the default scenario for the new user' 

    end
    
    context 'with invalid user params' do
      it 'does not import the default scenario' 

    end
  end

  describe 'GET #switch_to_user' do
    it "switches to another user" 


    it "does not switch if not admin" 

  end

  describe 'GET #switch_back' do
    it "switches to another user and back" 


    it "does not switch_back without having switched" 

  end
end

