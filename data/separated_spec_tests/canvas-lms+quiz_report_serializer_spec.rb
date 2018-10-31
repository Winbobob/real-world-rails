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

shared_examples_for 'QuizReportSerializer Associations' do

  it 'should embed its attachment as :file when present' 


  it 'should embed its progress when present' 

end

describe Quizzes::QuizReportSerializer do
  let :context do
    Course.new.tap do |course|
      course.id = 1
      course.save!
    end
  end
  let :quiz do
    context.quizzes.build(title: 'banana split').tap do |quiz|
      quiz.id = 2
      quiz.save!
    end
  end

  let :statistics do
    quiz.current_statistics_for('student_analysis')
  end

  let(:user) { User.new }
  let(:session) { double }
  let(:host_name) { 'example.com' }

  let :controller do
    ActiveModel::FakeController.new({}).tap do |controller|
      allow(controller).to receive(:session).and_return session
      allow(controller).to receive(:context).and_return context
    end
  end

  subject do
    Quizzes::QuizReportSerializer.new(statistics, {
      controller: controller,
      scope: user,
      session: session
    })
  end

  let :json do
    @json ||= subject.as_json[:quiz_report].stringify_keys
  end

  context 'format independent' do
    %w[
      report_type readable_type includes_all_versions anonymous
      created_at updated_at
    ].each do |attr|
      it "serializes #{attr}" 

    end

    it 'should expose whether the report is generatable' 


    it 'should link to itself' 

  end

  context 'JSON-API' do
    before do
      expect(controller).to receive(:accepts_jsonapi?).at_least(:once).and_return true
    end

    it 'serializes id' 


    context 'associations' do
      include_examples 'QuizReportSerializer Associations'

      it 'should link to the quiz' 

    end
  end

  context 'legacy JSON' do
    before do
      expect(controller).to receive(:accepts_jsonapi?).at_least(:once).and_return false
    end

    it 'serializes id' 


    it 'should include quiz_id' 


    it 'should include the progress_url' 


    context 'associations' do
      include_examples 'QuizReportSerializer Associations'
    end
  end
end

