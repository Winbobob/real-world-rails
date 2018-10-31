require "rails_helper"

RSpec.describe AssetsController, type: :controller do
  render_views
  fixtures :assets, :users
  include ActiveJob::TestHelper

  context "edit" do
    it 'should allow user to upload new version of song' 

  end

  context "#mass_edit" do
    it 'should allow user to edit 1 track' 


    it 'should allow user to edit 2 tracks at once' 


    it 'should not allow user to edit other peoples tracks' 

  end

  context "#update" do
    before do
      login(:arthur)
    end

    it 'should allow user to update track title and description' 


    it 'should call out to rakismet on update' 


    it 'should force a track to be private if it is spam' 

  end
end

