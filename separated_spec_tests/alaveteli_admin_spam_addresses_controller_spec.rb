# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AdminSpamAddressesController do
  render_views
  before { basic_auth_login @request }

  describe 'GET index' do

    it 'lists the spam addresses' 


    it 'creates a new spam address for the form' 


    it 'renders the index template' 


  end

  describe 'POST create' do

    let(:spam_params) { FactoryGirl.attributes_for(:spam_address) }

    it 'creates a new spam address with the given parameters' 


    it 'redirects to the index action if successful' 


    it 'notifies the admin the spam address has been created' 


    it 'renders the index action if the address could not be saved' 


    it 'collects the spam addresses if the address could not be saved' 


  end

  describe 'DELETE destroy' do

    before(:each) do
      @spam = FactoryGirl.create(:spam_address)
      delete :destroy, :id => @spam.id
    end

    it 'finds the spam address to delete' 


    it 'destroys the spam address' 


    it 'tells the admin the spam address has been deleted' 


    it 'redirects to the index action' 


  end

end

