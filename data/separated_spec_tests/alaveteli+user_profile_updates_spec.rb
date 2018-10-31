# -*- encoding : utf-8 -*-
require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe 'Updating your user profile' do

  let(:user) { FactoryBot.create(:user) }

  describe 'updating about_me text' do

    context "no profile picture set" do

      it "page displays thank you message with nudge to upload photo" 


    end

    context "with profile picture set" do

      before do
        user.create_profile_photo!(:data => load_file_fixture('parrot.png'))
      end

      it "displays a thank you message without upload photo nudge" 


    end

  end

  describe 'adding a photo' do

    let(:photo_file) { File.absolute_path('./spec/fixtures/files/parrot.jpg') }

    context "no about_me text set" do

      it "page displays thank you message with nudge to upload photo" 


    end

    context "with about_me text set" do

      before do
        user.about_me = "I am a test user"
      end

      it "page displays thank you message with nudge to upload photo" 


    end
  end

end

