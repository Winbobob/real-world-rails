require 'rails_helper'

shared_examples_for "asciicast iframe response" do
  it "responds with status 200" 


  it "responds with html content type" 


  it "responds without X-Frame-Options header" 


  it "responds with player page using iframe layout" 

end

describe "Asciicast retrieval" do

  let(:asciicast) { create(:asciicast) }

  context "when requested as js" do
    before do
      get "/a/#{asciicast.id}.js"
    end

    it "responds with status 302" 

  end

  context "when requested as html" do
    include Capybara::RSpecMatchers

    before do
      get "/a/#{asciicast.to_param}/embed", format: 'html'
    end

    it_behaves_like "asciicast iframe response"

    context "for private asciicast" do
      let(:asciicast) { create(:asciicast, private: true) }

      it_behaves_like "asciicast iframe response"
    end
  end

end

