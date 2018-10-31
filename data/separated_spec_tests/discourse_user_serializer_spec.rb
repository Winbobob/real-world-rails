require 'rails_helper'
require_dependency 'user'

describe UserSerializer do

  context "with a TL0 user seen as anonymous" do
    let(:user) { Fabricate.build(:user, trust_level: 0, user_profile: Fabricate.build(:user_profile)) }
    let(:serializer) { UserSerializer.new(user, scope: Guardian.new, root: false) }
    let(:json) { serializer.as_json }

    let(:untrusted_attributes) { %i{bio_raw bio_cooked bio_excerpt location website website_name profile_background card_background} }

    it "doesn't serialize untrusted attributes" 

  end

  context "as current user" do
    it "serializes options correctly" 

  end

  context "with a user" do
    let(:user) { Fabricate.build(:user, user_profile: Fabricate.build(:user_profile)) }
    let(:serializer) { UserSerializer.new(user, scope: Guardian.new, root: false) }
    let(:json) { serializer.as_json }

    it "produces json" 


    context "with `enable_names` true" do
      before do
        SiteSetting.enable_names = true
      end

      it "has a name" 

    end

    context "with `enable_names` false" do
      before do
        SiteSetting.enable_names = false
      end

      it "has a name" 

    end

    context "with filled out card background" do
      before do
        user.user_profile.card_background = 'http://card.com'
      end

      it "has a profile background" 

    end

    context "with filled out profile background" do
      before do
        user.user_profile.profile_background = 'http://background.com'
      end

      it "has a profile background" 

    end

    context "with filled out website" do
      context "when website has a path" do
        before do
          user.user_profile.website = 'http://example.com/user'
        end

        it "has a website with a path" 


        it "returns complete website name with path" 

      end

      context "when website has a subdomain" do
        before do
          user.user_profile.website = 'http://subdomain.example.com/user'
        end

        it "has a website with a subdomain" 


        it "returns website name with the subdomain" 

      end

      context "when website has www" do
        before do
          user.user_profile.website = 'http://www.example.com/user'
        end

        it "has a website with the www" 


        it "returns website name without the www" 

      end

      context "when website includes query parameters" do
        before do
          user.user_profile.website = 'http://example.com/user?ref=payme'
        end

        it "has a website with query params" 


        it "has a website name without query params" 

      end

      context "when website is not a valid url" do
        before do
          user.user_profile.website = 'invalid-url'
        end

        it "has a website with the invalid url" 


        it "has a nil website name" 

      end
    end

    context "with filled out bio" do
      before do
        user.user_profile.bio_raw = 'my raw bio'
        user.user_profile.bio_cooked = 'my cooked bio'
      end

      it "has a bio" 


      it "has a cooked bio" 

    end
  end

  context "with custom_fields" do
    let(:user) { Fabricate(:user) }
    let(:json) { UserSerializer.new(user, scope: Guardian.new, root: false).as_json }

    before do
      user.custom_fields['secret_field'] = 'Only for me to know'
      user.custom_fields['public_field'] = 'Everyone look here'
      user.save
    end

    it "doesn't serialize the fields by default" 


    it "serializes the fields listed in public_user_custom_fields site setting" 

  end
end

