require 'rails_helper'

describe 'GET /api/.well-known/status' do
  context 'when everything is ok' do
    before(:each) do
      create(:loc_with_nil_fields)
      get '/api/.well-known/status'
    end

    it 'returns a 200 HTTP status' 


    it 'lists all dependencies' 


    it "returns 'ok' status" 


    it "returns 'updated' attribute set to current time as integer" 

  end

  context 'when everything is not ok' do
    before(:each) do
      get '/api/.well-known/status'
    end

    it "returns 'NOT OK' status" 


    it 'returns a 200 HTTP status' 


    it 'lists all dependencies' 


    it "returns 'updated' attribute set to current time as integer" 

  end
end

