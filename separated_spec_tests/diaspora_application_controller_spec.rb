# frozen_string_literal: true

#   Copyright (c) 2010-2012, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe ApplicationController, :type => :controller do
  controller do
    def index
      head :ok
    end
  end

  before do
    sign_in alice
  end

  describe '#set_diaspora_headers' do
    it 'sets the version header' 


    context 'with git info' do
      before do
        allow(AppConfig).to receive(:git_available?).and_return(true)
        allow(AppConfig).to receive(:git_update).and_return('yesterday')
        allow(AppConfig).to receive(:git_revision).and_return('02395')
      end

      it 'sets the git header' 

    end
  end

  describe '#mobile_switch' do
    it 'sets the format to :mobile' 


    it 'uses :html for :tablets' 


    it "doesn't mess up other formats, like json" 


    it "doesn't mess up other formats, like xml, even with :mobile session" 

  end

  describe '#tags' do
    before do
      @tag = ActsAsTaggableOn::Tag.create!(:name => "partytimeexcellent")
      TagFollowing.create!(:tag => @tag, :user => alice)
    end

    it 'queries current_users tag if there are tag_followings' 


    it 'does not query twice' 

  end

  describe "#after_sign_in_path_for" do
    context 'getting started true on user' do
      before do
        alice.update_attribute(:getting_started, true)
      end

      it "redirects to getting started if the user has getting started set to true and a blank profile" 

    end

    context "getting started true and one tag present on user" do
      before do
        alice.update_attribute(:getting_started, true)
        @tag = ActsAsTaggableOn::Tag.create!(name: "partytimeexcellent")
        allow(@controller).to receive(:current_user).and_return(alice)
        TagFollowing.create!(tag: @tag, user: alice)
      end

      it "redirects to stream if the user has getting started set to true and has already added tags" 

    end

    context "getting started true and user image present on user" do
      before do
        alice.update_attribute(:getting_started, true)
        # Just set the image url...
        alice.profile.image_url = "something not nil"
        allow(@controller).to receive(:current_user).and_return(alice)
      end

      it "redirects to stream if the user has getting started set to true and has already added a photo" 

    end
  end

  describe "#after_sign_out_path_for" do
    it "can handle a nil HTTP_USER_AGENT" 

  end

  describe "#set_grammatical_gender" do
    it "is called on page load" 


    context "for inflected locales" do
      before do
        alice.language = :pl
        alice.save
      end

      it "returns nil for an empty gender" 


      it "returns nil for an unrecognized gender" 


      it "sets the correct grammatical gender" 

    end
  end
end
