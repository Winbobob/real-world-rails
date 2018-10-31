require 'rails_helper'

describe ClicksController do
  context 'create' do
    context 'missing params' do
      it 'raises a 404 without a url' 

    end

    context 'correct params' do
      let(:url) { "https://discourse.org/" }
      let(:headers) { { REMOTE_ADDR: "192.168.0.1" } }
      let(:post) { create_post(raw: "this is a post with a link #{url}") }

      context "with a made up url" do
        it "doesn't redirect" 

      end

      context "with a valid url" do
        it "redirects" 

      end

      context 'with a post_id' do
        it 'redirects' 


        it "redirects links in whispers to staff members" 


        it "doesn't redirect with the redirect=false param" 

      end

      context 'with a topic_id' do
        it 'redirects' 

      end
    end
  end
end

