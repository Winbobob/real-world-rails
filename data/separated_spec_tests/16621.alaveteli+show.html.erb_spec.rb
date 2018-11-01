# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "admin_request/show.html.erb" do

  before do
    assign :info_request, info_request
  end

  context 'for a public request' do
    let(:info_request){ FactoryBot.create(:info_request) }

    it 'links to the public request page' 


    it 'does not include embargoed label' 


  end

  context 'for an embargoed request' do
    let(:info_request){ FactoryBot.create(:embargoed_request) }

    it 'links to the pro request page' 


    it 'includes embargo information' 


    it 'includes embargoed label' 


  end

end

