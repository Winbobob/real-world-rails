# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CommentController, "when commenting on a request" do
  render_views

  describe 'dealing with embargoed requests' do
    let(:user) { FactoryBot.create(:user) }
    let(:pro_user) { FactoryBot.create(:pro_user) }
    let(:embargoed_request) do
      FactoryBot.create(:embargoed_request, user: pro_user)
    end

    context "when the user is not logged in" do
      it 'returns a 404 when the info request is embargoed' 

    end

    context "when the user is logged in but not the request owner" do
      before do
        session[:user_id] = user.id
      end

      it 'returns a 404 when the info request is embargoed' 

    end

    context "when the user is the request owner" do
      before do
        session[:user_id] = pro_user.id
      end

      it 'allows them to comment' 

    end
  end

  it "should give an error and render 'new' template when body text is just some whitespace" 


  it "should show preview when input is good" 


  it "should redirect to sign in page when input is good and nobody is logged in" 


  it "should create the comment, and redirect to request page when input is good and somebody is logged in" 


  it "should give an error if the same request is submitted twice" 


  it "should not allow comments if comments are not allowed on the request" 


  it "should not allow comments if comments are not allowed globally" 


  it "allows the comment to be re-edited" 


  it "should not allow comments from banned users" 


  describe 'when handling a comment that looks like spam' do

    let(:user) { FactoryBot.create(:user,
                                :locale => 'en',
                                :name => 'bob',
                                :confirmed_not_spam => false) }
    let(:body) { FactoryBot.create(:public_body) }
    let(:request) { FactoryBot.create(:info_request) }

    context 'when block_spam_comments? is true' do

      before(:each) do
        allow(@controller).to receive(:block_spam_comments?).and_return(true)
      end

      it 'sends an exception notification' 


      it 'shows an error message' 


      it 'renders the compose interface' 


      it 'allows the comment if the user is confirmed not spam' 


    end

    context 'when block_spam_comments? is false' do

      before(:each) do
        allow(@controller).to receive(:block_spam_comments?).and_return(false)
      end

      it 'sends an exception notification' 


      it 'allows the comment' 


    end

  end

  describe 'when commenting on an external request' do

    describe 'when responding to a GET request on a successful request' do

      before do
        @external_request = info_requests(:external_request)
        @external_request.described_state = 'successful'
        @external_request.save!
      end

      it 'should be successful' 


    end

  end

  context 'when commenting on an embargoed request' do
    let(:pro_user) { FactoryBot.create(:pro_user) }
    let(:embargoed_request) do
      FactoryBot.create(:embargoed_request, user: pro_user)
    end

    it "sets @in_pro_area" 

  end

end

