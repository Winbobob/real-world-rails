require 'spec_helper'

describe Api::V1::UsersController, type: :controller do
  include ApiHelpers

  let(:viewing_user) { FactoryGirl.create(:confirmed_user) }
  let(:public_user) { FactoryGirl.create(:confirmed_user) }
  let(:private_user) { FactoryGirl.create(:confirmed_user, is_private: true) }

  it 'shows private user to an admin' 


  it 'does not show private user to an ordinary user' 


  it 'shows public users to a user' 


  # TODO: We don't actually implement this, so it doesn't make
  # sense as a test right now.
  # it 'shows basics to non-logged in users' do
  #   get 'show', id: public_user.id, format: :json
  #   expect(response.status).to eq(200)
  #   expect(json['data']['relationships']).to have_key('user_setting')
  #   expect(json['data']['relationships']['user_setting']).to
  #     not_have_key('data')
  # end

  it 'shows a favorite crop for a user' 


  it 'shows favorited_guides for a user' 


  it 'shows a favorite crop with images for a user' 


  it 'adds a featured image' 

end

