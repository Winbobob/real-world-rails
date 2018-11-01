require 'spec_helper'

describe SlackService do
  subject(:slack_service) { SlackService }

  let(:user) { User.new email: 'random@random.com' }

  before { Features.slack.notifications.enabled = true }

  describe '.post_hangout_notification' do
    let(:slack_client) { double(:slack_client) }
    let(:gitter_client) { double(:gitter_client) }

    let(:default_post_args) do
      {
          username: user.display_name,
          icon_url: user.gravatar_url,
          link_names: 1
      }
    end

    let(:message) { 'MockEvent: <mock_url|click to join>' }
    let(:here_message) { "@here #{message}" }
    let(:channel_message) { "@channel #{message}" }

    let(:general_channel_post_args) do
      {
          channel: 'C0TLAE1MH',
          text: here_message,
      }.merge!(default_post_args)
    end
    let(:websiteone_project_channel_post_args) do
      {
          channel: 'C29J4QQ9W',
          text: here_message,
      }.merge!(default_post_args)
    end
    let(:localsupport_project_channel_post_args) do
      {
          channel: 'C69J9GC1Y',
          text: here_message,
      }.merge!(default_post_args)
    end
    let(:cs169_project_channel_post_args) do
      {
          channel: 'C29J4CYA2',
          text: here_message,
      }.merge!(default_post_args)
    end
    let(:pairing_notifications_channel_post_args) do
      {
          channel: 'C29J3DPGW',
          text: channel_message,
      }.merge!(default_post_args)
    end
    let(:standup_notifications_channel_post_args) do
      {
          channel: 'C29JE6HGR',
          text: channel_message,
      }.merge!(default_post_args)
    end
    let(:post_premium_mob_notification_post_args) do 
      {
        channel: 'C29J4QQ9M',
        text: here_message,
      }.merge!(default_post_args)
    end
    let(:post_premium_mob_trialists_notification_post_args) do 
      {
        channel: 'C29J4QQ9F',
        text: here_message,
      }.merge!(default_post_args)
    end

    let(:cs169_project) { mock_model Project, slug: 'cs169' }
    let(:websiteone_project) { mock_model Project, slug: 'websiteone' }
    let(:noslack_project) { mock_model Project, slug: 'noslack' }
    
    context('PairProgramming') do

      let(:cs169_hangout) { mock_model EventInstance, title: 'MockEvent', category: "PairProgramming", hangout_url: "mock_url", user: user, project: cs169_project, for: '' }
      let(:missing_url_hangout) { mock_model EventInstance, title: 'MockEvent', category: "PairProgramming", hangout_url: "  ", user: user, for: '' }
      let(:websiteone_hangout) { mock_model EventInstance, title: 'MockEvent', category: "PairProgramming", hangout_url: "mock_url", user: user, project: websiteone_project, for: '' }
      let(:no_project_hangout) { mock_model EventInstance, title: 'MockEvent', category: "PairProgramming", hangout_url: "mock_url", user: user, project: nil, for: '' }
      let(:project_with_no_slack_hangout) { mock_model EventInstance, title: 'MockEvent', category: "PairProgramming", hangout_url: "mock_url", user: user, project: noslack_project, for: '' }

     #  if hangout.event.for == 'Premium Mob Members'

      it 'sends the correct slack message to the correct channels when associated with a project' 


      it 'does not fail when event has no associated project' 

      
      it 'does not try to post to slack channel when project has no associated slack channel in lookup table' 


      it 'should ping gitter and slack (but not general) when the project is cs169' 


      it 'does not post notification if hangout url is blank' 


      let(:multiple_channel_project) { mock_model Project, slug: 'multiple-channels' }
      let(:multiple_channel_hangout) { mock_model EventInstance, title: 'MockEvent', category: "PairProgramming", hangout_url: "mock_url", user: user, project: multiple_channel_project, for: '' }

      it 'can post to multiple channels' 

    end

    context('Scrums') do
      let(:cs169_hangout) { mock_model EventInstance, title: 'MockEvent', category: "Scrum", hangout_url: "mock_url", user: user, project: cs169_project, for: ''  }
      let(:missing_url_hangout) { mock_model EventInstance, title: 'MockEvent', category: "Scrum", hangout_url: "  ", user: user, for: ''  }
      let(:websiteone_hangout) { mock_model EventInstance, title: 'MockEvent', category: "Scrum", hangout_url: "mock_url", user: user, project: websiteone_project, for: ''  }
      let(:no_project_hangout) { mock_model EventInstance, title: 'MockEvent', category: "Scrum", hangout_url: "mock_url", user: user, project: nil, for: ''  }

      it 'sends the correct slack message to the correct channels' 


      it 'does not fail when event has no associated project' 


      it 'should ping slack when the project is cs169' 


      it 'does not post notification if hangout url is blank for pairing' 

    end

    context 'Premium Mob Members Events' do
      let(:premium_mob_hangout) { mock_model EventInstance, title: 'MockEvent', category: "PairProgramming", hangout_url: "mock_url", user: user, project: websiteone_project, for: 'Premium Mob Members' }
      let(:general_channel_id) { 'C0TLAE1MH' }
      let(:pairing_notifications_channel_id) { 'C29J3DPGW' }
      let(:websiteone_channel_id) { 'C29J4QQ9W' }
      
      it 'posts hangout url to appropriate private channels' 


      it 'does not post hangout url to public channels' 

    end
  end
  
  describe '.post_yt_link' do
    let(:client) { spy(:slack_client) }
    let(:expected_post_args) do
      {
        text: 'Video/Livestream: <https://youtu.be/mock_url|click to play>',
        username: user.display_name,
        icon_url: user.gravatar_url,
        link_names: 1
      }
    end
    context('PairProgramming') do
      let(:hangout) { EventInstance.create(title: 'MockEvent', category: "PairProgramming", hangout_url: "mock_url", user: user ) }
      before { allow(hangout).to receive(:for).and_return '' }
      
      it 'sends the correct slack message to the correct channels' 

      
      it 'does not ping slack when the project is cs169' 

      
      it 'does not post youtube video link if yt_video_id is blank' 

    end
    
    context('Scrums') do
      let(:hangout) { EventInstance.create(title: 'MockEvent', category: 'Scrum', hangout_url: 'mock_url', user: user ) }
      before { allow(hangout).to receive(:for).and_return '' }
      
      it 'sends the correct slack message to the correct channels' 

      
      it 'does not post youtube video link if yt_video_id is blank' 

    end
    
    context 'Premium Mob Members Events' do
      let(:hangout) { EventInstance.create(title: 'MockEvent', category: 'PairProgramming', hangout_url: 'mock_url', user: user ) }
      let(:general_channel_id) { 'C0TLAE1MH' }
      let(:pairing_notifications_channel_id) { 'C29J3DPGW' }
      let(:websiteone_channel_id) { 'C29J4QQ9W' }
      let(:premium_extra_channel_id) { 'C29J4QQ9M' }
      let(:premium_mob_trialists_channel_id) { 'C29J4QQ9F' }
      before { allow(hangout).to receive(:for).and_return 'Premium Mob Members' }

      let(:default_post_args) do
        {
            username: user.display_name,
            icon_url: user.gravatar_url,
            link_names: 1
        }
      end
      let(:message) { 'MockEvent: <mock_url|click to join>' }
      let(:here_message) { "@here #{message}" }
      let(:post_premium_mob_notification_post_args) do 
        {
          channel: 'C29J4QQ9M',
          text: here_message,
        }.merge!(default_post_args)
      end
      
      it 'posts youtube url to appropriate private channels' 


      it 'does not post youtube url to public channels' 

    end
  end
end
