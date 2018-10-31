require 'rails_helper'
require 'post_revisor'

describe PostRevisor do

  let(:topic) { Fabricate(:topic) }
  let(:newuser) { Fabricate(:newuser) }
  let(:post_args) { { user: newuser, topic: topic } }

  context 'TopicChanges' do
    let(:tc) {
      topic.reload
      PostRevisor::TopicChanges.new(topic, topic.user)
    }

    it 'provides a guardian' 


    it 'tracks changes properly' 

  end

  context 'editing category' do

    it 'does not revise category when no permission to create a topic in category' 


    it 'does not revise category when the destination category requires topic approval' 

  end

  context 'revise wiki' do

    before do
      # There used to be a bug where wiki changes were considered posting "too similar"
      # so this is enabled and checked
      $redis.delete_prefixed('unique-post')
      SiteSetting.unique_posts_mins = 10
    end

    it 'allows the user to change it to a wiki' 

  end

  context 'revise' do
    let(:post) { Fabricate(:post, post_args) }
    let(:first_version_at) { post.last_version_at }

    subject { PostRevisor.new(post) }

    describe 'with the same body' do
      it "doesn't change version" 

    end

    describe 'ninja editing' do
      it 'correctly applies edits' 


      it "does create a new version if a large diff happens" 


      it "doesn't create a new version" 

    end

    describe 'revision much later' do

      let!(:revised_at) { post.updated_at + 2.minutes }

      before do
        SiteSetting.editing_grace_period = 1.minute
        subject.revise!(post.user, { raw: 'updated body' }, revised_at: revised_at)
        post.reload
      end

      it "doesn't update a category" 


      it 'updates the versions' 


      it 'creates a new revision' 


      it "updates the last_version_at" 


      describe "new edit window" do

        before do
          subject.revise!(post.user, { raw: 'yet another updated body' }, revised_at: revised_at)
          post.reload
        end

        it "doesn't create a new version if you do another" 


        it "doesn't change last_version_at" 


        it "doesn't update a category" 


        context "after second window" do

          let!(:new_revised_at) { revised_at + 2.minutes }

          before do
            subject.revise!(post.user, { raw: 'yet another, another updated body' }, revised_at: new_revised_at)
            post.reload
          end

          it "does create a new version after the edit window" 


          it "does create a new version after the edit window" 

        end
      end
    end

    describe 'category topic' do

      let!(:category) do
        category = Fabricate(:category)
        category.update_column(:topic_id, topic.id)
        category
      end

      let(:new_description) { "this is my new description." }

      it "should have no description by default" 


      context "one paragraph description" do
        before do
          subject.revise!(post.user, raw: new_description)
          category.reload
        end

        it "returns the changed category info" 


        it "updates the description of the category" 

      end

      context "multiple paragraph description" do
        before do
          subject.revise!(post.user, raw: "#{new_description}\n\nOther content goes here.")
          category.reload
        end

        it "returns the changed category info" 


        it "updates the description of the category" 

      end

      context "invalid description without paragraphs" do
        before do
          subject.revise!(post.user, raw: "# This is a title")
          category.reload
        end

        it "returns a error for the user" 


        it "doesn't update the description of the category" 

      end

      context 'when updating back to the original paragraph' do
        before do
          category.update_column(:description, 'this is my description')
          subject.revise!(post.user, raw: Category.post_template)
          category.reload
        end

        it "puts the description back to nothing" 


        it "returns the changed category info" 

      end

    end

    describe 'rate limiter' do
      let(:changed_by) { Fabricate(:coding_horror) }

      it "triggers a rate limiter" 

    end

    describe "admin editing a new user's post" do
      let(:changed_by) { Fabricate(:admin) }

      before do
        SiteSetting.newuser_max_images = 0
        url = "http://i.imgur.com/wfn7rgU.jpg"
        Oneboxer.stubs(:onebox).with(url, anything).returns("<img src='#{url}'>")
        subject.revise!(changed_by, raw: "So, post them here!\n#{url}")
      end

      it "allows an admin to insert images into a new user's post" 


      it "marks the admin as the last updater" 


    end

    describe "new user editing their own post" do
      before do
        SiteSetting.newuser_max_images = 0
        url = "http://i.imgur.com/FGg7Vzu.gif"
        Oneboxer.stubs(:cached_onebox).with(url, anything).returns("<img src='#{url}'>")
        subject.revise!(post.user, raw: "So, post them here!\n#{url}")
      end

      it "doesn't allow images to be inserted" 


    end

    describe 'with a new body' do
      before do
        SiteSetting.editing_grace_period_max_diff = 1000
      end

      let(:changed_by) { Fabricate(:coding_horror) }
      let!(:result) { subject.revise!(changed_by, raw: "lets update the body. Здравствуйте") }

      it 'correctly updates raw' 


      context 'second poster posts again quickly' do

        it 'is a ninja edit, because the second poster posted again quickly' 

      end

      context 'passing skip_revision as true' do
        before do
          SiteSetting.editing_grace_period = 1.minute
          subject.revise!(changed_by, { raw: 'yet another updated body' }, revised_at: post.updated_at + 10.hours, skip_revision: true)
          post.reload
        end

        it 'does not create new revision ' 

      end
    end

    describe "topic excerpt" do
      it "topic excerpt is updated only if first post is revised" 

    end

    it "doesn't strip starting whitespaces" 


    context "#publish_changes" do
      let!(:post) { Fabricate(:post, topic: topic) }

      it "should publish topic changes to clients" 

    end

    context "logging staff edits" do
      let(:moderator) { Fabricate(:moderator) }

      it "doesn't log when a regular user revises a post" 


      it "logs an edit when a staff member revises a post" 


      it "doesn't log an edit when a staff member edits their own post" 

    end

    context "staff_edit_locks_post" do

      context "disabled" do
        let(:moderator) { Fabricate(:moderator) }

        before do
          SiteSetting.staff_edit_locks_post = false
        end

        it "does not lock the post when revised" 

      end

      context "enabled" do
        let(:moderator) { Fabricate(:moderator) }

        before do
          SiteSetting.staff_edit_locks_post = true
        end

        it "locks the post when revised by staff" 


        it "doesn't wiki posts" 

        it "doesn't lock the post when the raw did not change" 


        it "doesn't lock the post when revised by a regular user" 


        it "doesn't lock a staff member's post" 

      end
    end

    context "alerts" do

      let(:mentioned_user) { Fabricate(:user) }

      before do
        SiteSetting.queue_jobs = false
      end

      it "generates a notification for a mention" 


      it "never generates a notification for a mention when the System user revise a post" 


    end

    context "tagging" do
      context "tagging disabled" do
        before do
          SiteSetting.tagging_enabled = false
        end

        it "doesn't add the tags" 

      end

      context "tagging enabled" do
        before do
          SiteSetting.tagging_enabled = true
        end

        context "can create tags" do
          before do
            SiteSetting.min_trust_to_create_tag = 0
            SiteSetting.min_trust_level_to_tag_topics = 0
          end

          it "can create all tags if none exist" 


          it "creates missing tags if some exist" 


          it "can remove all tags" 


          it "can remove all tags using tags_empty_array" 


          it "can't add staff-only tags" 


          it "staff can add staff-only tags" 


          context "with staff-only tags" do
            before do
              create_staff_tags(['important'])
              topic = post.topic
              topic.tags = [Fabricate(:tag, name: "super"), Tag.where(name: "important").first, Fabricate(:tag, name: "stuff")]
            end

            it "staff-only tags can't be removed" 


            it "can't remove all tags if some are staff-only" 


            it "staff-only tags can be removed by staff" 


            it "staff can remove all tags" 

          end

        end

        context "cannot create tags" do
          before do
            SiteSetting.min_trust_to_create_tag = 4
            SiteSetting.min_trust_level_to_tag_topics = 0
          end

          it "only uses existing tags" 

        end
      end
    end
  end
end

