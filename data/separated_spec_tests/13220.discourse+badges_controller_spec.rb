require 'rails_helper'

describe BadgesController do
  let!(:badge) { Fabricate(:badge) }
  let(:user) { Fabricate(:user) }

  before do
    SiteSetting.enable_badges = true
  end

  context 'index' do
    it 'should return a list of all badges' 

  end

  context 'show' do
    it "should return a badge" 


    it "should mark the notification as viewed" 


    it 'renders rss feed of a badge' 

  end
end

