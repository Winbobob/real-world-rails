# encoding: utf-8

#  Copyright (c) 2012-2015, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::AddRequestAbility do

  subject { ability }
  let(:ability) { Ability.new(role.person.reload) }

  context :layer_and_below_full do
    let(:role) { Fabricate(Group::TopGroup::Leader.name, group: groups(:top_group)) }

    it 'allowed with person in same layer' 


    it 'allowed with person in below layer' 


    it 'not allowed with non-visible person in below layer' 


    it 'allowed with person deleted in below layer' 



    context 'in below layer' do
      let(:role) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_one)) }

      it 'allowed with person in same layer' 


      it 'allowed with person deleted in same layer' 


      it 'not allowed with person in neighbour layer' 


      it 'not allowed with person in neighbour layer and deleted role in same layer' 


      it 'allowed with person in neighbour layer with contact data' 


      it 'allowed with person in neighbour layer where user has a simple role' 


      it 'not allowed with deleted person in neighbour layer where user has a simple role' 


    end
  end

  context :layer_full do

    let(:role) { Fabricate(Group::TopGroup::LocalGuide.name, group: groups(:top_group)) }

    it 'allowed with person in same layer' 


    it 'not allowed with person in below layer' 


    it 'allowed with person deleted in same layer' 

  end

  context :group_full do

    context 'with layer and below read' do
      let(:role) { Fabricate(Group::TopGroup::Secretary.name, group: groups(:top_group)) }

      it 'allowed with person in same group' 


      it 'allowed with person deleted in same group' 


      it 'not allowed with person in same layer' 


      it 'not allowed with person in below layer' 


      it 'not allowed with non-visible person in below layer' 

    end

    context 'with layer and below read' do
      let(:role) { Fabricate(Group::BottomGroup::Leader.name, group: groups(:bottom_group_one_one)) }

      it 'allowed with person in same group' 


      it 'not allowed with person in same layer' 

    end
  end

  def create_request(person)
    Person::AddRequest::Group.create!(
      person: person,
      requester: people(:bottom_member),
      body: groups(:bottom_layer_one),
      role_type: Group::BottomLayer::Member.sti_name
    )
  end

end

