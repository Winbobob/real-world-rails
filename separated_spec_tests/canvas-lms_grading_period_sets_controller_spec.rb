#
# Copyright (C) 2016 - present Instructure, Inc.
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

RSpec.describe GradingPeriodSetsController, type: :controller do
  let(:group_helper) { Factories::GradingPeriodGroupHelper.new }

  context "given a root account" do
    let(:root_account) { Account.default }
    let(:enrollment_term) { root_account.enrollment_terms.first }
    let(:valid_session) { {} }

    before do
      request.accept = 'application/json'
      @root_user = root_account.users.create! do |user|
        user.accept_terms
        user.register!
      end
      user_session(@root_user)
    end

    describe "GET #index" do
      before :once do
        @groups = (1..10).map do |i|
          group_helper.create_for_account(root_account, title: "Grading Period Set #{i}")
        end
      end

      it "fetches grading period sets" 


      it "includes grading periods" 


      it "paginates the grading period sets" 


      it "orders the grading period sets by id" 

    end

    describe "POST #create" do
      let(:post_create) do
        post :create, params: {
          account_id: root_account.to_param,
          enrollment_term_ids: [enrollment_term.to_param],
          grading_period_set: group_helper.valid_attributes(weighted: true)
        }, session: valid_session
      end

      context "with valid params" do
        it "creates a new GradingPeriodSet" 


        it "returns a json representation of a new set" 

      end

      it "does not require enrollment_term_ids" 


      context "given a sub account enrollment term" do
        let(:sub_account) { root_account.sub_accounts.create! }
        let(:sub_account_enrollment_term) do
          sub_account.enrollment_terms.create!
        end

        it "returns a Not Found status code" 

      end
    end

    describe "PATCH #update" do
      let(:new_attributes) { { title: 'An updated title!', weighted: false } }
      let(:grading_period_set) { group_helper.create_for_account(root_account) }

      context "with valid params" do
        let(:patch_update) do
          patch :update, params: {
            account_id: root_account.to_param,
            id: grading_period_set.to_param,
            enrollment_term_ids: [enrollment_term.to_param],
            grading_period_set: new_attributes
          }, session: valid_session
        end

        it "updates the requested grading_period_set" 


        it "returns no content" 


        it 'recomputes grades when an enrollment term is removed from the set' 

      end

      it "defaults enrollment_term_ids to empty array" 


      context "given a sub account enrollment term" do
        let(:sub_account) { root_account.sub_accounts.create! }
        let(:sub_account_enrollment_term) do
          sub_account.enrollment_terms.create!
        end

        it "returns a Not Found status code" 

      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested grading period set" 

    end

    context "given a sub account" do
      let(:sub_account) { root_account.sub_accounts.create! }

      describe "GET #index" do
        it "it fetches sets through the root account" 

      end
    end
  end
end

