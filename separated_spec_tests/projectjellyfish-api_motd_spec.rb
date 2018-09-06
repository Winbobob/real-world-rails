require 'rails_helper'

RSpec.describe 'MOTD API' do
  let(:default_params) { { format: :json } }
  let(:motd) { create :motd }

  describe 'GET show' do
    it 'returns a the MOTD for an admin' 


    it 'returns a the MOTD for a user' 


    it 'returns a the MOTD for a guest' 

  end

  describe 'POST create' do
    it 'allows creation of an MOTD for an admin' 


    it 'prevents creation of an MOTD for a user' 


    it 'prevents creation of an MOTD for a guest' 

  end

  describe 'PUT update' do
    before(:each) do
      @motd = Motd.first
    end

    it 'allows an admin to make updates' 


    it 'prevents updates for a user' 


    it 'prevents updates for a guest' 

  end

  describe 'DELETE destroy' do
    it 'allows an admin to delete an MOTD' 


    it 'prevents deleting for a user' 


    it 'prevents deleting for a guest' 

  end
end

