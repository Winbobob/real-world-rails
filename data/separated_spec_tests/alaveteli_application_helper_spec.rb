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

  describe 'when creating an event description' do

    it 'should generate a description for a request' 


    it 'should generate a description for a response' 


    it 'should generate a description for a request where an internal review has been requested' 


  end

end

