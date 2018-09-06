require 'rails_helper'

describe UsernameChanger do

  describe '#change' do
    let(:user) { Fabricate(:user) }

    context 'success' do
      let(:new_username) { "#{user.username}1234" }

      before do
        @result = UsernameChanger.change(user, new_username)
      end

      it 'returns true' 


      it 'should change the username' 


      it 'should change the username_lower' 

    end

    context 'failure' do
      let(:wrong_username) { "" }
      let(:username_before_change) { user.username }
      let(:username_lower_before_change) { user.username_lower }

      before do
        @result = UsernameChanger.change(user, wrong_username)
      end

      it 'returns false' 


      it 'should not change the username' 


      it 'should not change the username_lower' 

    end

    describe 'change the case of my username' do
      let!(:myself) { Fabricate(:user, username: 'hansolo') }

      it 'should return true' 


      it 'should change the username' 


      it "logs the action" 

    end

    describe 'allow custom minimum username length from site settings' do
      before do
        @custom_min = 2
        SiteSetting.min_username_length = @custom_min
      end

      it 'should allow a shorter username than default' 


      it 'should not allow a shorter username than limit' 


      it 'should not allow a longer username than limit' 

    end

    context 'posts and revisions' do
      let(:user) { Fabricate(:user, username: 'foo') }
      let(:topic) { Fabricate(:topic, user: user) }

      before { UserActionCreator.enable }
      after { UserActionCreator.disable }

      def create_post_and_change_username(args = {}, &block)
        post = create_post(args.merge(topic_id: topic.id))

        args.delete(:revisions)&.each do |revision|
          post.revise(post.user, revision, force_new_version: true)
        end

        block.call(post) if block

        UsernameChanger.change(user, 'bar')
        post.reload
      end

      context 'mentions' do
        it 'rewrites cooked correctly' 


        it 'ignores case when replacing mentions' 


        it 'replaces mentions when there are leading symbols' 


        it 'replaces mentions within double and single quotes' 


        it 'replaces mentions when there are trailing symbols' 


        it 'does not replace mention when followed by an underscore' 


        it 'does not replace mentions when there are leading alphanumeric chars' 


        it 'does not replace username within email address' 


        it 'does not replace username in a mention of a similar username' 


        it 'updates the path to the user even when it links to /user instead of /u' 


        it 'replaces mentions within revisions' 


        it 'replaces mentions in posts marked for deletion' 

      end

      context 'quotes' do
        let(:quoted_post) { create_post(user: user, topic: topic, post_number: 1, raw: "quoted post") }
        let(:avatar_url) { user.avatar_template.gsub("{size}", "40") }

        it 'replaces the username in quote tags' 


        context 'simple quote' do
          let(:raw) do <<~RAW
              Lorem ipsum

              [quote="foo, post:1, topic:#{quoted_post.topic.id}"]
              quoted post
              [/quote]
            RAW
          end

          let(:expected_raw) do
            <<~RAW.strip
              Lorem ipsum

              [quote="bar, post:1, topic:#{quoted_post.topic.id}"]
              quoted post
              [/quote]
            RAW
          end

          let(:expected_cooked) do
            <<~HTML
              <p>Lorem ipsum</p>
              <aside class="quote no-group" data-post="1" data-topic="#{quoted_post.topic.id}">
              <div class="title">
              <div class="quote-controls"></div>
              <img alt='' width="20" height="20" src="#{avatar_url}" class="avatar"> bar:</div>
              <blockquote>
              <p>quoted post</p>
              </blockquote>
              </aside>
            HTML
          end

          it 'replaces the username in quote tags when the post is deleted' 


          it 'replaces the username in quote tags when the post is marked as deleted' 

        end

        # TODO spec for quotes in revisions
      end
    end

    context 'notifications' do
      def create_notification(type, notified_user, post, data = {})
        Fabricate(
          :notification,
          notification_type: Notification.types[type],
          user: notified_user,
          data: data.to_json,
          topic: post&.topic,
          post_number: post&.post_number
        )
      end

      def notification_data(notification)
        JSON.parse(notification.reload.data, symbolize_names: true)
      end

      def original_and_display_username(username)
        { original_username: username, display_username: username, foo: "bar" }
      end

      def original_username_and_some_text_as_display_username(username)
        { original_username: username, display_username: "some text", foo: "bar" }
      end

      def only_display_username(username)
        { display_username: username }
      end

      def username_and_something_else(username)
        { username: username, foo: "bar" }
      end

      it 'replaces usernames in notifications' 

    end
  end

end
