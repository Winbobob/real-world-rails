# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Event::ApplicationsController do

  let(:event) { events(:top_course) }
  let(:group) { event.groups.first }
  let(:group_leader) { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)).person }
  let(:participant) { Fabricate(Group::BottomGroup::Leader.name.to_sym, group: groups(:bottom_group_one_one)).person }
  let(:participation) do
    Fabricate(:event_participation,
              event: event,
              person: participant,
              application: Fabricate(:event_application))
  end
  let(:application) do
    participation.application
  end

  context 'group leader' do
    before { sign_in(group_leader) }

    describe 'PUT approve' do
      before { put :approve, group_id: group.id, event_id: event.id, id: application.id }

      it { is_expected.to redirect_to(group_event_participation_path(group, event, participation)) }

      it 'sets flash' 


      it 'approves application' 

    end

    describe 'DELETE reject' do
      before { delete :reject, group_id: group.id, event_id: event.id, id: application.id }

      it { is_expected.to redirect_to(group_event_participation_path(group, event, participation)) }

      it 'sets flash' 


      it 'rejects application' 

    end
  end


  context 'as top leader' do
    let(:user) { people(:top_leader) }

    before { sign_in(user) }

    it 'PUT approve is not allowed' 


    it 'DELETE reject is not allowed' 

  end

end

