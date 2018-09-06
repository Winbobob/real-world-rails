# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Event::ApplicationMarketController do

  let(:event) { events(:top_course) }
  let(:group) { event.groups.first }

  let(:appl_prio_1) do
    p = Fabricate(:event_participation,
                  event: event,
                  active: false,
                  application: Fabricate(:event_application, priority_1: event))
    Fabricate(Event::Course::Role::Participant.name.to_sym, participation: p)
    p.reload
  end

  let(:appl_prio_2) do
    p = Fabricate(:event_participation,
                  active: false,
                  event: Fabricate(:course, kind: event.kind),
                  application: Fabricate(:event_application, priority_2: event))
    Fabricate(Event::Course::Role::Participant.name.to_sym, participation: p)
    p.reload
  end

  let(:appl_prio_3) do
    p = Fabricate(:event_participation,
                  active: false,
                  event: Fabricate(:course, kind: event.kind),
                  application: Fabricate(:event_application, priority_3: event))
    Fabricate(Event::Course::Role::Participant.name.to_sym, participation: p)
    p.reload
  end

  let(:appl_waiting) do
    p = Fabricate(:event_participation,
                  active: false,
                  application: Fabricate(:event_application, waiting_list: true),
                  event: Fabricate(:course, kind: event.kind))
    Fabricate(Event::Course::Role::Participant.name.to_sym, participation: p)
    p.reload
  end

  let(:appl_other) do
    p = Fabricate(:event_participation,
                  active: false,
                  event: Fabricate(:course, kind: event.kind),
                  application: Fabricate(:event_application))
    Fabricate(Event::Course::Role::Participant.name.to_sym, participation: p)
    p.reload
  end

  let(:appl_other_assigned) do
    participation = Fabricate(:event_participation,
                              event: Fabricate(:course, kind: event.kind),
                              active: true,
                              application: Fabricate(:event_application, priority_2: event))
    Fabricate(Event::Course::Role::Participant.name.to_sym, participation: participation)
    participation.reload
  end

  let(:appl_participant) do
    participation = Fabricate(:event_participation,
                              event: event,
                              active: true,
                              application: Fabricate(:event_application, priority_2: event))
    Fabricate(Event::Course::Role::Participant.name.to_sym, participation: participation)
    participation.reload
  end

  let(:leader) do
    participation = Fabricate(:event_participation, event: event)
    Fabricate(Event::Role::Leader.name.to_sym, participation: participation)
  end

  before do
    # init required data
    appl_prio_1
    appl_prio_2
    appl_prio_3
    appl_waiting
    appl_other
    appl_other_assigned
    appl_participant
    leader
  end

  before { sign_in(people(:top_leader)) }

  describe 'GET index' do

    context 'with standard filter' do
      before { get :index, group_id: group.id, event_id: event.id }

      context 'participants' do
        subject { assigns(:participants) }

        it 'has 1 item' 


        it 'contains participant' 


        it 'does not contain unassigned applications' 


        it 'does not contain leader' 

      end

      context 'applications' do
        subject { assigns(:applications) }

        it 'has 1 item' 


        it { is_expected.to include(appl_prio_1) }
        it { is_expected.not_to include(appl_prio_2) }
        it { is_expected.not_to include(appl_prio_3) }
        it { is_expected.not_to include(appl_waiting) }

        it { is_expected.not_to include(appl_participant) }
        it { is_expected.not_to include(appl_other) }
        it { is_expected.not_to include(appl_other_assigned) }
      end
    end

    context 'with mixed prio filter' do
      before { get :index, group_id: group.id, event_id: event.id, prio: %w(1 3) }

      subject { assigns(:applications) }

      it 'has 2 items' 


      it { is_expected.to include(appl_prio_1) }
      it { is_expected.not_to include(appl_prio_2) }
      it { is_expected.to include(appl_prio_3) }
      it { is_expected.not_to include(appl_waiting) }
    end

    context 'with prio and waiting list filter' do
      before { get :index, group_id: group.id, event_id: event.id, prio: %w(2), waiting_list: true }

      subject { assigns(:applications) }

      it 'has 2 items' 


      it { is_expected.not_to include(appl_prio_1) }
      it { is_expected.to include(appl_prio_2) }
      it { is_expected.not_to include(appl_prio_3) }
      it { is_expected.to include(appl_waiting) }
    end

    context 'with waiting list filter' do
      before { get :index, group_id: group.id, event_id: event.id, waiting_list: true }

      subject { assigns(:applications) }

      it 'has 1 item' 


      it { is_expected.not_to include(appl_prio_1) }
      it { is_expected.not_to include(appl_prio_2) }
      it { is_expected.not_to include(appl_prio_3) }
      it { is_expected.to include(appl_waiting) }
    end

    context 'for regular event' do
      let(:event) { events(:top_event) }

      # no required for this test
      let(:appl_prio_1) {}
      let(:appl_prio_2) {}
      let(:appl_prio_3) {}
      let(:appl_waiting) {}
      let(:appl_other) {}
      let(:appl_other_assigned) {}
      let(:appl_participant) {}
      let(:leader) {}

      it 'is not possible' 

    end
  end


  describe 'PUT participant' do

    it 'creates role' 


    it 'shows error on existing participant role' 


    def create_participant_role(other)
      participation = Fabricate(:event_participation,
                                event: other,
                                person: appl_prio_1.person,
                                application: Fabricate(:event_application),
                                active: true)
      role = other.participant_types.first.new
      role.participation = participation
      role.save!
    end
  end

  describe 'DELETE participant' do
    before { delete :remove_participant, group_id: group.id, event_id: event.id, id: appl_participant.id, format: :js }

    it 'deactivates participation' 

  end

  describe 'PUT waiting_list' do
    before do
      put :put_on_waiting_list,
          group_id: group.id,
          event_id: event.id,
          id: appl_prio_1.id,
          format: :js,
          event_application: { waiting_list_comment: 'foo bar' }
    end

    it 'sets waiting list flag' 

  end

  describe 'DELETE waiting_list' do
    before { delete :remove_from_waiting_list, group_id: group.id, event_id: event.id, id: appl_waiting.id, format: :js }

    it 'sets waiting list flag' 

  end

end

