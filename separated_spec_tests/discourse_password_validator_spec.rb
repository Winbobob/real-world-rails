require 'rails_helper'
require_dependency "common_passwords/common_passwords"

describe PasswordValidator do

  def password_error_message(key)
    I18n.t("activerecord.errors.models.user.attributes.password.#{key.to_s}")
  end

  let(:validator) { described_class.new(attributes: :password) }
  subject(:validate) { validator.validate_each(record, :password, @password) }

  context "password required" do
    let(:record) { u = Fabricate.build(:user, password: @password); u.password_required!; u }

    context "password is not common" do
      before do
        CommonPasswords.stubs(:common_password?).returns(false)
      end

      context "min password length is 8" do
        before { SiteSetting.min_password_length = 8 }

        it "doesn't add an error when password is good" 


        it "adds an error when password is too short" 


        it "adds an error when password is blank" 


        it "adds an error when password is nil" 


        it "adds an error when user is admin and password is less than 15 chars" 

      end

      context "min password length is 12" do
        before { SiteSetting.min_password_length = 12 }

        it "adds an error when password length is 11" 

      end
    end

    context "password is commonly used" do
      before do
        SiteSetting.min_password_length = 8
        CommonPasswords.stubs(:common_password?).returns(true)
      end

      it "adds an error when block_common_passwords is enabled" 


      it "doesn't add an error when block_common_passwords is disabled" 

    end

    context "password_unique_characters is 5" do
      before do
        SiteSetting.password_unique_characters = 5
      end

      it "adds an error when there are too few unique characters" 


      it "doesn't add an error when there are enough unique characters" 


      it "counts capital letters as different" 

    end

    it "adds an error when password is the same as the username" 


    it "adds an error when password is the same as the email" 


    it "adds an error when new password is same as current password" 


    it "validation required if password is required" 


    it "validation not required after save until a new password is set" 

  end

  context "password not required" do
    let(:record) { Fabricate.build(:user, password: @password) }

    it "doesn't add an error if password is not required" 


    it "validation required if a password is set" 


    it "adds an error even password not required" 

  end

end

