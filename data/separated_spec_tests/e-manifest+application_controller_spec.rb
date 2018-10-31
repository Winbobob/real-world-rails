require 'rails_helper'

describe ApplicationController do
  controller do
    def index
      render json: user_session
    end
  end

  describe 'user session' do
    it 'extends life of session each time user makes a request' 


    it 'respects Authorization header' 

  end
end

