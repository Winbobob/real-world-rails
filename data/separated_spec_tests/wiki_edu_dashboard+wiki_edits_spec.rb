# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/wiki_edits"

describe WikiEdits do
  # We're not testing any of the network stuff, nor whether the requests are
  # well-formatted, but at least this verifies that the flow is parsing tokens
  # in the expected way.
  before do
    allow(Features).to receive(:disable_wiki_output?).and_return(false)
    create(:course,
           id: 1,
           submitted: true,
           slug: 'University/Course_(term)')
    create(:user,
           id: 1,
           wiki_token: 'foo',
           wiki_secret: 'bar')
    create(:user,
           id: 2,
           username: 'user2',
           wiki_token: 'foo',
           wiki_secret: 'bar')
    create(:courses_user,
           course_id: 1,
           user_id: 1)
    create(:courses_user,
           course_id: 1,
           user_id: 2)
  end

  let(:course) { Course.find(1) }

  it 'handles failed edits' 


  it 'handles edits that hit the abuse filter' 


  it 'handles unexpected responses' 


  it 'handles unexpected responses' 


  it 'handles failed token requests' 


  it 'handles edit requests that are blocked' 


  it 'handles edit requests that are autoblocked' 


  describe '.notify_untrained' do
    it 'posts talk page messages on Wikipedia' 

  end

  describe '.notify_users' do
    it 'posts talk page messages on Wikipedia' 

  end

  describe '.oauth_credentials_valid?' do
    it 'returns true if credentials are valid' 


    it 'returns false if credentials are invalid' 


    # By default, if a user is logged in, they are assumed to have valid tokens.
    # If there is a network problem, or other issue besides MediaWiki saying
    # that the auth is invalid, then we carry on.
    it 'returns true if Wikipedia API returns no tokens' 


    it 'returns true if Wikipedia API is down with 503 error' 


    it 'returns true if Wikipedia is down with 500 error' 

  end
end

