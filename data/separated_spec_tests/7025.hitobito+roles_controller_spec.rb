# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe RolesController do

  before { sign_in(people(:top_leader)) }

  let(:group)  { groups(:top_group) }
  let(:person) { Fabricate(:person) }
  let(:role) { Fabricate(Group::TopGroup::Member.name.to_sym, person: person, group: group) }

  it 'GET new sets a role of the correct type' 


  describe 'POST create' do
    it 'new role for existing person redirects to people list' 


    it 'new role for new person redirects to person show' 


    it 'new role for different group redirects to groups people list' 


    it 'without name renders form again' 


    it 'without type displays error' 


    it 'with invalid person_id displays error' 


    context 'as group_full' do
      before { sign_in(Fabricate(Group::TopGroup::Secretary.name.to_sym, group: group).person) }

      it 'new role for existing person redirects to people list' 


      it 'new role for different group is not allowed' 

    end

    context 'with add request' do
      before { sign_in(user) }

      let(:user) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_one)).person }
      let(:person) { Fabricate(Group::TopGroup::LocalSecretary.name, group: groups(:top_group)).person }
      let(:group) { groups(:bottom_group_one_one) }

      before { groups(:top_layer).update_column(:require_person_add_requests, true) }

      it 'creates request' 


      it 'creates role if person already visible' 


      it 'informs about existing request' 

    end

    context 'with impersonation' do
      let(:origin_user_id) { people(:bottom_member).id }

      with_versioning do
        it 'new role for existing person redirects to people list' 

      end
    end

  end

  describe 'PUT update' do

    before { role } # create it

    it 'without type displays error' 


    it 'redirects to person after update' 


    it 'terminates and creates new role if type changes' 


    it 'terminates and creates new role if type and group changes' 


    context 'multiple groups' do
      let(:group) { groups(:bottom_group_one_one) }
      let(:group2) { groups(:bottom_group_one_two) }
      let(:role) { Fabricate(Group::BottomGroup::Leader.name.to_sym, person: person, group: group) }

      it 'terminates and creates new role if group changes' 


      it 'changes primary group if role changes group' 

    end

    context 'as group_full' do
      before { sign_in(Fabricate(Group::TopGroup::Secretary.name.to_sym, group: group).person) }

      it 'terminates and creates new role if type changes' 


      it 'is not allowed if group changes' 

    end
  end

  describe 'DELETE destroy' do
    let(:notice) { "Rolle <i>Member</i> für <i>#{person}</i> in <i>TopGroup</i> wurde erfolgreich gelöscht." }


    it 'redirects to group' 


    it 'redirects to person if user can still view person' 


    it 'sets new primary group and shows warning if more than one group is remaining' 


    it 'sets new primary group and does not show warning if only one group is remaining' 


    it 'does not change primary group if one role is remaining in primary group' 


    it 'does not show warning if non primary group role is deleted' 


    describe 'persons last primary group' do

      let(:person) { Fabricate(:person) }

      it 'returns true if only one role in persons primary group' 


      it 'returns false if there is more than one role in persons primary group' 


      it 'returns false if person has no primary group' 


      it 'returns false if role does not belong to persons primary group' 

    end
  end

  describe 'GET details' do
     it 'renders template' 

  end

  describe 'GET role_types' do
    it 'renders template' 


    it 'returns 404 without role' 

  end

  describe 'handling return_url param' do
    it 'POST create redirects to people after create' 

  end

end

