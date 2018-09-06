require 'spec_helper'
require 'openfarm_errors'

describe GuidesController do
  it 'directs to a new page' 


  it 'renders a show page' 


  it 'should show the edit page if the user owns the guide' 


  it 'should redirect to the guide if the user does not own it' 


  it 'should access logged in user profile page when accessing index' 


  it 'should access root page when accessing index not logged in' 


  # disabling impressionist for now because it's a likely
  # culprit for slowing everything really down on the server.
  # ~ Simon 07/2016
  # it 'should add an impression if a user shows the guide' do
  #   guide = FactoryGirl.create(:guide)
  #   user = FactoryGirl.create(:user)
  #   sign_in user
  #   get 'show', id: guide.id
  #   guide.reload
  #   expect(guide.impressions_field).to eq(1)
  #   expect(response.status).to eq(200)
  # end

  # it 'should add an impression if a guide is shown without a session' do
  #   guide = FactoryGirl.create(:guide)
  #   get 'show', id: guide.id
  #   guide.reload
  #   expect(guide.impressions_field).to eq(1)
  #   expect(response.status).to eq(200)
  # end

  # it 'should not add an impression if a guide is shown with same session' do
  #   guide = FactoryGirl.create(:guide)
  #   get 'show', id: guide.id
  #   get 'show', id: guide.id
  #   guide.reload
  #   expect(guide.impressions_field).to eq(1)
  #   expect(response.status).to eq(200)
  # end

  it 'should delete a guide' 


  it 'should not delete a guide if the user does not own it' 


  it 'shows a 404 on DocumentNotFound' 

end

