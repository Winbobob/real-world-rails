#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

lib = (Class.new do
  include Api::V1::Outcome

  def api_v1_outcome_path(opts)
    "/api/v1/outcome/#{opts.fetch(:id)}"
  end
s
  def polymorphic_path(*_args)
    '/test'
  end
end).new

RSpec.describe "Api::V1::Outcome" do
  def new_outcome(creation_params = {})
    creation_params.reverse_merge!({
      :title => 'TMNT Beats',
      :calculation_method => 'decaying_average',
      :calculation_int => 65,
      :display_name => "Ninja Rap",
      :description => "Turtles with Vanilla Ice",
      :vendor_guid => "TurtleTime4002",
    })

    @outcome = LearningOutcome.create!(creation_params)
    @outcome
  end

  def new_outcome_link(creation_params = {}, course = nil)
    outcome = new_outcome(creation_params) # sets @outcome
    unless course
      course_with_teacher(active_all: true)  # sets @course
      course = @course
    end
    course.root_outcome_group.add_outcome(outcome)
  end

  context "json" do
    let(:outcome_params) do
      {
        :title => 'TMNT Beats',
        :calculation_method => 'decaying_average',
        :calculation_int => 65,
        :display_name => "Ninja Rap",
        :description => "Turtles with Vanilla Ice",
        :vendor_guid => "TurtleTime4002",
      }
    end

    context "outcome json" do
      let(:check_outcome_json) do
        ->(outcome) do
          expect(outcome['title']).to eq(outcome_params[:title])
          expect(outcome['calculation_method']).to eq(outcome_params[:calculation_method])
          expect(outcome['calculation_int']).to eq(outcome_params[:calculation_int])
          expect(outcome['display_name']).to eq(outcome_params[:display_name])
          expect(outcome['description']).to eq(outcome_params[:description])
          expect(outcome['vendor_guid']).to eq(outcome_params[:vendor_guid])
          expect(outcome['assessed']).to eq(LearningOutcome.find(outcome['id']).assessed? ? true : false)
          expect(outcome['has_updateable_rubrics']).to eq(
            LearningOutcome.find(outcome['id']).updateable_rubrics?
          )
          expect(outcome['ratings'].length).to eq 3
        end
      end

      it "returns the json for an outcome" 


      it "returns the json for multiple outcomes" 

    end

    context "outcome links json" do
      let(:check_outcome_link_json) do
        ->(outcome, course, outcome_link) do
          expect(outcome_link['outcome']['id']).to eq(outcome.id)
          expect(outcome_link['outcome']['title']).to eq(outcome_params[:title])
          expect(outcome_link['outcome']['vendor_guid']).to eq(outcome_params[:vendor_guid])

          expect(outcome_link['context_type']).to eq("Course")
          expect(outcome_link['context_id']).to eq(course.id)
          expect(outcome_link['url']).to eq(lib.polymorphic_path)

          expect(outcome_link['outcome_group']['id']).to eq(course.root_outcome_group.id)
        end
      end

      it "returns the json for an outcome link" 


      it "returns the json for multiple outcome links" 

    end
  end
end

