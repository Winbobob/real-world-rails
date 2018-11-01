require 'rails_helper'

describe TopicSerializer, type: :serializer do
  let(:topic)      { create(:topic) }
  let(:serializer) { TopicSerializer.new(topic) }

  describe '#to_json output' do
    let(:json)   { serializer.to_json }
    let(:parsed) { JSON.parse(json) }

    topic_key = 'topic'

    it "includes '#{topic_key}' key" 


    describe "'#{topic_key}' object" do
      let(:parsed_topic) { parsed[topic_key] }

      section_key = 'section'

      it 'has the correct keys' 


      it "includes a '#{section_key}' Hash" 

    end
  end
end

