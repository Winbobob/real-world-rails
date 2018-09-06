# frozen_string_literal: true

require 'rails_helper'

describe ArticlesController do
  render_views

  let(:article) { create(:article) }
  let(:user) { create(:user) }
  let(:second_user) { create(:user, username: 'SecondUser') }
  let(:course) { create(:course) }
  let!(:revision1) do
    create(:revision, article_id: article.id, user_id: user.id,
                      date: course.start + 1.day, mw_rev_id: 123)
  end
  let!(:revision2) do
    create(:revision, article_id: article.id, user_id: second_user.id,
                      date: course.end - 1.day, mw_rev_id: 234)
  end

  before do
    create(:courses_user, user_id: user.id, course_id: course.id)
    create(:courses_user, user_id: second_user.id, course_id: course.id)
  end

  describe '#article_data' do
    it 'sets the article from the id' 

  end

  describe '#details' do
    it 'sets the article and coursefrom the ids' 


    it 'sets the first revision, last revision, and list of editors' 

  end
end

