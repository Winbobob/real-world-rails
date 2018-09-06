require 'rails_helper'

describe "Profile" do
  let(:user) { create(:user, password: "MyPassword") }
  let(:new_password) { "Blueberry23" }
  let!(:railsbridge) { create :organization, name: "RailsBridge" }

  before do
    sign_in_as(user)
    visit edit_user_registration_path
  end

  it "allows user to change their name and gender" 


  it "allows use to update their mailing list preferences" 


  it "shows errors when changes cannot be saved" 


  describe "when a user has only oauth set up (no password)" do
    let(:user) do
      build(:user, password: '').tap do |u|
        u.authentications.build(provider: 'github', uid: 'abcdefg')
        u.save!
      end
    end

    it "allows a password to be added" 

  end

  context 'when a user has both a password and oauth set up' do
    let(:user) do
      build(:user, password: 'MyPassword').tap do |u|
        u.authentications.build(provider: 'github', uid: 'abcdefg')
        u.save!
      end
    end

    it "allows password to be changed" 

  end

  context "when changing your password" do
    it "is successful when password matches confirmation" 


    it "is unsuccessful when password and confirmation don't match" 


    it "is unsuccessful when current password not provided" 


    it "is unsuccessful when current password is incorrect" 

  end

  context "when changing your email address" do
    let!(:old_email) { user.email }
    let!(:new_email) { "floppy_ears@railsbridge.example.com" }

    it "is successful when correct current password is provided" 


    it "is unsuccessful when correct current password is missing" 


    it "is unsuccessful when correct current password is incorrect" 

  end
end

