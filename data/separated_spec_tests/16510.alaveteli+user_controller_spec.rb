# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserController do

  describe 'GET show' do

    let(:user) { FactoryBot.create(:user) }

    it 'renders the show template' 


    it 'assigns the user' 


    it 'should be successful' 


    it 'raises a RecordNotFound for non-existent users' 


    it 'raises a RecordNotFound for unconfirmed users' 


    # TODO: Use route_for or params_from to check /c/ links better
    # http://rspec.rubyforge.org/rspec-rails/1.1.12/classes/Spec/Rails/Example/
    # ControllerExampleGroup.html
    context 'when redirecting a show request to a canonical url' do

      it 'redirects to lower case name if given one with capital letters' 


      it 'redirects a long non-canonical name that has a numerical suffix, retaining the suffix' 


      it 'does not redirect a long canonical name that has a numerical suffix' 


    end

    # Also doubles for when not logged in viewing another user's profile
    context 'when viewing a profile' do

      def make_request
        get :show, url_name: user.url_name, view: 'profile'
      end

      render_views

      it 'does not show requests or batch requests, but does show account options' 


    end

    # Also doubles for when not logged in viewing another user's requests
    context 'when viewing requests' do

      def make_request
        get :show, url_name: user.url_name, view: 'requests'
      end

      render_views

      it 'shows requests and batch requests, but does not show account options' 


      it 'does not show private requests' 


    end

    context 'when filtering requests' do

      before do
        load_raw_emails_data
        get_fixtures_xapian_index
      end

      it "searches the user's contributions" 


      it 'filters by the given query' 


      it 'filters by the given query and request status' 


    end

    context 'when logged in viewing your own profile' do

      def make_request
        get :show, url_name: user.url_name, view: 'profile'
      end

      render_views

      before do
        session[:user_id] = user.id
      end

      it 'does not show requests or batch requests, but does show account options' 


    end

    context 'when logged in viewing your own requests' do

      def make_request
        get :show, url_name: user.url_name, view: 'requests'
      end

      render_views

      before do
        session[:user_id] = user.id
      end

      it "assigns the user's undescribed requests" 


      it "assigns the user's track things" 


      it "assigns the user's grouped track things" 


      it 'shows requests, batch requests, but not account options' 


      it 'does not include annotations of hidden requests in the count' 


      it 'shows private requests' 


      it 'does not show hidden private requests' 


    end

    context 'when logged in filtering your own requests' do

      before do
        session[:user_id] = user.id
      end

      it 'filters by the given query' 


      it 'filters private requests by the given query' 


      it 'filters by the given query and request status' 


      it 'filters private requests by the given query and request status' 


    end

    context 'when logged in viewing other requests' do

      def make_request
        get :show, url_name: user.url_name, view: 'requests'
      end

      render_views

      before do
        session[:user_id] = FactoryBot.create(:user).id
      end

      it "does not assign undescribed requests" 


      it "does not assign the user's track things" 


      it "does not assign grouped track things" 


      it 'shows requests, batch requests, but not account options' 


      it 'does not include annotations of hidden requests in the count' 


      it 'does not show private requests' 


      it 'does not show hidden private requests' 

    end

    context 'when logged in filtering other requests' do

      before do
        session[:user_id] = FactoryBot.create(:user).id
      end

      it 'filters by the given query' 


      it 'does not show private requests when filtering by query' 


      it 'filters by the given query and request status' 


      it 'does not show private requests when filtering by request status' 


    end

  end

  describe 'POST set_profile_photo' do

    context 'user is banned' do

      before(:each) do
        @user = FactoryBot.create(:user, :ban_text => 'Causing trouble')
        session[:user_id] = @user.id
        @uploadedfile = fixture_file_upload("/files/parrot.png")

        post :set_profile_photo, :id => @user.id,
          :file => @uploadedfile,
          :submitted_draft_profile_photo => 1,
          :automatically_crop => 1
      end

      it 'redirects to the profile page' 


      it 'renders an error message' 


    end

  end

end

describe UserController, "when signing up" do
  render_views

  before do
    # Don't call out to external url during tests
    allow(controller).to receive(:country_from_ip).and_return('gb')
  end

  it "should be an error if you type the password differently each time" 


  it "should be an error to sign up with a misformatted email" 


  it "should not show the 'already in use' error when trying to sign up with a duplicate email" 


  it "should send confirmation mail if you fill in the form right" 


  it "should send confirmation mail in other languages or different locales" 


  context "filling in the form with an existing registered email" do
    it "should send special 'already signed up' mail" 


    it "cope with trailing spaces in the email address" 


    it "should create a new PostRedirect if the old one has expired" 

  end

  it 'accepts only whitelisted parameters' 


  context 'when the user is already signed in' do
    let(:user){ FactoryBot.create(:user) }

    before do
      ActionController::Base.allow_forgery_protection = true
    end

    after do
      ActionController::Base.allow_forgery_protection = false
    end

    it "shows the confirmation page for valid credentials" 


  end

  context 'when the IP is rate limited' do

    before(:each) do
      limiter = double
      allow(limiter).to receive(:record)
      allow(limiter).to receive(:limit?).and_return(true)
      allow(controller).to receive(:ip_rate_limiter).and_return(limiter)
    end

    context 'when block_rate_limited_ips? is true' do

      before(:each) do
        allow(@controller).to receive(:block_rate_limited_ips?).and_return(true)
      end

      it 'sends an exception notification' 


      it 'blocks the signup' 


      it 're-renders the form' 


      it 'sets a flash error' 


    end

    context 'when block_rate_limited_ips? is false' do

      before(:each) do
        allow(@controller).
          to receive(:block_rate_limited_ips?).and_return(false)
      end

      it 'sends an exception notification' 


      it 'allows the signup' 


    end

  end

  context 'using a spammy name or email from a known spam domain' do

    before do
      spam_scorer = double
      allow(spam_scorer).to receive(:spam?).and_return(true)
      allow(UserSpamScorer).to receive(:new).and_return(spam_scorer)
    end

    context 'when spam_should_be_blocked? is true' do

      before do
        allow(@controller).
          to receive(:spam_should_be_blocked?).and_return(true)
      end

      it 'logs the signup attempt' 


      it 'blocks the signup' 


      it 're-renders the form' 


    end

    context 'when spam_should_be_blocked? is false' do

      before do
        allow(@controller).
          to receive(:spam_should_be_blocked?).and_return(false)
      end

      it 'sends an exception notification' 


      it 'allows the signup' 


    end

  end

  # TODO: need to do bob@localhost signup and check that sends different email
end

describe UserController, "when sending another user a message" do
  render_views

  it "should redirect to signin page if you go to the contact form and aren't signed in" 


  it "should show contact form if you are signed in" 


  it "should give error if you don't fill in the subject" 


  it "should send the message" 


end

describe UserController, "when changing email address" do
  render_views

  it "should require login" 


  it "should show form for changing email if logged in" 


  it "should be an error if the password is wrong, everything else right" 


  it "should be an error if old email is wrong, everything else right" 


  it "should work even if the old email had a case difference" 


  it "should send special 'already signed up' mail if you try to change your email to one already used" 

end

describe UserController, "when using profile photos" do
  render_views

  before do
    @user = users(:bob_smith_user)

    @uploadedfile = fixture_file_upload("/files/parrot.png")
    @uploadedfile_2 = fixture_file_upload("/files/parrot.jpg")
  end

  it "should not let you change profile photo if you're not logged in as the user" 


  it "should return a 404 not a 500 when a profile photo has not been set" 


  it "should let you change profile photo if you're logged in as the user" 


  context 'there is no profile text' do
    let(:user) { FactoryBot.create(:user, :about_me => '') }

    it 'prompts you to add profile text when adding a photo' 


  end

  it "should let you change profile photo twice" 


  # TODO: todo check the two stage javascript cropping (above only tests one stage non-javascript one)
end

describe UserController, "when showing JSON version for API" do

  it "should be successful" 


end

describe UserController, "when viewing the wall" do
  render_views

  before(:each) do
    load_raw_emails_data
    get_fixtures_xapian_index
  end

  it "should show users stuff on their wall, most recent first" 


  it "should show other users' activities on their walls" 


  it "should allow users to turn their own email alerts on and off" 


  it 'should not show duplicate feed results' 


end

