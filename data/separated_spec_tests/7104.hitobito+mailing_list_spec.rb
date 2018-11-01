# encoding: utf-8

#  Copyright (c) 2012-2015, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::AddRequest::Creator::MailingList do

  let(:primary_layer) { person.primary_group.layer_group }
  let(:person) { Fabricate(Group::BottomLayer::Member.name, group: groups(:bottom_layer_two)).person }
  let(:requester) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_one)).person }

  let(:mailing_list) { Fabricate(:mailing_list, group: groups(:bottom_layer_one)) }
  let(:entity) { mailing_list.subscriptions.new(subscriber: person) }

  let(:ability) { Ability.new(requester) }

  subject { Person::AddRequest::Creator::MailingList.new(entity, ability) }

  before { primary_layer.update_column(:require_person_add_requests, true) }

  context '#required' do

    it 'is true if primary layer activated requests' 


    it 'is true if deleted role already exists' 


    it 'is true if person is already excluded from list' 


    it 'is false if primary layer deactivated requests' 


    it 'is false if person has no primary group' 


    it 'is false if requester can already show the person' 


    it 'is false if person already subscribed to list' 


    it 'is false if person is supposed to be excluded from list' 


    it 'is false if group is added' 

  end

  context '#create_request' do

    it 'creates event request' 


    it 'schedules emails' 


    it 'does not persist if request already exists' 

  end

end

