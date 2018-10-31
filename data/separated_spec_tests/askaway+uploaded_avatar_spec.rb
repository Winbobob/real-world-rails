require 'rails_helper'

describe 'UploadedAvatar' do
  let(:user) { FactoryGirl.create(:user) }
  let(:placeholder) { FactoryGirl.create(:placeholder) }

  describe '#avatar_selection_choices' do
    before do
      user.uploaded_avatar = StringIO.new('test.jpeg')
      user.uploaded_avatar_content_type = 'image/jpeg'
      user.save!
    end
    context 'user has twitter & facebook identity and uploaded avatar' do
      it 'returns twitter, facebook, uploaded, and placeholder choice' 

    end
    context 'user has uploaded avatar' do
      it 'returns uploaded and placeholder choice' 

    end
    context 'user has nothing' do
      before do
        user.uploaded_avatar.clear
        user.save!
      end
      it 'returns placeholder choice' 

    end
  end

  describe '#selected_avatar_type=' do
    it 'only allows specified types' 

  end

  describe "#select_avatar!" do
    context 'user tries to select identity that doesnt belong to them' do
      it 'adds error to selected_avatar_identity' 

    end
  end

  describe "#avatar_url" do
    context 'user has not selected an avatar' do
      it "returns placeholder picture, but does not select it" 

      it "returns (and selects) identity.image_url if user has identity" 

      it "returns (and selects) uploaded_avatar if user has one" 

    end

    context 'user has selected an avatar' do
      before do
        user.uploaded_avatar = StringIO.new('test.jpeg')
        user.uploaded_avatar_content_type = 'image/jpeg'
        user.save!
        @identity = FactoryGirl.create(:identity, uid: '12345', provider: 'twitter', user: user)
      end
      it 'returns identity.image url if selected' 

      it 'returns uploaded_avatar url if selected' 

      it 'returns placeholder url if selected' 

    end
  end
end

