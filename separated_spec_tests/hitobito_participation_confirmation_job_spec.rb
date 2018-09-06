# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Event::ParticipationConfirmationJob do

  let(:course) { Fabricate(:course, groups: [groups(:top_layer)], priorization: true) }

  let(:participation) do
    Fabricate(:event_participation,
              event: course,
              person: participant,
              application: Fabricate(:event_application,
                                     priority_2: Fabricate(:course, kind: course.kind)))
  end

  let(:person)  { Fabricate(:person, email: 'anybody@example.com') }
  let(:app1)    { Fabricate(:person, email: 'approver1@example.com') }
  let(:app2)    { Fabricate(:person, email: 'approver2@example.com') }

  before do
    SeedFu.quiet = true
    SeedFu.seed [Rails.root.join('db', 'seeds')]

    # create one person with two approvers
    Fabricate(Group::BottomLayer::Leader.name.to_sym, person: app1, group: groups(:bottom_layer_one))
    Fabricate(Group::BottomLayer::Leader.name.to_sym, person: app2, group: groups(:bottom_layer_one))
    Fabricate(Group::BottomGroup::Leader.name.to_sym, person: person, group: groups(:bottom_group_one_one))
  end

  subject { Event::ParticipationConfirmationJob.new(participation) }


  context 'without approvers' do
    let(:participant) { people(:top_leader) }

    context 'without requiring approval' do
      it 'sends confirmation email' 

    end

    context 'with event requiring approval' do
      it 'sends confirmation email' 

    end
  end

  context 'with approvers' do
    let(:participant) { person }

    context 'without requiring approval' do
      it 'does not send approval if not required' 

    end

    context 'with event requiring approval' do
      it 'sends confirmation and approvals to approvers' 


      context 'with external role in different group with own approvers' do
        it 'only sends to group approvers where role is non-external' 

      end
    end
  end

end

