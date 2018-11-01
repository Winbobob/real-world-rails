require "rails_helper"
require_relative "../helpers"

describe PostsController do
  let!(:user) { log_in }
  let!(:title) { "Testing Poll Plugin" }

  before do
    SiteSetting.min_first_post_typing_time = 0
  end

  describe "polls" do

    it "works" 


    it "works on any post" 


    it "schedules auto-close job" 


    it "should have different options" 


    it "should have at least 2 options" 


    it "should have at most 'SiteSetting.poll_maximum_options' options" 


    it "should have valid parameters" 


    it "prevents self-xss" 


    it "also works whe there is a link starting with '[poll'" 


    it "prevents pollception" 


    describe "edit window" do

      describe "within the first 5 minutes" do

        let(:post_id) do
          freeze_time(4.minutes.ago) do
            post :create, params: {
              title: title, raw: "[poll]\n- A\n- B\n[/poll]"
            }, format: :json

            ::JSON.parse(response.body)["id"]
          end
        end

        it "can be changed" 


        it "resets the votes" 


      end

      describe "after the poll edit window has expired" do

        let(:poll) { "[poll]\n- A\n- B\n[/poll]" }
        let(:new_option) { "[poll]\n- A\n- C\n[/poll]" }
        let(:updated) { "before\n\n[poll]\n- A\n- B\n[/poll]\n\nafter" }

        let(:post_id) do
          freeze_time(6.minutes.ago) do
            post :create, params: {
              title: title, raw: poll
            }, format: :json

            ::JSON.parse(response.body)["id"]
          end
        end

        let(:poll_edit_window_mins) { 6 }

        before do
          SiteSetting.poll_edit_window_mins = poll_edit_window_mins
        end

        describe "with no vote" do

          it "OP can change the options" 


          it "staff can change the options" 


          it "support changes on the post" 


        end

        describe "with at least one vote" do

          before do
            DiscoursePoll::Poll.vote(post_id, "poll", ["5c24fc1df56d764b550ceae1b9319125"], user)
          end

          it "OP cannot change the options" 


          it "staff can change the options and votes are merged" 


          it "staff can change the options and anonymous votes are merged" 


          it "support changes on the post" 


        end

      end

    end

  end

  describe "named polls" do

    it "should have different options" 


    it "should have at least 2 options" 


  end

  describe "multiple polls" do

    it "works" 


    it "should have a name" 


    it "should have unique name" 


  end

  describe "disabled polls" do
    before do
      SiteSetting.poll_enabled = false
    end

    it "doesn’t cook the poll" 

  end

  describe "regular user with insufficient trust level" do
    before do
      SiteSetting.poll_minimum_trust_level_to_create = 2
    end

    it "invalidates the post" 

  end

  describe "regular user with equal trust level" do
    before do
      SiteSetting.poll_minimum_trust_level_to_create = 2
    end

    it "validates the post" 

  end

  describe "regular user with superior trust level" do
    before do
      SiteSetting.poll_minimum_trust_level_to_create = 2
    end

    it "validates the post" 

  end

  describe "staff with insufficient trust level" do
    before do
      SiteSetting.poll_minimum_trust_level_to_create = 2
    end

    it "validates the post" 

  end
end

