#
# Copyright (C) 2013 - present Instructure, Inc.
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
#

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe Outcomes::ResultAnalytics do

  # import some stuff so we don't have to spell it out all the time
  let(:ra) { Outcomes::ResultAnalytics }
  let(:time) { Time.now }
  Rollup = Outcomes::ResultAnalytics::Rollup

  # ResultAnalytics only uses a few fields, so use some mock stuff to avoid all
  # the surrounding database logic
  MockUser = Struct.new(:id, :name)
  MockOutcome = Struct.new(:id, :calculation_method, :calculation_int, :rubric_criterion)
  class MockOutcomeResult < Struct.new(:user, :learning_outcome, :score, :title, :submitted_at, :assessed_at, :hide_points, :artifact_type, :percent, :possible, :association_id, :association_type)
    def initialize *args
      return super unless (args.first.is_a?(Hash) && args.length == 1)
      args.first.each_pair do |k, v|
        self[k] = v
      end
    end

    def learning_outcome_id
      learning_outcome.id
    end

    def user_id
      user.id
    end
  end

  def outcome_from_score(score, args)
    title = args[:title] || "name, o1"
    outcome = args[:outcome] || create_outcome(args)
    user = args[:user] || MockUser[10, 'a']
    MockOutcomeResult[user, outcome, score, title, args[:submitted_time], args[:assessed_time], args[:hide_points]]
  end

  def create_outcome(args)
    # score defaulting to highest is to ensure we don't alter behavior on
    # outcomes that predate the newer calculation methods
    id = args[:id] || 80
    method = args[:method] || "highest"
    criterion = args[:criterion] || {mastery_points: 3.0}
    MockOutcome[id, method, args[:calc_int], criterion]
  end

  def create_quiz_outcome_results(outcome, title, *results)
    defaults = {
      user: MockUser[10, 'a'],
      learning_outcome: outcome,
      title: title,
      assessed_at: time,
      artifact_type: "Quizzes::QuizSubmission",
      association_type: "Quizzes::Quiz",
      score: 1.0
    }
    results.map do |result|
      result_params = defaults.merge(result)
      MockOutcomeResult.new(result_params)
    end
  end

  describe "#find_outcome_results" do
    before(:once) do
      course_with_student
      course_with_teacher(course: @course)
      rubric = outcome_with_rubric context: @course
      @assignment = assignment_model
      @alignment = @outcome.align(@assignment, @course)
      @rubric_association = rubric.associate_with(@assignment, @course, purpose: 'grading')
      lor
      lor(hidden: true)
    end

    def lor(opts = {})
      LearningOutcomeResult.create!(
        context: @course,
        learning_outcome: @outcome,
        user: @student,
        alignment: @alignment,
        association_type: 'RubricAssociation',
        association_id: @rubric_association.id,
        **opts
      )
    end

    it 'does not return hidden outcome results' 


    it 'returns hidden outcome results when include_hidden is true' 


    it 'does not return muted assignment results' 

  end

  describe '#rollup_user_results' do
    it 'returns a rollup score for each distinct outcome_id' 


    it 'does not return rollup scores when all results are nil' 

  end

  describe '#mastery calculation' do
    it 'returns maximum score when no method is set' 


    it 'returns maximum score when highest score method is selected' 


    it 'returns correct score when latest score method is selected' 


    it 'properly calculates results when method is n# of scores for mastery' 


    it 'does not error out and correctly averages when a result has a score of nil' 


    it 'properly calculates results when method is decaying average' 


    it 'properly sorts results when there is no submitted_at time on one or many results' 


    it 'rounds results for decaying average and n_mastery methods' 

  end

  describe '#outcome_results_rollups' do
    before do
      allow_any_instance_of(ActiveRecord::Associations::Preloader).to receive(:preload)
    end
    it 'returns a rollup for each distinct user_id' 


    it 'excludes missing user rollups' 


    it 'returns hide_points value of true if all results have hide_points set to true' 


    it 'returns hide_points value of false if any results have hide_points set to false' 

  end

  describe '#aggregate_outcome_results_rollup' do
    before do
      allow_any_instance_of(ActiveRecord::Associations::Preloader).to receive(:preload)
    end

    context 'with results' do
      let(:results) do
        [
          # the next two scores for the same user and outcome get combined into an
          # overall score of 1.0 using the "highest" calculation method
          outcome_from_score(0.0, {}),
          outcome_from_score(1.0, {}),
          outcome_from_score(5.0, {id: 81}),
          outcome_from_score(2.0, {user: MockUser[20, 'b']}),
          outcome_from_score(6.0, {id: 81, user: MockUser[20, 'b']}),
          outcome_from_score(3.0, {user: MockUser[30, 'c']}),
          outcome_from_score(40.0, {user: MockUser[40, 'd']}),
          outcome_from_score(70.0, {id: 81, user: MockUser[40, 'd']})
        ]
      end

      it 'returns one rollup with the rollup averages' 


      it 'returns one rollup with the rollup medians' 

    end

    it "properly calculates a mix of assignment and quiz results" 


    it 'falls back to using mastery score if points possible is 0 or nil' 

  end

  describe "handling quiz outcome results objects" do
    it "scales quiz scores to rubric score" 

  end

  describe "handling scores for matching outcomes in results" do

    it "does not create false matches" 


    it "properly aligns and weights decaying average results for matches" 


    it "properly aligns and weights latest score results for matches" 


    it "does not use aggregate score when calculation method is 'highest'" 


    it "does not use aggregate score when calculation method is 'n_mastery'" 

  end
end

