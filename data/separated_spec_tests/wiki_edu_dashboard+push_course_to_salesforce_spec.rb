# frozen_string_literal: true

require 'rails_helper'

describe PushCourseToSalesforce do
  let(:course) { create(:course, flags: flags, expected_students: 51, withdrawn: true) }
  let(:content_expert) { create(:admin) }
  let(:subject) { described_class.new(course) }
  let(:salesforce_id) { 'a2qQ0101015h4HF' }
  let(:week) { create(:week, course: course) }

  before do
    Setting.create(key: 'content_expert_salesforce_ids',
                   value: { content_expert.username => 'abcdefg' })
    JoinCourse.new(course: course, user: content_expert,
                   role: CoursesUsers::Roles::WIKI_ED_STAFF_ROLE)
  end

  context 'when a course has a Salesforce record already' do
    let(:flags) { { salesforce_id: salesforce_id } }

    it 'updates the record' 


    it 'works for a VisitingScholarship' 


    it 'works for a FellowsCohort' 


    it 'handles Salesforce API downtime gracefully' 


    context 'when the course has sandbox and mainspace blocks' do
      before do
        # These are used for generate date for some optional fields.
        create(:block, week: week, title: 'Start drafting your contributions')
        create(:block, week: week, title: 'Begin moving your work to Wikipedia')
      end

      it 'sets the sandbox and mainspace assignment blocks' 

    end

    context 'when the course lacks sandbox and mainspace blocks' do
      it 'the sandbox and mainspace assignment blocks are nil' 

    end
  end

  context 'when a course does not have a Salesforce record' do
    let(:flags) { {} }

    it 'creates the record and saves the ID as a course flag' 

  end
end

