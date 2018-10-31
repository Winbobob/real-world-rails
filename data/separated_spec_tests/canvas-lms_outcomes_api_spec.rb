
#
# Copyright (C) 2012 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe "Outcomes API", type: :request do
  def context_outcome(context)
    @outcome_group ||= context.root_outcome_group
    @outcome = context.created_learning_outcomes.create!(:title => 'outcome')
    @outcome_group.add_outcome(@outcome)
  end

  def course_outcome
    context_outcome(@course)
  end

  def account_outcome
    context_outcome(@account)
  end

  def outcome_json(outcome=@outcome, presets={})
    retval = {
      "id"                 => presets[:id]                 || outcome.id,
      "context_id"         => presets[:context_id]         || outcome.context_id,
      "context_type"       => presets[:context_type]       || outcome.context_type,
      "title"              => presets[:title]              || outcome.title,
      "display_name"       => presets[:display_name]       || outcome.display_name,
      "url"                => presets[:url]                || api_v1_outcome_path(:id => outcome.id),
      "vendor_guid"        => presets[:vendor_guid]        || outcome.vendor_guid,
      "can_edit"           => presets[:can_edit]           || true,
      "description"        => presets[:description]        || outcome.description,
      "assessed"           => presets[:assessed]           || outcome.assessed?,
      "calculation_method" => presets[:calculation_method] || outcome.calculation_method,
    }

    retval['has_updateable_rubrics'] = if presets[:has_updateable_rubrics].nil?
                                         outcome.updateable_rubrics?
                                       else
                                         presets[:has_updateable_rubrics]
                                       end

    if %w[decaying_average n_mastery].include?(retval["calculation_method"])
      retval["calculation_int"] = presets[:calculation_int] || outcome.calculation_int
    end

    if criterion = outcome.data && outcome.data[:rubric_criterion]
      retval["points_possible"] = presets[:points_possible] || criterion[:points_possible].to_i
      retval["mastery_points"]  = presets[:mastery_points]  || criterion[:mastery_points].to_i
      retval["ratings"]         = presets[:ratings]         || criterion[:ratings].map{ |d| d.stringify_keys }
    end

    retval
  end

  def assess_outcome(outcome=@outcome, assess=true)
    @rubric = Rubric.create!(:context => @course)
    @rubric.data = [
      {
        :points => 3,
        :description => "Outcome row",
        :id => 1,
        :ratings => [
          {
            :points => 3,
            :description => "Rockin'",
            :criterion_id => 1,
            :id => 2
          },
          {
            :points => 0,
            :description => "Lame",
            :criterion_id => 1,
            :id => 3
          }
        ],
        :learning_outcome_id => outcome.id
      }
    ]
    @rubric.save!
    return unless assess
    @e = @course.enroll_student(@student)
    @a = @rubric.associate_with(@assignment, @course, :purpose => 'grading')
    @assignment.reload
    @submission = @assignment.grade_student(@student, grade: "10", grader: @teacher).first
    @assessment = @a.assess({
      :user => @student,
      :assessor => @teacher,
      :artifact => @submission,
      :assessment => {
        :assessment_type => 'grading',
        :criterion_1 => {
          :points => 2,
          :comments => "cool, yo"
        }
      }
    })
    @result = outcome.learning_outcome_results.first
    @assessment = @a.assess({
      :user => @student,
      :assessor => @teacher,
      :artifact => @submission,
      :assessment => {
        :assessment_type => 'grading',
        :criterion_1 => {
          :points => 3,
          :comments => "cool, yo"
        }
      }
    })
    @result.reload
    @rubric.reload
  end

  def outcomes_json(outcomes=@outcomes, presets={})
    outcomes.map { |o| outcome_json(o) }
  end

  context "account outcomes" do
    before :once do
      user_with_pseudonym(:active_all => true)
      @account = Account.default
      @account_user = @user.account_users.create(:account => @account)
      @outcome = @account.created_learning_outcomes.create!(
        :title => "My Outcome",
        :description => "Description of my outcome",
        :vendor_guid => "vendorguid9000"
      )
    end

    def revoke_permission(account_user, permission)
      RoleOverride.manage_role_override(account_user.account, account_user.role, permission.to_s, :override => false)
    end

    describe "show" do
      it "should not require manage permission" 


      it "should require read permission" 


      it "should not require any permission for global outcomes" 


      it "should still require a user for global outcomes" 


      it "should 404 for deleted outcomes" 


      it "should return the outcome json" 


      it "should include criterion if it has one" 


      it "should report calculation methods that are nil as highest so old outcomes continue to behave the same before we added a calculation_method" 


      it "should report as assessed if assessments exist in any aligned course" 

    end

    describe "update" do
      it "should require manage permission" 


      it "should require manage_global_outcomes permission for global outcomes" 


      it "should fail (400) if the outcome is invalid" 


      it "should update the outcome" 


      it "should leave alone fields not provided" 


      it "should return the updated outcome json" 


      context "calculation options" do
        before :once do
          # set criterion so we get back our calculation_method
          criterion = {
            :mastery_points => 3,
            :ratings => [
              { :points => 5, :description => "Exceeds Expectations" },
              { :points => 3, :description => "Meets Expectations" },
              { :points => 0, :description => "Does Not Meet Expectations" }
            ]
          }
          @outcome.rubric_criterion = criterion
          @outcome.save!
        end

        it "should allow updating calculation method" 


        it "should allow updating the calculation int" 


        context "should not allow updating the calculation_int to an illegal value for the calculation_method" do
          before :once do
            # outcome calculation_method needs to be something not used as a test case
            @outcome.calculation_method = 'decaying_average'
            @outcome.calculation_int = 75
            @outcome.save!
          end

          method_to_int = {
            "decaying_average" => { good: 67, bad: 125 },
            "n_mastery" => { good: 4, bad: 29 },
            "highest" => { good: nil, bad: 4 },
            "latest" => { good: nil, bad: 79 },
          }

          method_to_int.each do |method, int|
            it "should not allow updating the calculation_int to an illegal value for the calculation_method '#{method}'" 

          end
        end

        it "should set a default calculation_method of 'highest' if the record is being re-saved (previously created)" 


        it "should return a sensible error message for an incorrect calculation_method" 


        context "sensible error message for an incorrect calculation_int" do
          method_to_int = {
            "decaying_average" => 77,
            "n_mastery" => 4,
            "highest" => nil,
            "latest" => nil,
          }
          norm_error_message = "not a valid value for this calculation method"
          no_calc_int_error_message = "A calculation value is not used with this calculation method"
          bad_calc_int = 1500

          method_to_int.each do |method, int|
            it "should return a sensible error message for an incorrect calculation_int when calculation_method is #{method}" 

          end
        end
      end
    end
  end

  context "course outcomes" do
    before :once do
      user_with_pseudonym(active_all: true)
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
      assignment_model({:course => @course})
      @account = Account.default
      account_admin_user
      @outcome =@course.created_learning_outcomes.create!(
        :title => "My Outcome",
        :description => "Description of my outcome",
        :vendor_guid => "vendorguid9000"
      )
    end

    describe "show" do
      context "properly reports whether it has been assessed" do
        it "reports not being assessed" 


        it "reports being assessed" 

      end

      context "properly reports whether it has updateable rubrics" do
        it "reports with no updateable rubrics" 


        it "reports with updateable rubrics" 

      end
    end

    describe "update" do
      context "mastery calculations" do
        context "not allow updating the outcome after being used for assessing" do
          before :each do
            @outcome.calculation_method = 'decaying_average'
            @outcome.calculation_int = 62
            @outcome.save!
            @outcome.reload

            assess_outcome(@outcome)
          end

          let(:update_outcome_api) do
            ->(attrs) do
              api_call(:put, "/api/v1/outcomes/#{@outcome.id}",
                     { :controller => 'outcomes_api',
                       :action => 'update',
                       :id => @outcome.id.to_s,
                       :format => 'json' },
                     attrs, {},
                     { :expected_status => 400 })
            end
          end

          let(:update_hash) do
            {
              title: "Here I am",
              display_name: "Rock you like a hurricane",
              description: "Winds of Change",
              vendor_guid: "Eye of the Tiger",
              calculation_method: "n_mastery",
              calculation_int: "2",
              mastery_points: "4",
              ratings: "none",
            }
          end

          it "should allow updating calculation method after being used for assessing" 


          it "should allow updating calculation int after being used for assessing" 


          it "should allow updating text-only fields even when assessed" 


          context "updating rubric criterion when assessed" do
            before :each do
              @outcome2 = @course.created_learning_outcomes.create!(:title => 'outcome')
              @course.root_outcome_group.add_outcome(@outcome2)
              @outcome2.rubric_criterion = {
                mastery_points: 5,
                ratings: [{ description: "Strong work", points: 5}, { description: "Weak sauce", points: 1}],
              }
              @outcome2.save!
              assess_outcome(@outcome2)
            end

            it "should allow updating rating descriptions even when assessed" 


            it "should allow updating rating points" 


            it "should allow updating mastery points" 

          end
        end
      end
    end
  end
end

