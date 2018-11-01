require 'rails_helper'

describe UserGuardian do

  let :user do
    Fabricate.build(:user, id: 1)
  end

  let :moderator do
    Fabricate.build(:moderator, id: 2)
  end

  let :admin do
    Fabricate.build(:admin, id: 3)
  end

  let :user_avatar do
    UserAvatar.new(user_id: user.id)
  end

  let :users_upload do
    Upload.new(user_id: user_avatar.user_id, id: 1)
  end

  let :already_uploaded do
    u = Upload.new(user_id: 999, id: 2)
    user_avatar.custom_upload_id = u.id
    u
  end

  let :not_my_upload do
    Upload.new(user_id: 999, id: 3)
  end

  let(:moderator_upload) do
    Upload.new(user_id: moderator.id, id: 4)
  end

  describe '#can_pick_avatar?' do

    let :guardian do
      Guardian.new(user)
    end

    context 'anon user' do
      let(:guardian) { Guardian.new }

      it "should return the right value" 

    end

    context 'current user' do
      it "can not set uploads not owned by current user" 


      it "can handle uploads that are associated but not directly owned" 

    end

    context 'moderator' do

      let :guardian do
        Guardian.new(moderator)
      end

      it "is secure" 

    end

    context 'admin' do
      let :guardian do
        Guardian.new(admin)
      end

      it "is secure" 

    end
  end

  describe "#can_see_profile?" do

    it "is false for no user" 


    it "is true for a user whose profile is public" 


    context "hidden profile" do
      let(:hidden_user) do
        result = Fabricate(:user)
        result.user_option.update_column(:hide_profile_and_presence, true)
        result
      end

      it "is false for another user" 


      it "is false for an anonymous user" 


      it "is true for the user themselves" 


      it "is true for a staff user" 


    end
  end
end

