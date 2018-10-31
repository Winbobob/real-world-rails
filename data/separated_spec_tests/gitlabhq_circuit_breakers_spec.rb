require 'spec_helper'

describe API::CircuitBreakers do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  describe 'GET circuit_breakers/repository_storage' do
    it 'returns a 401 for anonymous users' 


    it 'returns a 403 for users' 


    it 'returns an Array of storages' 


    describe 'GET circuit_breakers/repository_storage/failing' do
      it 'returns an array of failing storages' 

    end
  end

  describe 'DELETE circuit_breakers/repository_storage' do
    it 'clears all circuit_breakers' 

  end
end

