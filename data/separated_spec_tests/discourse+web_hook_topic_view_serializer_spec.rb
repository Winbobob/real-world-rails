require 'rails_helper'

RSpec.describe WebHookTopicViewSerializer do
  let(:admin) { Fabricate(:admin) }
  let(:topic) { Fabricate(:topic) }

  let(:serializer) do
    WebHookTopicViewSerializer.new(TopicView.new(topic),
      scope: Guardian.new(admin),
      root: false
    )
  end

  before do
    SiteSetting.tagging_enabled = true
  end

  it 'should only include the keys that are sent out in the webhook' 

end

