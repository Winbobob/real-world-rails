# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "admin_public_body/show.html.erb" do
  let(:public_body){ FactoryBot.create(:public_body) }


  before do
    info_requests = []
    allow(info_requests).to receive(:total_pages).and_return(0)
    assign :public_body, public_body
    assign :info_requests, info_requests
    assign :versions, []
  end

  context 'when the user cannot view API keys ' do
    let(:current_user){ FactoryBot.create(:admin_user) }

    it 'does not display the API key' 


  end

  context 'when the user can view API keys' do
    let(:current_user){ FactoryBot.create(:pro_admin_user) }

    it 'displays the API key' 


  end

end

