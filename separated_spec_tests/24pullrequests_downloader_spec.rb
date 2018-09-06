require 'rails_helper'

describe Downloader do
  let(:user) { FactoryBot.create(:user) }
  let(:downloader) { Downloader.new(user) }
  let(:gifttoday) { user.gift_for(Time.zone.today) }

  describe '#get_organisations' do
    before do
      user_downloader = double(:user_downloader, user_organisations: [double_organisation])
      allow(downloader).to receive(:user_downloader).and_return(user_downloader)
    end

    it "creates a copy of all the user's organisations" 

  end

  describe '#get_pull_requests' do
    let(:pull_request) { mock_pull_request }

    before do
      user_downloader = double(:user_downloader, pull_requests: [pull_request])
      allow(downloader).to receive(:user_downloader).and_return(user_downloader)
    end

    it "creates a copy of all the user's pull requests" 


    it 'when the pull request does not already exist it creates it' 


    it "when the pull request already exists it doesn't recreate it" 


    it "when the pull request already exists it updates it" 


    it "when there are no gifts for today it gifts a pull request" 

  end

  def double_organisation
    double(:organisation,
           id:    2,
           _rels: { avatar: double(:avatar, href: 'href') },
           login: 'kobol')
  end
end

