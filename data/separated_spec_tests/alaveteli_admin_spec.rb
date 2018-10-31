# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe "When administering the site" do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let(:bob_smith_user) { FactoryGirl.create(:user, :name => 'Bob Smith') }
  let(:robin_user) { FactoryGirl.create(:user, :name => 'Robin') }

  before do
    allow(AlaveteliConfiguration).to receive(:skip_admin_auth).and_return(false)
    confirm(:admin_user)
    @admin = login(:admin_user)
  end

  it "allows an admin to log in as another user" 


  it 'does not allow a non-admin user to login as another user' 


  it "allows redelivery of an incoming message to a closed request" 


  it "allows redelivery of an incoming message to more than one request" 


  describe "the debug page" do
    it "should show the current user name" 


    it "should show the current Alaveteli version" 

  end

  describe 'when administering the holding pen' do

    it "shows a rejection reason for an incoming message from an invalid address" 


    it "guesses a misdirected request" 

  end

  describe 'generating an upload url' do

    it 'shows a flash message with instructions on forwarding the url' 


  end

  describe 'hide and notify' do

    let(:user) { FactoryGirl.create(:user, :name => "Awkward > Name") }
    let(:request) { FactoryGirl.create(:info_request, :user => user) }

    it 'sets the prominence of the request to requester_only' 


    it 'renders a message to confirm the requester has been notified' 


  end

end

