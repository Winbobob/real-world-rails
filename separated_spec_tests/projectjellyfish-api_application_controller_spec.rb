require 'rails_helper'

describe ApplicationController do
  let(:default_params) { { format: :json } }

  controller do
    def index
      render nothing: true
    end
  end

  describe 'user authentication', type: :controller do
    it "returns a 401 if the user isn't logged in" 


    it 'allows an access token sent as a request varible' 


    it 'allows an access token sent in the headers' 

  end
end

