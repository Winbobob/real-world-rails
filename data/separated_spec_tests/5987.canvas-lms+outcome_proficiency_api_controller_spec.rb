#
# Copyright (C) 2018 - present Instructure, Inc.
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

describe OutcomeProficiencyApiController, type: :request do
  before :once do
    @user = user_with_pseudonym :active_all => true
    @account = Account.default
    @account_user = @account.account_users.create!(user: @user)
  end

  describe '.create' do
    let(:ratings) { [{ description: '1', points: 1, mastery: true, color: '000000' }] }
    let(:revoke_permissions) { false }

    def revoke_manage_outcomes
      RoleOverride.manage_role_override(@account, @account_user.role, 'manage_outcomes', :override => false)
    end

    before do
      revoke_manage_outcomes if revoke_permissions
      @json = api_call(:post,
       "/api/v1/accounts/#{@account.id}/outcome_proficiency",
       {
         controller: 'outcome_proficiency_api',
         action: 'create',
         format: 'json',
         account_id: @account.id.to_s
       },
       {
         ratings: ratings
       })
    end

    context 'missing permissions' do
      let(:revoke_permissions) { true }

      it 'returns 401 status' 


      it 'returns unauthorized message' 

    end

    context 'invalid proficiencies' do
      shared_examples 'bad mastery ratings' do
        it 'returns 422 status' 


        it 'returns mastery error' 

      end

      context 'empty ratings' do
        let(:ratings) { [] }

        it 'returns 422 status' 


        it 'returns missing required ratings error' 

      end

      context 'missing mastery rating' do
        let(:ratings) { [{ description: '1', points: 1, mastery: false, color: '000000' }] }

        include_examples 'bad mastery ratings'
      end

      context 'two mastery ratings' do
        let(:ratings) do
          [ { description: '1', points: 1, mastery: true, color: 'ff0000' },
            { description: '2', points: 2, mastery: true, color: '00ff00' } ]
        end

        include_examples 'bad mastery ratings'
      end
    end

    context 'valid proficiencies' do
      let(:ratings) { [{ description: '1', points: 1, mastery: true, color: '000000' }] }

      it 'returns 200 status' 


      it 'returns proficiency json' 


      it 'creates proficiency on account' 

    end

    context 'update proficiencies' do
      before do
        @proficiency = @account.outcome_proficiency
        api_call(:post,
          "/api/v1/accounts/#{@account.id}/outcome_proficiency",
          {
           controller: 'outcome_proficiency_api',
           action: 'create',
           format: 'json',
           account_id: @account.id.to_s
          },
          {
            ratings: updated_ratings
          })
        @proficiency.reload
      end

      shared_examples 'update ratings' do
        it 'returns 200 status' 


        it 'updates ratings' 

      end

      context 'maintain same number of ratings' do
        let(:updated_ratings) do
          [ { description: '2', points: 2, mastery: true, color: '00ff00' },
            { description: '1', points: 1, mastery: false, color: 'ff0000' } ]
        end

        include_examples 'update ratings'
      end

      context 'increase number of ratings' do
        let(:updated_ratings) do
          [ { description: '2', points: 2, mastery: true, color: '00ff00' },
            { description: '1', points: 1, mastery: false, color: '0000ff' },
            { description: '0', points: 0, mastery: false, color: 'ff0000' } ]
        end

        include_examples 'update ratings'
      end

      context 'decrease number of ratings' do
        let(:updated_ratings) do
          [ { description: '2', points: 2, mastery: true, color: '000000' } ]
        end

        include_examples 'update ratings'
      end

      context 'empty ratings' do
        let(:updated_ratings) { [] }

        it 'does not delete previous ratings' 

      end
    end
  end

  describe '.show' do
    context 'no outcome proficiency' do
      it 'returns 404 status' 

    end

    context 'account outcome proficiency' do
      before :once do
        @proficiency = outcome_proficiency_model(@account)
      end

      it 'returns proficiency' 


      it "returns 200 status" 

    end
  end
end

