# frozen_string_literal: true

require 'rails_helper'

describe DashboardController do
  describe '#index' do
    let(:course) { create(:course, end: 2.days.ago) }
    let(:admin) { create(:admin) }

    context 'when the user is not logged it' do
      it 'redirects to landing page' 

    end

    context 'when user is an admin' do
      before do
        allow(controller).to receive(:current_user).and_return(admin)
        create(:courses_user, user_id: admin.id, course_id: course.id)
      end

      it 'sets past courses to include just-ended ones' 

    end

    context 'when the blog is down' do
      before do
        allow(controller).to receive(:current_user).and_return(admin)
        Rails.cache.clear
      end

      it 'sets @blog_posts to empty array' 

    end
  end
end

