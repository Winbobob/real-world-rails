# frozen_string_literal: true

describe ResharesController, :type => :controller do
  describe '#create' do
    let(:post_request!) {
      post :create, params: {root_guid: @post_guid}, format: :json
    }

    before do
      @post = FactoryGirl.create(:status_message, :public => true)
      @post_guid = @post.guid
    end

    it 'requires authentication' 


    context 'with an authenticated user' do
      before do
        sign_in(bob, scope: :user)
        allow(@controller).to receive(:current_user).and_return(bob)
      end

      it 'succeeds' 


      it 'creates a reshare' 


      it "federates" 


      context 'resharing a reshared post' do
        before do
          FactoryGirl.create(:reshare, :root => @post, :author => bob.person)
        end

        it 'doesn\'t allow the user to reshare the post again' 

      end

      context 'resharing another user\'s reshare' do
        before do
          @root = @post
          @post = FactoryGirl.create(:reshare, :root => @root, :author => alice.person)
        end

        it 'reshares the absolute root' 

      end
    end
  end

  describe "#index" do
    context "with a private post" do
      before do
        @alices_aspect = alice.aspects.where(name: "generic").first
        @post = alice.post(:status_message, text: "hey", to: @alices_aspect.id)
      end

      it "returns a 404 for a post not visible to the user" 


      it "returns an empty array for a post visible to the user" 

    end

    context "with a public post" do
      before do
        sign_in(alice, scope: :user)
        @post = alice.post(:status_message, text: "hey", public: true)
      end

      it "returns an array of reshares for a post" 


      it "returns an empty array for a post with no reshares" 


      it "returns reshares without login" 

    end
  end
end

