require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    before_action :do_not_cache
    before_action :set_cors_headers, if: :json_request?

    def index
      render text: 'OK'
    end
  end

  let(:cache_control) { response.headers['Cache-Control'] }
  let(:x_ua_compatible) { response.headers['X-UA-Compatible'] }

  let(:access_control_allow_origin) { response.headers['Access-Control-Allow-Origin'] }
  let(:access_control_allow_methods) { response.headers['Access-Control-Allow-Methods'] }
  let(:access_control_allow_headers) { response.headers['Access-Control-Allow-Headers'] }

  it "reloads the site instance on every request" 


  it "reloads the parliament instance on every request" 


  it "sets cache control headers when asked" 


  it "sets X-UA-Compatible control headers" 


  it "sets CORS headers for json requests" 


  context "when the site is disabled" do
    before do
      expect(Site).to receive(:enabled?).and_return(false)
    end

    it "raises a Site::ServiceUnavailable error" 

  end

  context "when the site is protected" do
    context "and the request is local" do
      before do
        expect(request).to receive(:local?).and_return(true)
        expect(Site).not_to receive(:protected?)
      end

      it "does not request authentication" 

    end

    context "and the request is not local" do
      before do
        expect(request).to receive(:local?).and_return(false)
        expect(Site).to receive(:protected?).and_return(true)
      end

      it "requests authentication" 

    end

    context "and the request is authenticated" do
      before do
        http_authentication "username", "password"

        expect(request).to receive(:local?).and_return(false)
        expect(Site).to receive(:protected?).and_return(true)
        expect(Site).to receive(:authenticate).with("username", "password").and_return(true)
      end

      it "responds with 200 OK" 

    end
  end

  context '#public_petition_facets' do
    it 'extracts the list of public facets from the locale file' 


    it 'is a helper method' 

  end

  context "when the url has an invalid format" do
    let(:exception) { URI::InvalidURIError.new }

    before do
      allow(request).to receive(:format).and_return(nil)
      allow(request).to receive(:original_url).and_return("https://petition.parliament.uk/petitions.json]")
    end

    it "redirects to the home page" 

  end
end

