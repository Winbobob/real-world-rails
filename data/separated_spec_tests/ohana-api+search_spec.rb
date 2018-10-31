require 'rails_helper'

describe "GET 'search'" do
  context 'with valid keyword only' do
    before :all do
      @loc = create(:location)
      @nearby = create(:nearby_loc)
      @loc.update(updated_at: Time.zone.now - 1.day)
      @nearby.update(updated_at: Time.zone.now - 1.hour)
    end

    before :each do
      get api_search_index_url(keyword: 'jobs', per_page: 1, subdomain: ENV['API_SUBDOMAIN'])
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns a successful status code' 


    it 'is json' 


    it 'returns locations' 


    it 'is a paginated resource' 


    it 'returns an X-Total-Count header' 


    it 'sorts by updated_at when results have same full text search rank' 

  end

  describe 'specs that depend on :farmers_market_loc factory' do
    before(:all) do
      create(:farmers_market_loc)
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    context 'with radius too small but within range' do
      it 'returns the farmers market name' 

    end

    context 'with radius too big but within range' do
      it 'returns the farmers market name' 

    end

    context 'with radius not within range' do
      it 'returns an empty response array' 

    end

    context 'with invalid zip' do
      it 'returns no results' 

    end

    context 'with invalid location' do
      it 'returns no results' 

    end
  end

  describe 'specs that depend on :location factory' do
    before(:all) do
      create(:location)
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    context 'with invalid radius' do
      before :each do
        get api_search_index_url(location: '94403', radius: 'ads', subdomain: ENV['API_SUBDOMAIN'])
      end

      it 'returns a 400 status code' 


      it 'is json' 


      it 'includes an error description' 

    end

    context 'with invalid lat_lng parameter' do
      before :each do
        get api_search_index_url(lat_lng: '37.6856578-122.4138119', subdomain: ENV['API_SUBDOMAIN'])
      end

      it 'returns a 400 status code' 


      it 'includes an error description' 

    end

    context 'with invalid (non-numeric) lat_lng parameter' do
      before :each do
        get api_search_index_url(lat_lng: 'Apple,Pear', subdomain: ENV['API_SUBDOMAIN'])
      end

      it 'returns a 400 status code' 


      it 'includes an error description' 

    end

    context 'with plural version of keyword' do
      it "finds the plural occurrence in location's name field" 


      it "finds the plural occurrence in location's description field" 

    end

    context 'with singular version of keyword' do
      it "finds the plural occurrence in location's name field" 


      it "finds the plural occurrence in location's description field" 

    end
  end

  describe 'specs that depend on :location and :nearby_loc' do
    before(:all) do
      create(:location)
      create(:nearby_loc)
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    context 'when keyword only matches one location' do
      it 'only returns 1 result' 

    end

    context "when keyword doesn't match anything" do
      it 'returns no results' 

    end

    context 'with keyword and location parameters' do
      it 'only returns locations matching both parameters' 

    end

    context 'when keyword parameter has multiple words' do
      it 'only returns locations matching all words' 

    end
  end

  context 'lat_lng search' do
    it 'returns one result' 

  end

  context 'with singular version of keyword' do
    it 'finds the plural occurrence in organization name field' 


    it "finds the plural occurrence in service's keywords field" 

  end

  context 'with plural version of keyword' do
    it 'finds the plural occurrence in organization name field' 


    it "finds the plural occurrence in service's keywords field" 

  end

  context 'when keyword matches category name' do
    before(:each) do
      create(:far_loc)
      create(:loc_with_nil_fields)
      cat = create(:category)
      create_service
      @service.category_ids = [cat.id]
      @service.save!
    end

    it 'boosts location whose services category name matches the query' 

  end

  context 'with org_name parameter' do
    before(:each) do
      create(:nearby_loc)
      create(:location)
      create(:soup_kitchen)
    end

    it 'returns results when org_name only contains one word that matches' 


    it 'only returns locations whose org name matches all terms' 


    it 'allows searching for both org_name and location' 


    it 'allows searching for blank org_name and location' 

  end

  context 'when email parameter contains custom domain' do
    it "finds domain name when url contains 'www'" 


    it 'finds naked domain name' 


    it 'finds long domain name in both url and email' 


    it 'finds domain name when URL contains path' 


    it 'finds domain name when URL contains multiple paths' 


    it 'finds domain name when URL contains a dash' 


    it 'finds domain name when URL contains a number' 


    it 'returns locations where either email or admins fields match' 


    it 'does not return locations if email prefix is the only match' 

  end

  context 'when email parameter contains generic domain' do
    it "doesn't return results for gmail domain" 


    it "doesn't return results for aol domain" 


    it "doesn't return results for hotmail domain" 


    it "doesn't return results for yahoo domain" 


    it "doesn't return results for sbcglobal domain" 


    it 'does not return locations if domain is the only match' 


    it 'returns results if admin email matches parameter' 


    it 'returns results if email matches parameter' 

  end

  context 'when email parameter only contains generic domain name' do
    it "doesn't return results" 

  end

  describe 'sorting search results' do
    context 'sort when only location is present' do
      it 'sorts by distance by default' 

    end
  end

  context 'when location has missing fields' do
    it 'includes attributes with nil or empty values' 

  end
end

