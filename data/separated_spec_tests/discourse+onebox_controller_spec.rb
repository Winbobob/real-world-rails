require 'rails_helper'

describe OneboxController do

  let(:url) { "http://google.com" }

  it "requires the user to be logged in" 


  describe "logged in" do
    let(:user) { Fabricate(:user) }
    let(:html) do
      html = <<~HTML
        <html>
        <head>
          <meta property="og:title" content="Onebox1">
          <meta property="og:description" content="this is bodycontent">
        </head>
        <body>
           <p>body</p>
        </body>
        <html>
      HTML
      html
    end

    let(:html2) do
      html = <<~HTML
        <html>
        <head>
          <meta property="og:title" content="Onebox2">
          <meta property="og:description" content="this is bodycontent">
        </head>
        <body>
           <p>body</p>
        </body>
        <html>
      HTML
      html
    end

    def bypass_limiting
      Oneboxer.onebox_previewed!(user.id)
    end

    before do
      sign_in(user)
    end

    it 'invalidates the cache if refresh is passed' 


    describe "cached onebox" do
      it "returns the cached onebox response in the body" 

    end

    describe "only 1 outgoing preview per user" do
      it "returns 429" 

    end

    describe "found onebox" do
      it 'returns the onebox response in the body' 

    end

    describe "missing onebox" do
      it "returns 404 if the onebox is nil" 


      it "returns 404 if the onebox is an empty string" 

    end

    describe "local onebox" do
      it 'does not cache local oneboxes' 

    end

    it 'does not onebox when you have no permission on category' 


    it 'does not allow onebox of PMs' 


    it 'does not allow whisper onebox' 


    it 'allows onebox to public topics/posts in PM' 

  end
end

