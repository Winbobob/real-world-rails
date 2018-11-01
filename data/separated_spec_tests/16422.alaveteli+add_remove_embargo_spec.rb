# -*- encoding : utf-8 -*-
require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../alaveteli_dsl')

describe 'Adding/removing embargoes from requests' do

  let(:pro_user) { FactoryBot.create(:pro_user) }
  let(:user) { FactoryBot.create(:user) }
  let!(:user_session) { login(user) }

  describe "adding an embargo to a request" do

    let!(:info_request) do
      FactoryBot.create(:info_request, user: pro_user,
                                       title: 'My awesome request')
    end

    it 'removes the request from the search results' 


  end

  describe 'removing an embargo from a request' do

    let!(:info_request) do
      request = FactoryBot.create(:info_request, user: pro_user,
                                                 title: 'My embargoed request')
      FactoryBot.create(:embargo, info_request: request)
      request
    end

    it 'adds the request to the search results' 


  end
end

