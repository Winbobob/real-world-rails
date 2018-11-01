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

describe "Outcome Groups API", type: :request do
  before :once do
    user_with_pseudonym(:active_all => true)
  end

  def revoke_permission(account_user, permission)
    RoleOverride.manage_role_override(account_user.account, account_user.role, permission.to_s, :override => false)
  end

  def create_outcome(opts={})
    group = opts.delete(:group) || @group
    account = opts.delete(:account) || @account
    @outcome = account.created_learning_outcomes.create!({:title => 'new outcome', :vendor_guid => "vendorguid9000"}.merge(opts))
    group.add_outcome(@outcome)
  end

  def add_or_get_rubric(outcome)
    # This is horribly inefficient, but there's not a good
    # way to query by learning outcome id because it's stored
    # in a serialized field :facepalm:.  When we do our outcomes
    # refactor we should get rid of the serialized field here also
    #
    # Don't create a new rubric if one already exists for this outcome
    Rubric.all.each do |r|
      return r if r.data.first[:learning_outcome_id] == outcome.id
    end

    rubric = Rubric.create!(:context => outcome.context)
    rubric.data = [
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
    rubric.save!
    rubric
  end

  def assess_with(outcome, context, user = nil)
    assignment = assignment_model(context: context)
    rubric = add_or_get_rubric(outcome)
    user ||= user_factory(active_all: true)
    context.enroll_student(user) unless context.student_enrollments.exists?(user_id: user.id)
    a = rubric.associate_with(assignment, context, :purpose => 'grading')
    assignment.reload
    submission = assignment.grade_student(user, grade: "10", grader: @teacher).first
    a.assess({
      :user => user,
      :assessor => user,
      :artifact => submission,
      :assessment => {
        :assessment_type => 'grading',
        :criterion_1 => {
          :points => 2,
          :comments => "cool, yo"
        }
      }
    })
    result = outcome.learning_outcome_results.first
    assessment = a.assess({
      :user => user,
      :assessor => user,
      :artifact => submission,
      :assessment => {
        :assessment_type => 'grading',
        :criterion_1 => {
          :points => 3,
          :comments => "cool, yo"
        }
      }
    })
    result.reload
    rubric.reload
    { assignment: assignment, assessment: assessment, rubric: rubric }
  end

  describe "redirect" do
    describe "global context" do
      before :once do
        @account_user = @user.account_users.create(:account => Account.site_admin)
      end

      it "should not require permission" 


      it "should require a user" 


      it "should redirect to the root global group" 


      it "should create the root global group if necessary" 

    end

    describe "account context" do
      before :once do
        @account = Account.default
        @account_user = @user.account_users.create(:account => @account)
      end

      it "should not require manage permission to read" 


      it "should require read permission to read" 


      it "should redirect to the root group" 


      it "should create the root group if necessary" 

    end

    describe "course context" do
      it "should be recognized also" 

    end
  end

  describe "index" do
    before :once do
      @account = Account.default
      @account_user = @user.account_users.create(:account => @account)
    end

    it "should return active groups" 


  end

  describe "link_index" do
    before :once do
      @account = Account.default
      @account_user = @user.account_users.create(:account => @account)
      @group = @account.root_outcome_group
      @links = 3.times.map{ create_outcome }
    end

    it "should return active links" 


    it "should return links ordered by id when paginated" 


    context "assessed trait on outcome link object" do
      let(:check_outcome) do
        ->(outcome, can_edit) do
          expect(outcome).to eq({
            "id" => @outcome.id,
            "vendor_guid" => @outcome.vendor_guid,
            "context_type" => @account.class.to_s,
            "context_id" => @account.id,
            "title" => @outcome.title.to_s,
            "display_name" => nil,
            "url" => api_v1_outcome_path(:id => @outcome.id),
            "can_edit" => can_edit,
            "has_updateable_rubrics" => false
          })
        end
      end

      let(:check_outcome_link) do
        ->(outcome_link, context, group, assessed, can_edit, can_unlink) do
          expect(outcome_link).to eq({
          "context_type" => context.class.to_s,
            "context_id" => context.id,
            "url" => polymorphic_path([:api_v1, context, :outcome_link], :id => group.id, :outcome_id => @outcome.id),
            "assessed" => assessed,
            "can_unlink" => can_unlink,
            "outcome_group" => {
              "id" => group.id,
              "title" => group.title,
              "vendor_guid" => group.vendor_guid,
              "url" => polymorphic_path([:api_v1, context, :outcome_group], :id => group.id),
              "subgroups_url" => polymorphic_path([:api_v1, context, :outcome_group_subgroups], :id => group.id),
              "outcomes_url" => polymorphic_path([:api_v1, context, :outcome_group_outcomes], :id => group.id),
              "can_edit" => can_edit
            }
          })
        end
      end

      it "outcome is not assessed" 


      it "outcome is assessed" 

    end
  end

  describe "show" do
    describe "global context" do
      before :once do
        @account_user = @user.account_users.create(:account => Account.site_admin)
      end

      it "should not require permission" 


      it "should 404 for non-global groups" 


      it "should 404 for deleted groups" 


      it "should return the group json" 


      it "should include parent_outcome_group if non-root" 

    end

    describe "non-global context" do
      before :once do
        @account = Account.default
        @account_user = @user.account_users.create(:account => @account)
      end

      it "should 404 for groups outside the context" 


      it "should include the account in the group json" 

    end
  end

  describe "update" do
    before :once do
      @account = Account.default
      @account_user = @user.account_users.create(:account => @account)
      @root_group = @account.root_outcome_group
      @group = @root_group.child_outcome_groups.create!(
        :title => "Original Title",
        :description => "Original Description")
    end

    it "should require permission" 


    it "should require manage_global_outcomes permission for global outcomes" 


    it "should fail for root groups" 


    it "should allow setting title and description" 


    it "should leave alone fields not provided" 


    it "should allow changing the group's parent" 


    it "should fail if changed parentage would create a cycle" 


    it "should fail (400) if the update is invalid" 


    it "should return the updated group json" 

  end

  describe "destroy" do
    before :once do
      @account = Account.default
      @account_user = @user.account_users.create(:account => @account)
      @root_group = @account.root_outcome_group
      @group = @root_group.child_outcome_groups.create!(:title => 'subgroup', :vendor_guid => "vendorguid9001")
    end

    it "should require permission" 


    it "should require manage_global_outcomes permission for global outcomes" 


    it "should fail for root groups" 


    it "should delete the group" 


    it "should return json of the deleted group" 

  end

  describe "outcomes" do
    before :once do
      @account = Account.default
      @account_user = @user.account_users.create(:account => @account)
      @group = @account.root_outcome_group
    end

    it "should NOT require permission to read" 


    it "should return the outcomes linked into the group" 


    it "should return additional information when 'full' arg passed" 


    it "should not include deleted links" 


    it "should order links by outcome title" 


    it "should paginate the links" 


    context "assessed trait on outcome link object" do
      let(:check_outcome) do
        ->(outcome) do
          expect(outcome).to eq({
            "id" => @outcome.id,
            "vendor_guid" => @outcome.vendor_guid,
            "context_type" => @account.class.to_s,
            "context_id" => @account.id,
            "title" => @outcome.title.to_s,
            "display_name" => nil,
            "url" => api_v1_outcome_path(:id => @outcome.id),
            "can_edit" => !LearningOutcome.find(@outcome.id).assessed?,
            "has_updateable_rubrics" => @outcome.updateable_rubrics?
          })
        end
      end

      let(:check_outcome_link) do
        ->(outcome_link, context, group, assessed, can_unlink) do
          expect(outcome_link).to eq({
          "context_type" => context.class.to_s,
            "context_id" => context.id,
            "url" => polymorphic_path([:api_v1, context, :outcome_link], :id => group.id, :outcome_id => @outcome.id),
            "assessed" => assessed,
            "can_unlink" => can_unlink,
            "outcome_group" => {
              "id" => group.id,
              "title" => group.title,
              "vendor_guid" => group.vendor_guid,
              "url" => polymorphic_path([:api_v1, context, :outcome_group], :id => group.id),
              "subgroups_url" => polymorphic_path([:api_v1, context, :outcome_group_subgroups], :id => group.id),
              "outcomes_url" => polymorphic_path([:api_v1, context, :outcome_group_outcomes], :id => group.id),
              "can_edit" => !assessed
            }
          })
        end
      end

      it "outcome is not assessed" 


      it "outcome is assessed" 


      it "should return can_unlink of 'false' if it cannot unlink" 

    end
  end

  describe "link existing" do
    context "account" do
      before :once do
        @account = Account.default
        @account_user = @user.account_users.create(:account => @account)
        @group = @account.root_outcome_group
        @outcome = LearningOutcome.global.create!(:title => 'subgroup', :vendor_guid => "vendorguid9000")
      end

      it "should require permission" 


      it "should require manage_global_outcomes permission for global groups" 


      it "should fail if the outcome isn't available to the context" 


      it "should link the outcome into the group" 


      context 'moving outcome link to another group' do
        def sub_group_with_outcome
          expect(@group.child_outcome_links).to be_empty
          sub_group = @account.learning_outcome_groups.create!(title: 'some lonely sub group')
          sub_group.add_outcome(@outcome)
          expect(sub_group.child_outcome_links.reload.size).to eq 1
          expect(sub_group.child_outcome_links.first.content).to eq @outcome
          sub_group
        end

        it "should re-use an old link if move_from is included" 


        it "should not re-use an old link if move_from is omitted" 

      end

      it "should return json of the new link" 

    end
  end

  describe "link new" do
    before :once do
      @account = Account.default
      @account_user = @user.account_users.create(:account => @account)
      @group = @account.root_outcome_group
    end

    it "should fail (400) if the new outcome is invalid" 


    it "should create a new outcome" 


    it "should create a new outcome with default values for mastery calculation" 


    it "should link the new outcome into the group" 


    context "creating with calculation options specified" do
      it "should create a new outcome with calculation options specified" 


      it "should fail (400) to create a new outcome with illegal calculation options" 


      context "should fail (400) to create a new outcome with an illegal calculation_int" do
        methods = [
          'decaying_average',
          'n_mastery',
          'highest',
          'latest'
        ]

        methods.each do |method|
          it "should fail (400) to create a new outcome with an illegal calculation_int" 

        end
      end
    end
  end

  describe "unlink" do
    before :once do
      @account = Account.default
      @account_user = @user.account_users.create(:account => @account)
      @group = @account.root_outcome_group
      @outcome = LearningOutcome.global.create!(:title => 'outcome', :vendor_guid => "vendorguid9000")
      @group.add_outcome(@outcome)
    end

    it "should require permission" 


    it "should require manage_global_outcomes permission for global groups" 


    it "should 404 if the outcome isn't linked in the group" 


    it "should fail (400) if this is the last link for an aligned outcome" 


    it "should unlink the outcome from the group" 


    it "should return json of the removed link" 

  end

  describe "subgroups" do
    before :once do
      @account = Account.default
      @account_user = @user.account_users.create(:account => @account)
      @group = @account.root_outcome_group
    end

    it "should NOT require permission to read" 


    def create_subgroup(opts={})
      group = opts.delete(:group) || @group
      group.child_outcome_groups.create!({:title => 'subgroup', :vendor_guid => 'blahblah'}.merge(opts))
    end

    it "should return the subgroups under the group" 


    it "should not include deleted subgroups" 


    it "should order subgroups by title" 


    it "should paginate the subgroups" 

  end

  describe "create" do
    before :once do
      @account = Account.default
      @account_user = @user.account_users.create(:account => @account)
      @group = @account.root_outcome_group
    end

    it "should require permission" 


    it "should require manage_global_outcomes permission for global groups" 


    it "should create a new outcome group" 


    it "should return json of the new subgroup" 

  end

  describe "import" do
    before :once do
      @account = Account.default
      @account_user = @user.account_users.create(:account => @account)
      @source_group = LearningOutcomeGroup.global_root_outcome_group.child_outcome_groups.create!(
        :title => "Source Group",
        :description => "Description of source group",
        :vendor_guid => "vendorguid9000"
      )
      @target_group = @account.root_outcome_group
    end

    it "should require permission" 


    it "should require manage_global_outcomes permission for global groups" 


    it "should fail if the source group doesn't exist (or is deleted)" 


    it "should fail if the source group isn't available to the context" 


    it "should create a new outcome group" 


    it "should return json of the new subgroup" 


    context "with async true" do
      it "creates and returns progress object" 


      it "creates the outcome group asynchronously" 

    end
  end
end

