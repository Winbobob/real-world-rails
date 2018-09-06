# frozen_string_literal: true

require 'rails_helper'
require 'spree/testing_support/factories/state_factory'

RSpec.describe 'state factory' do
  let(:factory_class) { Spree::State }

  describe 'plain state' do
    let(:factory) { :state }

    it_behaves_like 'a working factory'

    it 'is Alabama' 

  end

  describe 'when given a country iso code' do
    let(:state) { build(:state, country_iso: "DE") }

    it 'creates the first state for that country it finds in carmen' 


    context 'of an existing country' do
      let!(:country){ create(:country, iso: "DE") }
      it 'uses the existing country in the database' 

    end
  end

  describe 'when given a country record' do
    let(:country) { build(:country, iso: "DE") }
    let(:state) { build(:state, country: country) }
    it 'creates the first state for that country it finds in carmen' 

  end

  describe 'when given an invalid country iso code' do
    it 'raises a helpful message' 

  end

  context 'with a country that does not have subregions' do
    it 'raises an exception' 

  end
end

