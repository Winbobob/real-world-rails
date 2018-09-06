# encoding: utf-8

#  Copyright (c) 2017, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Group::DeletedPeople do

  context 'find deleted people' do
    let(:group)         { groups(:top_layer) }
    let(:person)        { role.person.reload }
    let(:role) do
      Fabricate(Group::TopLayer::TopAdmin.name, group: group,
                created_at: Time.zone.now - 1.year)
    end

    let(:sibling_group)      { groups(:bottom_layer_one) }
    let(:sibling_group_one)  { groups(:bottom_group_one_one) }
    let(:sibling_person)     { sibling_role.person.reload }
    let(:sibling_role) do
      Fabricate(Group::BottomGroup::Leader.name, group: sibling_group_one,
                created_at: Time.zone.now - 1.year)
    end

    context 'when group has people without role' do
      before do
        role.destroy
      end

      it 'finds those people' 


      it 'doesn\'t find people with new role' 


      it 'finds people from other group in same layer' 

    end

    context 'when group has no people without role' do
      it 'returns empty' 

    end
  end

  context 'when roles are deleted in different series' do

    let(:group)         { groups(:top_layer) }
    let(:bottom_group)  { groups(:bottom_layer_one) }
    let(:person)        { role_top.person }
    let(:role_top) do
      Fabricate(Group::TopLayer::TopAdmin.name, group: group,
                created_at: Time.zone.now - 1.year)
    end
    let(:role_bottom) do
      Fabricate(Group::BottomLayer::Leader.name, group: bottom_group, person: person,
                created_at: Time.zone.now - 1.year)
    end

    before do
      bottom_group.update(parent_id: group.id)
    end

    it 'doesnt find when last role deleted in bottom group' 


    it 'find if last deleted role in top group' 


    it 'finds people in child group' 


    it 'doesnt find when not visible from above' 


    it 'finds multiple people' 


  end
end


