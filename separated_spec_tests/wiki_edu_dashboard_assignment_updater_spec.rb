# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/assignment_updater"

describe AssignmentUpdater do
  describe '.update_assignment_article_ids' do
    let(:course) { create(:course) }
    let(:user) { create(:user) }
    let!(:courses_user) do
      create(:courses_user, user_id: user.id, course_id: course.id, role: 0)
    end

    let!(:assignment) do
      create(:assignment, course_id: course.id,
                          user_id: user.id,
                          role: 0,
                          article_id: nil,
                          article_title: 'Deep_Sea_Fishing')
    end
    let!(:another_assignment) do
      create(:assignment, course_id: course.id,
                          user_id: user.id,
                          role: 0,
                          article_id: nil,
                          article_title: 'Scuba_Diving')
    end

    it 'updates assignments with only titles to include an article_id' 


    it 'updates assignment titles to exactly match article titles' 


    context 'when a case-variant assignment and an exact title assignment both exist' do
      let!(:case_variant_assignment) do
        create(:assignment, course_id: course.id,
                            user_id: user.id,
                            role: 0,
                            article_id: nil,
                            article_title: 'Deep_sea_FISHing')
      end
      let!(:article) { create(:article, title: 'Deep_sea_FISHing') }
      let!(:another_article) { create(:article, title: 'Scuba_DIVING') }
      it 'updates the records it can and does not raise an error' 

    end
  end
end

