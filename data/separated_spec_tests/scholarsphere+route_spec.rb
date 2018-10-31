# frozen_string_literal: true

require 'rails_helper'

describe 'Routes', type: :routing do
  describe 'Homepage' do
    it 'routes the root url to the catalog controller' 

  end

  describe 'Catalog' do
    it 'routes to recently added files' 

  end

  describe 'Sessions' do
    it 'routes to logout' 


    it 'routes to login' 

  end

  describe 'Stats Export' do
    before do
      allow(Sufia::StatsAdmin).to receive(:matches?).and_return(true)
    end
    it 'routes to export' 

  end
end

