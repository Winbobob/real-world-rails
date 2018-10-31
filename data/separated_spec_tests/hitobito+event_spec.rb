# encoding: utf-8

#  Copyright (c) 2012-2015, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::AddRequest::Approver::Event do

  let(:person) { Fabricate(Group::BottomLayer::Member.name, group: groups(:bottom_layer_two)).person }
  let(:requester) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_one)).person }

  let(:user) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_two)).person }

  subject { Person::AddRequest::Approver.for(request, user) }

  context 'Event' do

    let(:group) { groups(:bottom_group_one_one) }
    let(:event) { Fabricate(:event, groups: [group]) }

    let(:request) do
      Person::AddRequest::Event.create!(
        person: person,
        requester: requester,
        body: event,
        role_type: Event::Role::Participant.sti_name)
    end

    it 'resolves correct subclass based on request' 


    context '#approve' do

      before do
        Fabricate(:event_question, event: event)
        Fabricate(:event_question, event: event)
        event.reload
      end

      # load before to get correct change counts
      before { subject }

      it 'creates a new participation and sends email' 


      it 'creates new participation and does not send email' 

    end

    context '#reject' do
      it 'sends email if email is set' 


      it 'does not send email if email is blank' 

    end
  end

  context 'Course' do
    let(:group) { groups(:bottom_layer_one) }
    let(:event) { Fabricate(:course, groups: [group]) }

    let(:request) do
      Person::AddRequest::Event.create!(
        person: person,
        requester: requester,
        body: event,
        role_type: role_type.sti_name)
    end

    before do
      Fabricate(:event_question, event: event)
      Fabricate(:event_question, event: event)
      event.reload
    end

    context 'participant' do
      let(:role_type) { Event::Course::Role::Participant }

      it 'creates a new participation' 


      it 'does nothing if role already exists' 

    end

    context 'leader' do
      let(:role_type) { Event::Role::Leader }

      it 'creates a new participation' 


      it 'creates second role if participation already exists' 


      it 'does nothing if role already exists' 

    end
  end

end

