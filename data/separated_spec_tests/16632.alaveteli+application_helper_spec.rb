# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationHelper do

  include ApplicationHelper
  include LinkToHelper

  describe '#can_ask_the_eu?' do

    it 'delegates to WorldFOIWebsites.can_ask_the_eu?' 


  end

  describe '#render_flash' do

    it 'returns a string when given a string' 


    it 'correctly resymbolizes the hash keys and calls render' 


  end

  describe '#read_asset_file' do

    it "raises an Exception if it can't find the file" 


    it 'returns the contents of the file if it finds the asset' 


    it 'returns the file content as UTF-8' 


  end

  describe '#theme_installed?' do

    let(:paths) { ['theme_path', 'app_path'] }

    let(:view_paths) { double(ActionView::PathSet, paths: paths) }

    it 'returns true if there is an installed theme' 


    context 'no theme is installed' do

      let(:paths) { ['app_path'] }

      it 'returns false' 


    end

  end

  describe '#theme_asset_exists?' do

    let(:theme_view_path) do
      File.dirname(__FILE__) + "/../../lib/themes/alavetelitheme/lib/views"
    end

    let(:app_view_path) { File.dirname(__FILE__) + "/../../app/views" }

    let(:paths) do
      [
        theme_view_path,
        app_view_path
      ]
    end

    let(:view_paths) { double(ActionView::PathSet, paths: paths) }

    it 'looks in the theme file path' 


    it 'returns false if the file does not exist' 


    it 'returns true if the file exists' 


    context 'without a theme installed' do

      let(:paths) { [ app_view_path ] }

      it 'looks in the core app file path' 


      it 'returns true if the file exists' 


    end

  end

  describe 'when creating an event description' do

    it 'should generate a description for a request' 


    it 'should generate a description for a response' 


    it 'should generate a description for a request where an internal review has been requested' 


  end

  describe 'site_wide_announcement' do
    let(:current_user) { FactoryBot.create(:user) }

    it 'calls scopes on Announcement' 

  end

end

