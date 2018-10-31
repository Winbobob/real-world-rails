require 'rails_helper'

describe UploadsController do

  context '.create' do

    it 'requires you to be logged in' 


    context 'logged in' do

      before { @user = log_in :user }

      let(:logo) do
        Rack::Test::UploadedFile.new(file_from_fixtures("logo.png"))
      end

      let(:fake_jpg) do
        Rack::Test::UploadedFile.new(file_from_fixtures("fake.jpg"))
      end

      let(:text_file) do
        Rack::Test::UploadedFile.new(File.new("#{Rails.root}/LICENSE.txt"))
      end

      it 'expects a type' 


      it 'can look up long urls' 


      it 'is successful with an image' 


      it 'is successful with an attachment' 


      it 'is successful with api' 


      it 'correctly sets retain_hours for admins' 


      it 'requires a file' 


      it 'properly returns errors' 


      it 'ensures allow_uploaded_avatars is enabled when uploading an avatar' 


      it 'ensures sso_overrides_avatar is not enabled when uploading an avatar' 


      it 'allows staff to upload any file in PM' 


      it 'respects `authorized_extensions_for_staff` setting when staff upload file' 


      it 'ignores `authorized_extensions_for_staff` setting when non-staff upload file' 


      it 'returns an error when it could not determine the dimensions of an image' 


    end

  end

  context '.show' do

    let(:site) { "default" }
    let(:sha) { Digest::SHA1.hexdigest("discourse") }

    it "returns 404 when using external storage" 


    it "returns 404 when the upload doesn't exist" 


    it 'uses send_file' 


    it "handles file without extension" 


    context "prevent anons from downloading files" do

      before { SiteSetting.prevent_anons_from_downloading_files = true }

      it "returns 404 when an anonymous user tries to download a file" 


    end

  end

end

