require 'rails_helper'

describe TopicTimestampChanger do
  describe "change!" do
    let(:old_timestamp) { Time.zone.now }
    let(:new_timestamp) { old_timestamp + 1.day }
    let(:topic) { Fabricate(:topic, created_at: old_timestamp) }
    let!(:p1) { Fabricate(:post, topic: topic, created_at: old_timestamp) }
    let!(:p2) { Fabricate(:post, topic: topic, created_at: old_timestamp + 1.day) }

    context 'new timestamp is in the future' do
      let(:new_timestamp) { old_timestamp + 2.day }

      it 'should raise the right error' 

    end

    context 'new timestamp is in the past' do
      let(:new_timestamp) { old_timestamp - 2.day }

      it 'changes the timestamp of the topic and opening post' 


      describe 'when posts have timestamps in the future' do
        let(:new_timestamp) { Time.zone.now }
        let(:p3) { Fabricate(:post, topic: topic, created_at: new_timestamp + 3.day) }

        it 'should set the new timestamp as the default timestamp' 

      end
    end

    it 'deletes the stats cache' 

  end
end

