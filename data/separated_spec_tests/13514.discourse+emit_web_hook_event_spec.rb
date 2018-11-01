require 'rails_helper'

describe Jobs::EmitWebHookEvent do
  let(:post_hook) { Fabricate(:web_hook) }
  let(:inactive_hook) { Fabricate(:inactive_web_hook) }
  let(:post) { Fabricate(:post) }
  let(:user) { Fabricate(:user) }

  it 'raises an error when there is no web hook record' 


  it 'raises an error when there is no event type' 


  it 'raises an error when there is no payload' 


  context 'when the web hook is failed' do
    before do
      SiteSetting.retry_web_hook_events = true
      stub_request(:post, "https://meta.discourse.org/webhook_listener")
        .to_return(body: 'Invalid Access', status: 403)
    end

    it 'retry if site setting is enabled' 


    it 'does not retry for more than maximum allowed times' 


    it 'does not retry if site setting is disabled' 

  end

  it 'does not raise an error for a ping event without payload' 


  it "doesn't emit when the hook is inactive" 


  it 'emits normally with sufficient arguments' 


  context 'with category filters' do
    let(:category) { Fabricate(:category) }
    let(:topic) { Fabricate(:topic) }
    let(:topic_with_category) { Fabricate(:topic, category_id: category.id) }
    let(:topic_hook) { Fabricate(:topic_web_hook, categories: [category]) }

    it "doesn't emit when event is not related with defined categories" 


    it 'emit when event is related with defined categories' 

  end

  describe '#web_hook_request' do
    it 'creates delivery event record' 


    it 'sets up proper request headers' 

  end
end

