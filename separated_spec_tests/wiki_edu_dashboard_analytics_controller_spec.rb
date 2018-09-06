# frozen_string_literal: true

require 'rails_helper'

class MockR
  def eval(_string)
    nil
  end

  def before_count
    15
  end

  def before_mean
    5.6
  end

  def after_mean
    50.9
  end
end

describe AnalyticsController do
  let(:user) { create(:user) }
  before do
    allow(controller).to receive(:current_user).and_return(nil)
    create(:campaign, id: 1, title: 'First Campaign')
    create(:campaign, id: 2, title: 'Second Campaign')
    create(:course, id: 1, start: 1.year.ago, end: 1.day.from_now)
    create(:campaigns_course, course_id: 1, campaign_id: 1)

    # We cheat here to skip actually running any R code,
    # since the output is very messy will depend on having specific R packages
    # installed.
    stub_const('R', MockR.new)
  end

  describe '#index' do
    it 'renders' 

  end

  describe '#results' do
    it 'returns a monthly report' 


    it 'returns campaign statistics' 


    it 'return campaign intersection statistics' 


    it 'returns a structural completeness density plot' 


    it 'returns a structural completeness histogram plot' 

  end

  describe '#ungreeted' do
    before do
      create(:courses_user, user_id: user.id, course_id: 1,
                            role: CoursesUsers::Roles::STUDENT_ROLE)
      create(:courses_user, user_id: user.id, course_id: 1,
                            role: CoursesUsers::Roles::WIKI_ED_STAFF_ROLE)
    end
    it 'returns a CSV' 

  end

  describe '#course_csv' do
    let(:course) { create(:course, slug: 'foo/bar_(baz)') }
    it 'returns a CSV' 

  end

  describe '#course_edits_csv' do
    let(:course) { create(:course, slug: 'foo/bar_(baz)') }
    it 'returns a CSV' 

  end

  describe '#course_uploads_csv' do
    let(:course) { create(:course, slug: 'foo/bar_(baz)') }
    it 'returns a CSV' 

  end

  describe '#course_students_csv' do
    let(:course) { create(:course, slug: 'foo/bar_(baz)') }
    it 'returns a CSV' 

  end

  describe '#course_articles_csv' do
    let(:course) { create(:course, slug: 'foo/bar_(baz)') }
    it 'returns a CSV' 

  end

  describe '#all_courses_csv' do
    it 'returns a CSV' 

  end

  describe '#usage' do
    render_views
    it 'renders the stats page' 

  end
end

