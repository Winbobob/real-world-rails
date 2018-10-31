require "rails_helper"

describe TagsController do
  let(:user) { create(:user) }
  before do
    stub_login_as user
    allow(controller).to receive(:require_logged_in_admin)
  end

  context 'create' do
    it 'creates new tags' 


    it 'does not create a new tag when the name is blank' 


    it 'creates new tags with expected params' 


    it 'creates a moderation with the expected tag_id and user_id' 

  end

  context 'update' do
    let(:tag) { Tag.first }

    it 'updates tags with valid params' 


    it 'does not update tags when the new name is blank' 


    it 'rejects updates with unpermiited params' 


    it 'updates with all permitted params' 


    it 'creates a moderation with the expected user_id' 

  end
end

