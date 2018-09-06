# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe PhotosController, :type => :controller do
  before do
    @alices_photo = alice.post(:photo, :user_file => uploaded_photo, :to => alice.aspects.first.id, :public => false)
    @bobs_photo = bob.post(:photo, :user_file => uploaded_photo, :to => bob.aspects.first.id, :public => true)

    sign_in alice, scope: :user
    request.env["HTTP_REFERER"] = ''
  end

  describe '#create' do
    before do
      @params = {
        :photo => {:aspect_ids => "all"},
        :qqfile => Rack::Test::UploadedFile.new(
          Rails.root.join("spec", "fixtures", "button.png").to_s,
          "image/png"
        )
      }
    end

    it 'accepts a photo from a regular form submission' 


    it 'returns application/json when possible' 


    it 'returns text/html by default' 

  end

  describe '#create' do
    before do
      allow(@controller).to receive(:file_handler).and_return(uploaded_photo)
      @params = {:photo => {:user_file => uploaded_photo, :aspect_ids => "all"} }
    end

    it "creates a photo" 


    it "doesn't allow mass assignment of person" 


    it "doesn't allow mass assignment of person_id" 


    it 'can set the photo as the profile photo' 

  end

  describe '#index' do
    it "succeeds without any available pictures" 


    it "succeeds on mobile devices without any available pictures" 


    it "succeeds on mobile devices with available pictures" 


    it "displays the logged in user's pictures" 


    it "displays another person's pictures" 


    it "displays the correct number of photos" 


    it "returns json when requested" 


    it 'displays by date of creation' 


    context "with no user signed in" do
      before do
        sign_out :user
        @person = bob.person
      end

      it "succeeds" 


      it "succeeds on the mobile site" 


      it "forces to sign in if the person is remote" 


      it "displays the correct number of photos" 


      it "displays a person's pictures" 

    end
  end

  describe '#destroy' do
    it "lets a user delete their message" 


    it 'will let you delete your profile picture' 


    it 'sends a retraction on delete' 


    it 'will not let you destroy posts visible to you' 


    it 'will not let you destroy posts you do not own' 

  end

  describe "#make_profile_photo" do
    it 'should return a 201 on a js success' 


    it 'should return a 422 on failure' 

  end

  describe "#show" do
    it 'should return 404 for nonexistent stuff on mobile devices' 


    it 'should return 200 for existing stuff on mobile devices' 


    it "doesn't leak private photos to the public" 

  end

end

