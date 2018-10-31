require 'rails_helper'

describe EmbedController do

  let(:host) { "eviltrout.com" }
  let(:embed_url) { "http://eviltrout.com/2013/02/10/why-discourse-uses-emberjs.html" }
  let(:embed_url_secure) { "https://eviltrout.com/2013/02/10/why-discourse-uses-emberjs.html" }
  let(:discourse_username) { "eviltrout" }

  it "is 404 without an embed_url" 


  it "raises an error with a missing host" 


  context "by topic id" do
    let(:headers) { { 'REFERER' => 'http://eviltrout.com/some-page' } }

    before do
      Fabricate(:embeddable_host)
    end

    it "allows a topic to be embedded by id" 

  end

  context "#info" do
    context "without api key" do
      it "fails" 

    end

    context "with api key" do

      let(:api_key) { ApiKey.create_master_key }

      context "with valid embed url" do
        let(:topic_embed) { Fabricate(:topic_embed, embed_url: embed_url) }

        it "returns information about the topic" 

      end

      context "without invalid embed url" do
        it "returns error response" 

      end
    end
  end

  context "with a host" do
    let!(:embeddable_host) { Fabricate(:embeddable_host) }
    let(:headers) { { 'REFERER' => embed_url } }

    before do
      SiteSetting.queue_jobs = false
    end

    it "raises an error with no referer" 


    it "includes CSS from embedded_scss field" 


    context "success" do
      after do
        expect(response.status).to eq(200)
        expect(response.headers['X-Frame-Options']).to eq("ALLOWALL")
      end

      it "tells the topic retriever to work when no previous embed is found" 


      it "displays the right view" 


      it "creates a topic view when a topic_id is found" 


      it "provides the topic retriever with the discourse username when provided" 


    end
  end

  context "with multiple hosts" do
    before do
      Fabricate(:embeddable_host)
      Fabricate(:embeddable_host, host: 'http://discourse.org')
      Fabricate(:embeddable_host, host: 'https://example.com/1234', class_name: 'example')
    end

    context "success" do
      it "works with the first host" 


      it "works with the second host" 


      it "works with a host with a path" 


      it "contains custom class name" 


      it "doesn't work with a made up host" 

    end
  end
end

