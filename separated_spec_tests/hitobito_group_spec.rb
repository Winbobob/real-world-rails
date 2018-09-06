# encoding: utf-8

#  Copyright (c) 2012-2015, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::AddRequest::Approver::Group do

  let(:person) { Fabricate(Group::BottomLayer::Member.name, group: groups(:bottom_layer_two)).person }
  let(:requester) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_one)).person }

  let(:user) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_two)).person }

  subject { Person::AddRequest::Approver.for(request, user) }

  # TODO: test what happens if request is approved after the role/participation/subscription was created


  let(:group) { groups(:bottom_group_one_one) }

  let(:request) do
    Person::AddRequest::Group.create!(
      person: person,
      requester: requester,
      body: group,
      role_type: Group::BottomGroup::Member.sti_name)
  end

  it 'resolves correct subclass based on request' 


  context '#approve' do

    # load before to get correct change counts
    before { subject }

    it 'creates a new role' 


    it 'destroys request' 


    it 'schedules email' 


    it 'creates person log entry for role and for request', versioning: true do
      expect do
        subject.approve
      end.to change { PaperTrail::Version.count }.by(2)
    end

    it 'creates role if another one already exists' 


    it 'does nothing if role already exists' 


  end

  context 'reject' do

    # load before to get correct change counts
    before { subject }

    it 'destroys request' 


    it 'schedules email' 


    it 'creates person log entry for request', versioning: true do
      expect do
        subject.reject
      end.to change { PaperTrail::Version.count }.by(1)
    end

    context 'as requester' do

      let(:user) { requester }

      it 'does not schedule email' 


      it 'creates person log entry for request', versioning: true do
        expect do
          subject.reject
        end.to change { PaperTrail::Version.count }.by(1)
      end

    end

  end

end

