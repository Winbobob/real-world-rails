# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TrackController do
  let(:mock_cookie) { '0300fd3e1177127cebff' }

  describe 'GET #track_request' do
    let(:info_request) do
      FactoryGirl.create(:info_request,
                          :title => 'My request',
                          :url_title => 'myrequest')
    end
    let(:track_thing) do
      FactoryGirl.create(:request_update_track,
                         :info_request => info_request,
                         :track_medium => 'email_daily',
                         :track_query => 'example')
    end
    let(:user) { FactoryGirl.create(:user, :locale => 'en', :name => 'bob') }

    it 'clears widget votes for the request' 


    it "should require login when making new track" 


    it "should set no-cache headers on the login redirect" 


    it "should save a request track and redirect if you are logged in" 


    it "should 404 for non-existent requests" 


    it "should 404 for embargoed requests" 


    context 'when getting feeds' do

      before do
        load_raw_emails_data
        get_fixtures_xapian_index
      end

      it "should get the RSS feed" 

          it "should get JSON version of the feed" 
    it "should save a search track and redirect to the right place" 


    it 'sets the flash message partial for a successful track' 


    it 'sets the flash message partial when the user is already tracking' 


    it "should redirect with an error message if the query is too long" 

  end

  describe "GET #track_public_body" do
    let(:public_body) { FactoryGirl.create(:public_body) }
    let(:user) { FactoryGirl.create(:user, :locale => 'en', :name => 'bob') }

    before do
      # these tests depend on the xapian index existing, although
      # not on its specific contents.
      load_raw_emails_data
      get_fixtures_xapian_index
    end

    it "should save a search track and redirect to the right place" 


    it "should redirect with an error message if the query is too long" 


    it "should work" 


    it "should filter by event type" 


  end

  describe "GET #track_user" do
    let(:target_user) { FactoryGirl.create(:user) }
    let(:user) { FactoryGirl.create(:user) }

    it "should save a user track and redirect to the right place" 


    it "should redirect with an error message if the query is too long" 


    it "should return NotFound for a non-existent user" 


  end

  describe "GET #track_list" do
    let(:user) { FactoryGirl.create(:user) }

    it "should save a list track and redirect to the right place" 


    it "should redirect with an error message if the query is too long" 

  end

  describe "PUT #update" do
    let(:track_thing) { FactoryGirl.create(:search_track) }

    it 'should destroy the track thing' 


    it 'should redirect to a URL on the site' 


    it 'should not redirect to a url on another site' 

  end

  describe 'POST #delete_all_type' do

    let(:track_thing) { FactoryGirl.create(:search_track) }

    context 'when the user passed in the params is not logged in' do

      it 'redirects to the signin page' 


    end

    context 'when the user passed in the params is logged in' do

      it 'deletes all tracks for the user of the type passed in the params' 


      it 'redirects to the redirect path in the param passed' 


      it 'shows a message telling the user what has happened' 


    end

  end
end

