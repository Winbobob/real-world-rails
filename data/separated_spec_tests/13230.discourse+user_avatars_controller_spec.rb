require 'rails_helper'

describe UserAvatarsController do

  context 'show_proxy_letter' do
    it 'returns not found if external avatar is set somewhere else' 


    it 'returns an avatar if we are allowing the proxy' 

  end

  context 'show' do

    context 'invalid' do
      after do
        FileUtils.rm(Discourse.store.path_for(upload))
      end
      # travis is not good here, no image magick
      if !ENV["TRAVIS"]
        let :upload do
          File.open("#{Rails.root}/spec/fixtures/images/cropped.png") do |f|
            UploadCreator.new(
              f,
              "test.png"
            ).create_for(-1)
          end
        end

        let :user do
          user = Fabricate(:user)
          user.user_avatar.update_columns(custom_upload_id: upload.id)
          user.update_columns(uploaded_avatar_id: upload.id)
          user
        end

        it 'automatically corrects bad avatar extensions' 

      end

    end

    it 'handles non local content correctly' 


    it 'serves a correct last modified for render blank' 


    it 'serves image even if size missing and its in local mode' 

  end
end

