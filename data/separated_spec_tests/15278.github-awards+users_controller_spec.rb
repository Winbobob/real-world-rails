require "rails_helper"

describe Api::V0::UsersController, :users_api_spec do

  def response_hash
    @response_body = JSON.parse(response.body)
  end

  before(:each) do
    @vdaubry = FactoryGirl.create(:user, gravatar_url: 'url', login: 'vdaubry', city: 'paris', country: 'france')
    FactoryGirl.create(:repository, language: 'ruby', user: @vdaubry)

    @nunogoncalves = FactoryGirl.create(:user, gravatar_url: 'url', login: 'nunogoncalves', city: 'lisbon', country: 'portugal')
    FactoryGirl.create(:repository, name: 'ios app', language: 'swift', user: @nunogoncalves, stars: 2)
    FactoryGirl.create(:repository, name: 'macos app', language: 'swift', user: @nunogoncalves, stars: 2)
    FactoryGirl.create(:repository, name: 'rails', language: 'ruby', user: @nunogoncalves, stars: 3)

    @walterwhite = FactoryGirl.create(:user, login: 'walterwhite', city: 'albuquerque', country: 'usa')
    FactoryGirl.create(:repository, language: 'javascript', user: @walterwhite, stars: 4)

    @sherlockholmes = FactoryGirl.create(:user, login: 'sherlockholmes', city: 'san francisco', country: 'us', gravatar_url: 'url')
    FactoryGirl.create(:repository, language: 'javascript', user: @sherlockholmes, stars: 5)

    @bb8 = FactoryGirl.create(:user, login: 'bb8', city: 'Los Angeles', country: 'us', gravatar_url: 'url')
    FactoryGirl.create(:repository, language: 'c++', user: @bb8, stars: 5)


    $redis.zadd("user_ruby_paris", 1.1, @vdaubry.id)
    $redis.zadd("user_ruby", 1.1, @vdaubry.id)
    $redis.zadd("user_swift_lisbon", 5.0, @nunogoncalves.id)
    $redis.zadd("user_swift", 5.0, @nunogoncalves.id)
    $redis.zadd("user_javascript_albuquerque", 0.2, @walterwhite.id)
    $redis.zadd("user_javascript", 0.2, @walterwhite.id)
    $redis.zadd("user_javascript_san_francisco", 0.5, @sherlockholmes.id)
    $redis.zadd("user_javascript", 0.5, @sherlockholmes.id)
    $redis.zadd("user_c++_los_angeles", 0.7, @bb8.id)
    $redis.zadd("user_c++", 0.7, @bb8.id)
  end

  context 'GET#index' do

    it 'should return status 200' 


    context 'with scope' do
      it 'should return 1 user' 


      it 'should return propper user information' 


      it 'should return c++ users when request has url encoded plus sign' 

    end

    context 'without scope' do
      it 'should return 1 user' 


      it 'should return propper user information' 

    end

    context 'pagination metadata' do
      it 'should return pagination metadata' 

    end
  end

  context 'GET#show' do
    it 'should return status 200' 


    it 'should return proper user information' 


    it 'should return propper ranking information', :t do
      get :show, login: 'nunogoncalves'
      user_rankings = response_hash['user']['rankings']

      expect(user_rankings.length).to be(2)

      expect(user_rankings[0]['language']).to eq('swift')
      expect(user_rankings[0]['repository_count']).to eq(2)
      expect(user_rankings[0]['stars_count']).to eq(4)
      expect(user_rankings[0]['city_rank']).to eq(1)
      expect(user_rankings[0]['city_count']).to eq(1)
      expect(user_rankings[0]['country_rank']).to eq(1)
      expect(user_rankings[0]['country_count']).to eq(1)
      expect(user_rankings[0]['world_rank']).to eq(1)
      expect(user_rankings[0]['world_count']).to eq(1)

      expect(user_rankings[1]['language']).to eq('ruby')
      expect(user_rankings[1]['repository_count']).to eq(1)
      expect(user_rankings[1]['stars_count']).to eq(3)
      expect(user_rankings[1]['city_rank']).to eq(1)
      expect(user_rankings[1]['city_count']).to eq(1)
      expect(user_rankings[1]['country_count']).to eq(1)
      expect(user_rankings[1]['country_rank']).to eq(1)
      expect(user_rankings[1]['world_rank']).to eq(1)
      expect(user_rankings[1]['world_count']).to eq(2)

    end
  end
end

