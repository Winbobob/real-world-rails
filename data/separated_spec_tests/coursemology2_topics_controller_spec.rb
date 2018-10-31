# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Video::TopicsController do
  let!(:instance) { create(:instance, :with_video_component_enabled) }

  with_tenant(:instance) do
    let(:user) { create(:user) }
    let!(:course) { create(:course, :with_video_component_enabled, creator: user) }
    let(:video) { create(:video, :published, course: course) }

    before { sign_in(user) }

    describe '#create' do
      let(:topic_id) { nil }

      subject do
        post :create, as: :json, params: {
          course_id: course, video_id: video,
          timestamp: 5,
          discussion_post: { text: comment }
        }
      end

      context 'when create fails' do
        let(:comment) { nil }

        it 'returns HTTP 400' 

      end

      context 'when create succeeds' do
        let(:comment) { 'new comment' }

        it 'returns HTTP 200' 


        it 'adds a new comment' 


        it 'adds a new topic' 

      end
    end
  end
end

