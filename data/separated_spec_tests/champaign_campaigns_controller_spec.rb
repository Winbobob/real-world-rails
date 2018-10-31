# frozen_string_literal: true

require 'rails_helper'

describe CampaignsController do
  let(:campaign) { instance_double('Campaign') }

  before do
    allow(Campaign).to receive(:find) { campaign }
  end

  include_examples 'session authentication',
                   [{ get:  [:index] },
                    { get:  [:new] },
                    { get:  [:edit, params: { id: 1 }] },
                    { get:  [:show, params: { id: 1 }] }]

  describe 'GET index' do
    it 'renders index' 

  end

  describe 'GET new' do
    before do
      allow(Campaign).to receive(:new) { campaign }
      get :new
    end

    it 'instantiates instance of Campaign' 


    it 'assigns campaign' 


    it 'renders new' 

  end

  describe 'GET edit' do
    before do
      get :edit, params: { id: 1 }
    end

    it 'instantiates instance of Campaign' 


    it 'assigns campaign' 


    it 'renders edit' 

  end

  describe 'GET show' do
    it 'finds campaign' 


    it 'assigns campaign' 

  end

  describe 'POST create' do
    let(:fake_params) { { 'name' => 'Foo' } }
    let(:campaign) { double(persisted?: true) }

    before do
      allow(CampaignCreator).to receive(:run) { campaign }
      post :create, params: { campaign: fake_params }
    end

    it 'authenticates session' 


    it 'calls CampaignCreator.run' 


    it 'responds with notice' 


    it 'assigns campaign' 


    it 'redirects to campaign' 

  end
end

