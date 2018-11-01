# encoding: utf-8

#  Copyright (c) 2012-2015, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::AddRequest::Creator::Event do

  let(:primary_layer) { person.primary_group.layer_group }
  let(:person) { Fabricate(Group::BottomLayer::Member.name, group: groups(:bottom_layer_two)).person }
  let(:requester) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_one)).person }

  let(:event) { Fabricate(:event, groups: [groups(:bottom_layer_one)]) }
  let(:entity) do
    Fabricate.build(Event::Role::Participant.name,
                    participation: Fabricate.build(:event_participation, event: event, person: person))
  end

  let(:ability) { Ability.new(requester) }

  subject { Person::AddRequest::Creator::Event.new(entity, ability) }

  before { primary_layer.update_column(:require_person_add_requests, true) }

  context '#required' do

    it 'is true if primary layer activated requests' 


    it 'is true if deleted role already exists' 


    it 'is false if primary layer deactivated requests' 


    it 'is false if role is invalid' 


    it 'is false if person has no primary group' 


    it 'is false if requester can already show the person' 


    it 'is false if person already participates in event' 


  end

  context '#create_request' do

    it 'creates event request' 


    it 'creates group request if deleted role already exists' 


    it 'schedules emails' 


    it 'does not persist if request already exists' 

  end

end

