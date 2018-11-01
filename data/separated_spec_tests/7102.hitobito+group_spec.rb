# encoding: utf-8

#  Copyright (c) 2012-2017, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::AddRequest::Creator::Group do

  let(:primary_layer) { person.primary_group.layer_group }
  let(:person) { Fabricate(Group::BottomLayer::Member.name, group: groups(:bottom_layer_two), created_at: 1.year.ago).person }
  let(:requester) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_one)).person }

  let(:group) { groups(:bottom_group_one_one) }
  let(:entity) { Fabricate.build(Group::BottomGroup::Member.name, group: group, person: person) }

  let(:ability) { Ability.new(requester) }

  subject { Person::AddRequest::Creator::Group.new(entity, ability) }

  before { primary_layer.update_column(:require_person_add_requests, true) }

  context '#required' do

    it 'is true if primary layer activated requests' 


    it 'is true if deleted role already exists' 


    it 'is true if last layer activated requests' 


    it 'is false if primary layer deactivated requests' 


    it 'is false if last layer activated requests' 


    it 'is false if person is not persisted yet' 


    it 'is false if role is invalid' 


    it 'is false if person has no primary group' 


    it 'is false if requester can already show the person' 


  end

  context '#create_request' do

    it 'creates group request' 


    it 'creates group request if deleted role already exists' 


    it 'schedules emails' 


    it 'does not persist if request already exists' 

  end

end

