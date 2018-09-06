# frozen_string_literal: true

require 'rails_helper'

describe DonationBandsController do
  let(:donation_band) { instance_double('DonationBand', name: 'Test') }

  before do
    allow(DonationBand).to receive(:find) { donation_band }
  end

  include_examples 'session authentication',
                   [{ get:  [:index] },
                    { get:  [:new] },
                    { get:  [:edit, params: { id: 1 }] }]

  describe 'GET index' do
    it 'authenticates session' 


    it 'renders index' 

  end

  describe 'GET new' do
    before do
      allow(DonationBand).to receive(:new) { donation_band }
      get :new
    end

    it 'authenticates session' 


    it 'instantiates instance of DonationBand' 


    it 'assigns donation_band' 


    it 'renders new' 

  end

  describe 'GET edit' do
    before do
      get :edit, params: { id: 1 }
    end

    it 'authenticates session' 


    it 'instantiates an instance of DonationBand' 


    it 'assigns donation_band' 


    it 'renders edit' 

  end

  describe 'POST create' do
    let(:fake_params) { { name: 'Test name', amounts: '1 2 3 4 5' } }
    let(:converted_params) { { name: 'Test name', amounts: [1, 2, 3, 4, 5] } }

    before do
      allow(DonationBand).to receive(:create) { donation_band }
      post :create, params: { donation_band: fake_params }
    end

    it 'authenticates session' 


    it 'creates a new donation_band' 


    it 'responds with notice' 


    it 'assigns donation_band' 


    it 'redirects to donation_band' 

  end
end

