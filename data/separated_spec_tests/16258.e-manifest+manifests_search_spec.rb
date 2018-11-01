require 'rails_helper'
require "queryparams"

describe 'manifests search', elasticsearch: true do
  context 'ui' do
    it 'supports structured query syntax' 


    it 'paginates' 

  end

  context 'authorization' do
    it 'shows only public manifests for anon users with no query' 


    it 'allows anyone to search for public manifests' 


    it 'shows public + private manifests for authenticated user' 


    it 'allows authenticated user to see public + any manifests they created' 


    it 'filters by state if newer than 90 days and user has state_data_download role' 


    it 'epa_data_download may see all manifests regardless of org, state or date' 

  end
end

