#
# Copyright (C) 2014 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.

require 'spec_helper'

describe Quizzes::QuizStatisticsSerializer do

  let :context do
    Course.new.tap do |course|
      course.id = 1
      course.save!
    end
  end

  let :quiz do
    context.quizzes.build(title: 'banana split').tap do |quiz|
      quiz.id = 1
      quiz.save!
    end
  end

  let :statistics do
    analyses = [
      quiz.current_statistics_for('student_analysis'),
      quiz.current_statistics_for('item_analysis')
    ]

    analyses.each do |analysis|
      analysis.quiz = quiz
    end

    Quizzes::QuizStatisticsSerializer::Input.new(quiz, {}, *analyses)
  end

  let(:user) { User.new }
  let(:session) { double }
  let(:host_name) { 'example.com' }

  let :controller do
    options = {
      accepts_jsonapi: true,
      stringify_json_ids: false
    }

    ActiveModel::FakeController.new(options).tap do |controller|
      allow(controller).to receive(:session).and_return session
      allow(controller).to receive(:context).and_return context
    end
  end

  subject do
    Quizzes::QuizStatisticsSerializer.new(statistics, {
      controller: controller,
      scope: user,
      session: session
    })
  end

  before do
    @json = subject.as_json[:quiz_statistics].stringify_keys
  end

  %w[
    question_statistics submission_statistics multiple_attempts_exist
    includes_all_versions generated_at
  ].each do |attr|
    it "serializes #{attr}" 

  end

  it 'serializes generated_at to point to the earliest report date' 


  it 'de-scopifies submission statistic keys' 


  it 'serializes url' 


  it 'serializes quiz url' 


  it 'stringifies question_statistics ids' 


  it 'munges item_analysis with question_statistics' 

end

