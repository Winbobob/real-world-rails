# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "admin_user/show.html.erb" do

  before do
    info_requests = []
    allow(info_requests).to receive(:total_pages).and_return(0)
    assign :info_requests, info_requests
    assign :admin_user, user_being_viewed
    assign :comments, []
  end

  context 'when the current user cannot login as the user being viewed' do
    let(:current_user){ FactoryGirl.create(:admin_user) }
    let(:user_being_viewed){ FactoryGirl.create(:pro_user) }

    it 'should not show the list of post redirects' 


  end

  context 'when the current user can login as the user being viewed' do
    let(:current_user){ FactoryGirl.create(:pro_admin_user) }
    let(:user_being_viewed){ FactoryGirl.create(:pro_user) }

    it 'should show the list of post redirects' 


  end

end

