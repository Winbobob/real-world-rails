require 'rails_helper'

describe OneboxController do

  let(:url) { "http://google.com" }

  it "requires the user to be logged in" 


  describe "logged in" do

    before { @user = log_in(:admin) }

    it 'invalidates the cache if refresh is passed' 


    describe "cached onebox" do

      it "returns the cached onebox response in the body" 


    end

    describe "only 1 outgoing preview per user" do

      it "returns 429" 


    end

    describe "found onebox" do

      let(:body) { "this is the onebox body" }

      before do
        Oneboxer.expects(:preview).returns(body)
        get :show, params: { url: url }, format: :json
      end

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

