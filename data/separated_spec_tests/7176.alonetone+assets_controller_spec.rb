require "rails_helper"
include ActiveJob::TestHelper

RSpec.describe AssetsController, type: :controller do
  render_views
  fixtures :assets, :users, :audio_features

  before :each do
    clear_enqueued_jobs
    clear_performed_jobs
  end

  context "new" do
    it 'should display limit reached flash for new users with >= 25 tracks' 

  end

  it 'should disable the form for new users with >= 24 tracks' 


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

  context "#show" do
    before :each do
      allow_any_instance_of(PreventAbuse).to receive(:is_a_bot?).and_return(false)
      login(:sudara)
    end

    it "should enqueue a CreateAudioFeature job if an asset does not have audio feature" 


    it "should NOT enqueue anything if feature is present" 


    it "should NOT enqueue anything if is_a_bot?" 

  end
end

