require 'rails_helper'

describe SiteController do
  describe '.basic_info' do
    it 'is visible always even for sites requiring login' 

  end

  describe '.statistics' do
    it 'is visible for sites requiring login' 


    it 'is not visible if site setting share_anonymized_statistics is disabled' 

  end

  describe '.selectable_avatars' do
    before do
      SiteSetting.selectable_avatars = "https://www.discourse.org\nhttps://meta.discourse.org"
    end

    it 'returns empty array when selectable avatars is disabled' 


    it 'returns an array when selectable avatars is enabled' 

  end
end

