require 'spec_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) do
    user = Fabricate.build(:user)
    user.badges << Fabricate.build(:badge, badge_class_name: 'Octopussy')
    user.save!
    user
  end

  let(:github_response) { JSON.parse(File.read('./spec/fixtures/oauth/github_response.json')).with_indifferent_access }

  it 'should get user page by ignoring the case' 


  it 'multiple json requests should have same etag' 


  it 'should have different etags for json and jsonp' 


  it 'should save referral if first hit' 


  it 'should not save referral if they have already been to site' 


  describe 'tracking viral coefficient on signup' do
    it 'should add referred by if present in session to new user' 


    it 'should not add referred by if not present' 

  end

  it 'should tracking utm UTM_CAMPAIGN on signup' 


  it 'should capture utm_campaign if ever in params' 


  it 'applies oauth information to user on creation' 


  it 'extracts location from oauth' 


  it 'extracts blog if present from oauth' 


  it 'extracts joined date from oauth' 


  describe 'linkedin' do
    let(:linkedin_response) { JSON.parse(File.read('./spec/fixtures/oauth/linkedin_response.json')).with_indifferent_access }

    it 'setups up new user and redirects to signup page' 

  end

  describe 'twitter' do
    let(:twitter_response) { JSON.parse(File.read('./spec/fixtures/oauth/twitter_response.json')).with_indifferent_access }

    it 'setups up new user and redirects to signup page' 

  end
end

