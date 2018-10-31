require 'rails_helper'

RSpec.describe ListController do
  let(:topic) { Fabricate(:topic, user: user) }
  let(:group) { Fabricate(:group) }
  let(:user) { Fabricate(:user) }
  let(:post) { Fabricate(:post, user: user) }

  before do
    SiteSetting.top_menu = 'latest|new|unread|categories'
  end

  describe '#index' do
    it "does not return a 500 for invalid input" 


    it "returns 200 for legit requests" 


    (Discourse.anonymous_filters - [:categories]).each do |filter|
      context "#{filter}" do
        it "succeeds" 

      end
    end

    it 'allows users to filter on a set of topic ids' 

  end

  describe "categories and X" do
    it "returns top topics" 

  end

  describe 'suppress from latest' do

    it 'supresses categories' 


  end

  describe 'titles for crawler layout' do
    it 'has no title for the default URL' 


    it 'has a title for non-default URLs' 

  end

  describe "filter private messages by tag" do
    let(:user) { Fabricate(:user) }
    let(:moderator) { Fabricate(:moderator) }
    let(:admin) { Fabricate(:admin) }
    let(:tag) { Fabricate(:tag) }
    let(:private_message) { Fabricate(:private_message_topic) }

    before do
      SiteSetting.tagging_enabled = true
      SiteSetting.allow_staff_to_tag_pms = true
      Fabricate(:topic_tag, tag: tag, topic: private_message)
    end

    it 'should fail for non-staff users' 


    it 'should be success for staff users' 

  end

  describe '#private_messages_group' do
    let(:user) do
      user = Fabricate(:user)
      group.add(user)
      sign_in(user)
      user
    end

    let!(:topic) do
      Fabricate(:private_message_topic,
        allowed_groups: [group],
      )
    end

    let(:private_post) { Fabricate(:post, topic: topic) }

    it 'should return the right response' 

  end

  describe '#group_topics' do
    %i{user user2}.each do |user|
      let(user) do
        user = Fabricate(:user)
        group.add(user)
        user
      end
    end

    let!(:topic) { Fabricate(:topic, user: user) }
    let!(:topic2) { Fabricate(:topic, user: user2) }
    let!(:another_topic) { Fabricate(:topic) }

    describe 'when an invalid group name is given' do
      it 'should return the right response' 

    end

    describe 'for an anon user' do
      describe 'public visible group' do
        it 'should return the right response' 

      end

      describe 'restricted group' do
        before { group.update!(visibility_level: Group.visibility_levels[:staff]) }

        it 'should return the right response' 

      end
    end

    describe 'for a normal user' do
      before { sign_in(Fabricate(:user)) }

      describe 'restricted group' do
        before { group.update!(visibility_level: Group.visibility_levels[:staff]) }

        it 'should return the right response' 

      end
    end

    describe 'for a group user' do
      before do
        sign_in(user)
      end

      it 'should be able to view the topics started by group users' 

    end
  end

  describe 'RSS feeds' do
    it 'renders latest RSS' 


    it 'renders links correctly with subfolder' 


    it 'renders top RSS' 


    TopTopic.periods.each do |period|
      it "renders #{period} top RSS" 

    end
  end

  describe 'category' do
    context 'in a category' do
      let(:category) { Fabricate(:category) }
      let(:group) { Fabricate(:group) }
      let(:private_category) { Fabricate(:private_category, group: group) }

      context 'without access to see the category' do
        it "responds with a 404 error" 

      end

      context 'with access to see the category' do
        it "succeeds" 

      end

      context 'with a link that includes an id' do
        it "succeeds" 

      end

      context 'with a link that has a parent slug, slug and id in its path' do
        let(:child_category) { Fabricate(:category, parent_category: category) }

        context "with valid slug" do
          it "redirects to the child category" 

        end

        context "with invalid slug" do
          it "redirects to child category" 

        end
      end

      context 'another category exists with a number at the beginning of its name' do
        # One category has another category's id at the beginning of its name
        let!(:other_category) { Fabricate(:category, name: "#{category.id} name") }

        it 'uses the correct category' 

      end

      context 'a child category' do
        let(:sub_category) { Fabricate(:category, parent_category_id: category.id) }

        context 'when parent and child are requested' do
          it "succeeds" 

        end

        context 'when child is requested with the wrong parent' do
          it "responds with a 404 error" 

        end
      end

      describe 'feed' do
        it 'renders RSS' 


        it "renders RSS in subfolder correctly" 

      end

      describe "category default views" do
        it "has a top default view" 


        it "has a default view of nil" 


        it "has a default view of ''" 


        it "has a default view of latest" 

      end

      describe "renders canonical tag" do
        it 'for category default view' 


        it 'for category latest view' 

      end
    end
  end

  describe "topics_by" do
    before do
      sign_in(Fabricate(:user))
      Fabricate(:topic, user: user)
    end

    it "should respond with a list" 

  end

  describe "private_messages" do
    it "returns 403 error when the user can't see private message" 


    it "succeeds when the user can see private messages" 

  end

  describe "private_messages_sent" do
    before do
      pm = Fabricate(:private_message_topic, user: user)
      Fabricate(:post, user: user, topic: pm, post_number: 1)
    end

    it "returns 403 error when the user can't see private message" 


    it "succeeds when the user can see private messages" 

  end

  describe "private_messages_unread" do
    before do
      u = Fabricate(:user)
      pm = Fabricate(:private_message_topic, user: u)
      Fabricate(:post, user: u, topic: pm, post_number: 1)
      pm.topic_allowed_users.create!(user: user)
    end

    it "returns 403 error when the user can't see private message" 


    it "succeeds when the user can see private messages" 

  end

  describe 'read' do
    it 'raises an error when not logged in' 


    context 'when logged in' do
      it "succeeds" 

    end
  end

  describe "best_periods_for" do
    it "returns yearly for more than 180 days" 


    it "includes monthly when less than 180 days and more than 35 days" 


    it "includes weekly when less than 35 days and more than 8 days" 


    it "includes daily when less than 8 days" 


    it "returns default even for more than 180 days" 


    it "returns default even when less than 180 days and more than 35 days" 


    it "returns default even when less than 35 days and more than 8 days" 


    it "doesn't return default when set to all" 


    it "doesn't return value twice when matches default" 

  end

  describe "categories suppression" do
    let(:category_one) { Fabricate(:category) }
    let(:sub_category) { Fabricate(:category, parent_category: category_one, suppress_from_latest: true) }
    let!(:topic_in_sub_category) { Fabricate(:topic, category: sub_category) }

    let(:category_two) { Fabricate(:category, suppress_from_latest: true) }
    let!(:topic_in_category_two) { Fabricate(:topic, category: category_two) }

    it "suppresses categories from the latest list" 


    it "does not suppress" 

  end

  describe "safe mode" do
    it "handles safe mode" 

  end
end

