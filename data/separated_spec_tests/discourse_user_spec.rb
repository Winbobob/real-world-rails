require 'rails_helper'

describe User do
  let(:user) { Fabricate(:user) }
  let(:profile_page_url) { "#{Discourse.base_url}/users/#{user.username}" }

  before do
    SiteSetting.discourse_narrative_bot_enabled = true
  end

  describe 'when a user is created' do
    it 'should initiate the bot' 


    describe 'welcome post' do
      context 'disabled' do
        before do
          SiteSetting.disable_discourse_narrative_bot_welcome_post = true
        end

        it 'should not initiate the bot' 

      end

      context 'with title emoji disabled' do
        before do
          SiteSetting.disable_discourse_narrative_bot_welcome_post = false
          SiteSetting.max_emojis_in_title = 0
        end

        it 'initiates the bot' 

      end

      context 'enabled' do
        before do
          SiteSetting.disable_discourse_narrative_bot_welcome_post = false
        end

        it 'initiate the bot' 


        describe "when send welcome message is selected" do
          before do
            SiteSetting.discourse_narrative_bot_welcome_post_type = 'welcome_message'
          end

          it 'should send the right welcome message' 

        end

        describe 'when welcome message is configured to be delayed' do
          before do
            SiteSetting.discourse_narrative_bot_welcome_post_delay = 100
            SiteSetting.queue_jobs = true
          end

          it 'should delay the welcome post until user logs in' 

        end
      end
    end

    context 'when user is staged' do
      let(:user) { Fabricate(:user, staged: true) }

      it 'should not initiate the bot' 

    end

    context 'when user is anonymous?' do
      let(:anonymous_user) { Fabricate(:anonymous) }

      it 'should not initiate the bot' 

    end

    context "when user's username should be ignored" do
      let(:user) { Fabricate.build(:user) }

      before do
        SiteSetting.discourse_narrative_bot_ignored_usernames = 'discourse|test'
      end

      ['discourse', 'test'].each do |username|
        it 'should not initiate the bot' 

      end
    end
  end

  describe 'when a user has been destroyed' do
    it "should clean up plugin's store" 

  end
end

