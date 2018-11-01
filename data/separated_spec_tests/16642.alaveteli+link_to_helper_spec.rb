# -*- encoding : utf-8 -*-
require 'spec_helper'

describe LinkToHelper do
  include LinkToHelper

  describe 'when creating a url for a request' do
    let(:info_request) { FactoryBot.create(:info_request) }

    it 'should return a path like /request/test_title' 


    it 'should return a path including any extra parameters passed' 

  end

  describe 'when linking to new incoming messages' do
    let(:incoming_message) { FactoryBot.create(:incoming_message) }
    let(:info_request) { incoming_message.info_request }

    context 'for external links' do
      subject(:url) { incoming_message_url(incoming_message) }

      it 'generates the url to the info request of the message' 


      it 'includes an anchor to the new message' 


      it 'does not cache by default' 


      it 'includes a cache busting parameter if set' 


    end

    context 'for internal links' do
      subject(:path) { incoming_message_path(incoming_message) }

      it 'generates the incoming_message_url with the path only' 

    end
  end

  describe 'when linking to new responses' do
    context 'when the user is a pro' do
      let(:user) { FactoryBot.create(:pro_user) }
      let(:info_request) { FactoryBot.create(:info_request, user: user) }
      let(:incoming_message) do
        FactoryBot.create(:incoming_message, info_request: info_request)
      end

      it 'creates a sign in url to the cachebusted incoming message url' 

    end

    context 'when the user is a normal user' do
      let(:incoming_message) { FactoryBot.create(:incoming_message) }
      let(:info_request) { incoming_message.info_request }

      it 'creates a cachbusted incoming message url' 

    end
  end

  describe 'when linking to new outgoing messages' do
    let(:outgoing_message) { FactoryBot.create(:new_information_followup) }
    let(:info_request) { outgoing_message.info_request }

    subject(:url) { outgoing_message_url(outgoing_message) }

    context 'for external links' do
      it 'generates the url to the info request of the message' 


      it 'includes an anchor to the new message' 


      it 'does not cache by default' 


      it 'includes a cache busting parameter if set' 

    end

    context 'for internal links' do
      it 'generates the outgoing_message_url with the path only' 

    end
  end

  describe 'when displaying a user link for a request' do
    context "for external requests" do
      let(:info_request) do
        FactoryBot.create(:external_request, :external_user_name => nil)
      end

      it 'should return the text "Anonymous user" with a link to the privacy
          help pages when there is no external username' do
        expected = '<a href="/help/privacy#anonymous">Anonymous user</a>'
        expect(request_user_link(info_request)).to eq(expected)
      end

      it 'should return a link with an alternative text if requested' 


      it 'should display an absolute link if requested' 

    end

    context "for normal requests" do
      let(:info_request) { FactoryBot.create(:info_request) }
      let(:user) { info_request.user }

      it 'should display a relative link by default' 


      it 'should display an absolute link if requested' 

    end
  end

  describe 'when displaying a user admin link for a request' do
    let(:info_request) do
      FactoryBot.create(:external_request, :external_user_name => nil)
    end

    it 'should return the text "An anonymous user (external)" in the case
        where there is no external username' do
      expected = 'Anonymous user (external)'
      expect(user_admin_link_for_request(info_request)).to eq(expected)
    end
  end
end

