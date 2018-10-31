# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController, type: :controller do
  controller do
    include AccountControllerConcern

    def success
      head 200
    end
  end

  before do
    routes.draw { get 'success' => 'anonymous#success' }
  end

  context 'when account is suspended' do
    it 'returns http gone' 

  end

  context 'when account is not suspended' do
    it 'assigns @account' 


    it 'sets link headers' 


    it 'returns http success' 

  end
end

