require 'spec_helper'

describe Api::V2::Data::SessionsController do
  describe "GET 'last'" do
    before do
      FactoryGirl.create(:mobile_session)

      get :last
    end

    it 'returns id' 

  end
end

