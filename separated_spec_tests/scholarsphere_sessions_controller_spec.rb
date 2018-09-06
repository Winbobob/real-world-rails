# frozen_string_literal: true

require 'rails_helper'

describe SessionsController, type: :controller do
  describe 'routing' do
    it 'sends /logout to sessions#destroy' 

    it 'sends /login to sessions#new' 

  end
  describe '#destroy' do
    it 'redirects to the central logout page and destroy the cookie' 

  end
  describe '#new' do
    it 'redirects to the central login page' 


    context 'when user_return_to is set' do
      it 'does not redirect to the central login page' 

    end
  end
end

