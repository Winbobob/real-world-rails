require "rails_helper"

RSpec.describe PlaylistsController, 'permissions', type: :controller do
  fixtures :playlists, :users

  it "should show a playlist" 


  it "should NOT let a not-logged person edit a playlist" 


  it "should not let a not-logged in user update their playlist" 


  %i[sort_tracks add_track remove_track attach_pic].each do |postable|
    it "should forbid any modification of playlist via #{postable} by non logged in" 

  end

  it "should not mistake a playlist for belonging to a user when it doesn't" 


  it "should not let any old logged in user edit their playlist" 


  it 'should let a user edit their own playlist' 


  context "sorting" do
    it 'should display albums to sort' 


    it 'should allow sorting of playlists' 

  end

  context "deletion" do
    it "should not let a non-logged in person delete a playlist" 


    it 'should not let any old user delete a playlist' 


    it 'should let an admin delete any playlist' 


    it 'should let a user delete their own playlist' 

  end

  context "add new pic" do
    it "should let a user upload a playlist photo" 


    it "should not let a user upload a new photo for another user" 


    it "should break the homepage cache" 

  end
end

RSpec.describe PlaylistsController, "sharing and exporting", type: :controller do
  fixtures :playlists, :users

  it "should deliver us tasty xml for single playlist" 

end

def edit_sudaras_playlist
  # a little ghetto, rspec won't honor string ids
  get :edit, params: { id: 1, permalink: 'owp', user_id: 'sudara' }
end

def edit_arthurs_playlist
  get :edit, params: { id: 2, permalink: 'arthurs-playlist', user_id: 'arthur' }
end

