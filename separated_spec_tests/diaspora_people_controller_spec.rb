# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe PeopleController, :type => :controller do
  include_context :gon

  before do
    @user = alice
    @aspect = @user.aspects.first
    sign_in @user, scope: :user
  end

  describe '#index (search)' do
    before do
      @eugene = FactoryGirl.create(
        :person,
        profile: FactoryGirl.build(:profile, first_name: "Eugene", last_name: "w")
      )
      @korth = FactoryGirl.create(
        :person,
        profile: FactoryGirl.build(:profile, first_name: "Evan", last_name: "Korth")
      )
      @closed = FactoryGirl.create(
        :person,
        closed_account: true,
        profile:        FactoryGirl.build(:profile, first_name: "Closed", last_name: "Account")
      )
    end

    describe 'via json' do
      it 'succeeds' 


      it 'responds with json' 


      it 'does not assign hashes' 


      it "doesn't include closed accounts" 

    end

    describe 'via html' do
      context 'query is a diaspora ID' do
        before do
          @unsearchable_eugene = FactoryGirl.create(:person, :diaspora_handle => "eugene@example.org",
                                         :profile => FactoryGirl.build(:profile, :first_name => "Eugene",
                                                                   :last_name => "w", :searchable => false))
        end
        it 'finds people even if they have searchable off' 


        it 'downcases the query term' 


        it 'does not the background query task if the user is found' 


        it 'sets background query task if the user is not found' 


        it "doesn't include closed accounts" 

      end

      context 'query is not a tag or a diaspora ID' do
        it 'assigns hashes' 


        it 'does not set the background query task' 


        it "assigns people" 


        it "succeeds if there is exactly one match" 


        it "succeeds if there are no matches" 


        it 'succeeds if you search for the empty term' 


        it 'succeeds if you search for punctuation' 


        it "excludes people who have searchable off" 


        it "doesn't include closed accounts" 

      end
    end
  end

  describe "#show performance", :performance => true do
    before do
      require 'benchmark'
      @posts = []
      @users = []
      8.times do |n|
        user = FactoryGirl.create(:user)
        @users << user
        aspect = user.aspects.create(:name => 'people')
        connect_users(@user, @user.aspects.first, user, aspect)

        @posts << @user.post(:status_message, :text => "hello#{n}", :to => aspect.id)
      end
      @posts.each do |post|
        @users.each do |user|
          user.comment!(post, "yo#{post.text}")
        end
      end
    end

    it 'takes time' 

  end

  describe '#show' do
    before do
      @person = FactoryGirl.create(:user).person
      @presenter = PersonPresenter.new(@person, @user)
    end

    it "404s if the id is invalid" 


    it "404s if no person is found via id" 


    it "404s if no person is found via username" 


    it "returns a person presenter" 


    it 'finds a person via username' 


    it "404s if no person is found via diaspora handle" 


    it 'finds a person via diaspora handle' 


    it 'redirects home for closed account' 


    it 'does not allow xss attacks' 


    it "displays the correct number of photos" 


    context "when the person is the current user" do
      it "succeeds" 


      it 'succeeds on the mobile site' 


      it "assigns the right person" 

    end

    context "with no user signed in" do
      before do
        sign_out :user
        @person = bob.person
      end

      it "succeeds" 


      it 'succeeds on the mobile site' 


      it 'forces to sign in if the person is remote' 


      it "leaks no private profile info" 


      it "includes the correct meta tags" 

    end

    context "when the person is a contact of the current user" do
      before do
        @person = bob.person
      end

      it "succeeds" 


      it 'succeeds on the mobile site' 


      it 'marks a corresponding notifications as read' 


      it "includes private profile info" 


      it "preloads data using gon for the aspect memberships dropdown" 

    end

    context "when the person is not a contact of the current user" do
      before do
        @person = eve.person
      end

      it "succeeds" 


      it 'succeeds on the mobile site' 


      it "leaks no private profile info" 


      it "preloads data using gon for the aspect memberships dropdown" 

    end

    context "when the user is following the person" do
      before do
        sign_out :user
        sign_in peter, scope: :user
        @person = alice.person
      end

      it "leaks no private profile info" 

    end
  end

  describe '#stream' do
    it "redirects non-json requests" 


    context "person is current user" do
      it "assigns all the user's posts" 


      it "renders the comments on the user's posts" 

    end

    context "person is contact of current user" do
      before do
        @person = bob.person
      end

      it "includes reshares" 


      it "assigns only the posts the current user can see" 

    end

    context "person is not contact of current user" do
      before do
        @person = eve.person
      end

      it "assigns only public posts" 


      it "posts include reshares" 

    end

    context "logged out" do
      before do
        sign_out :user
        @person = bob.person
      end

      context 'with posts' do
        before do
          @public_posts = []
          @public_posts << bob.post(:status_message, :text => "first public ", :to => bob.aspects[0].id, :public => true)
          bob.post(:status_message, :text => "to an aspect @user is not in", :to => bob.aspects[1].id)
          bob.post(:status_message, :text => "to all aspects", :to => 'all')
          @public_posts << bob.post(:status_message, :text => "public", :to => 'all', :public => true)
          @public_posts.first.created_at -= 1000
          @public_posts.first.save
        end

        it "posts include reshares" 


        it "assigns only public posts" 


        it 'is sorted by created_at desc' 

      end
    end
  end

  describe '#hovercard' do
    before do
      @hover_test = FactoryGirl.create(:person)
      @hover_test.profile.tag_string = '#test #tags'
      @hover_test.profile.save!
    end

    it 'redirects html requests' 


    it 'returns json with profile stuff' 


    it "returns contact when sharing" 


    context "with no user signed in" do
      before do
        sign_out :user
      end

      it "succeeds with local person" 


      it "succeeds with remote person" 

    end
  end

  describe '#refresh_search ' do
    before(:each)do
      @eugene = FactoryGirl.create(
        :person,
        profile: FactoryGirl.build(:profile, first_name: "Eugene", last_name: "w")
      )
      @korth = FactoryGirl.create(
        :person,
        profile: FactoryGirl.build(:profile, first_name: "Evan", last_name: "Korth")
      )
      @closed = FactoryGirl.create(
        :person,
        closed_account: true,
        profile:        FactoryGirl.build(:profile, first_name: "Closed", last_name: "Account")
      )
    end

    describe "via json" do
      it "returns no data when a search fails" 


      it "returns no data unless a fully composed name is sent" 


      it "returns with a found name" 


      it "doesn't include closed accounts" 

    end
  end

  describe '#diaspora_id?' do
    it 'returns true for pods on urls' 


    it 'returns true for pods on urls with port' 


    it 'returns true for pods on localhost' 


    it 'returns true for pods on localhost and port' 


    it 'returns true for pods on ip' 


    it 'returns true for pods on ip and port' 


    it 'returns false for pods on with invalid url characters' 


    it 'returns false for invalid usernames' 

  end
end

