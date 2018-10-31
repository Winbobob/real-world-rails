require 'rails_helper'

describe ResetLessonCacheWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let!(:user) { create(:user) }

    before do
      $redis.set("user_id:#{user.id}_lessons_array", ["something"])
    end

    it 'should delete the redis cache and set lesson cache for user' 

  end
end

