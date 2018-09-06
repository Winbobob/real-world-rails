# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe EventAbility do

  let(:user)    { role.person }
  let(:group)   { role.group }
  let(:event)   { Fabricate(:event, groups: [group]) }

  let(:participant) { Fabricate(Group::BottomGroup::Leader.name.to_sym, group: groups(:bottom_group_one_one)).person }
  let(:participation) { Fabricate(:event_participation, person: participant, event: event, application: Fabricate(:event_application)) }


  subject { Ability.new(user.reload) }

  context :layer_and_below_full do
    let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }

    context Event do
      it 'may create event in his group' 


      it 'may create event in his layer' 


      it 'may update event in his layer' 


      it 'may index people for event in his layer' 


      it 'may update event in lower layer' 


      it 'may index people for event in lower layer' 


      it 'may list all courses' 


      it 'may export course list' 


      it 'may not list all courses if not in course layer' 


      context 'in other layer' do
        let(:role) { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)) }

        it 'may not update event' 


        it 'may not index people for event' 

      end
    end


    context Event::Participation do
      before { Fabricate(Event::Role::Participant.name.to_sym, participation: participation) }

      it 'may show participation' 


      it 'may create participation' 


      it 'may update participation' 


      it 'may destroy participation' 


      it 'may show participation in event from lower layer' 


      it 'may still create when application is not possible' 


      context 'in other layer' do
        let(:role) { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)) }

        it 'may not show participation in event' 

      end
    end

  end


  context :layer_full do
    let(:role) { Fabricate(Group::TopGroup::LocalGuide.name.to_sym, group: groups(:top_group)) }

    context Event do
      it 'may create event in his group' 


      it 'may create event in his layer' 


      it 'may update event in his layer' 


      it 'may index people for event in his layer' 


      it 'may not update event in lower layer' 


      it 'may not index people for event in lower layer' 


      it 'may list all courses' 


      it 'may not export course list' 

    end

    context Event::Participation do
      before { Fabricate(Event::Role::Participant.name.to_sym, participation: participation) }

      it 'may show participation' 


      it 'may create participation' 


      it 'may update participation' 


      it 'may destroy participation' 


      it 'may not show participation in event from lower layer' 


      it 'may show participation on waiting list with prio_1 in event from other layer' 


      it 'may still create when application is not possible' 


    end

  end

  context :group_and_below_full do
    let(:role) { Fabricate(Group::TopLayer::TopAdmin.name.to_sym, group: groups(:top_layer)) }

    context Event do
      context 'in own group' do
        it 'may create event' 


        it 'may update event' 


        it 'may destroy event' 


        it 'may index people for event' 


        it 'may not list all courses' 

      end

      context 'in below group' do
        let(:group) { groups(:top_group) }

        it 'may create event' 


        it 'may update event' 


        it 'may destroy event' 


        it 'may index people for event' 

      end

      context 'in below layer' do
        let(:group) { groups(:bottom_layer_one) }

        it 'may not update event' 


        it 'may not index people for event' 

      end
    end

    context Event::Participation do
      before { Fabricate(Event::Role::Participant.name.to_sym, participation: participation) }

      context 'in same group' do
        it 'may show participation' 


        it 'may create participation' 


        it 'may update participation' 


        it 'may destroy participation' 

      end

      context 'in below group' do
        let(:group) { groups(:top_group) }
        it 'may show participation' 


        it 'may create participation' 


        it 'may update participation' 


        it 'may destroy participation' 

      end

      context 'in below layer' do
        let(:group) { groups(:bottom_layer_one) }

        it 'may not show participation' 

      end
    end

  end

  context :group_full do
    let(:role) { Fabricate(Group::BottomGroup::Leader.name.to_sym, group: groups(:bottom_group_one_one)) }

    context Event do
      it 'may create event in his group' 


      it 'may update event in his group' 


      it 'may destroy event in his group' 


      it 'may index people for event in his layer' 


      it 'may not update event in other group' 


      it 'may not index people for event in other group' 


      it 'may not list all courses' 

    end

    context Event::Participation do
      before { Fabricate(Event::Role::Participant.name.to_sym, participation: participation) }

      it 'may show participation' 


      it 'may create participation' 


      it 'may update participation' 


      it 'may destroy participation' 


      it 'may not show participation in event from other group' 

    end

  end

  context :event_full do
    let(:group)  { groups(:bottom_layer_one) }
    let(:role)   { Fabricate(Group::BottomLayer::Member.name.to_sym, group: groups(:bottom_layer_one)) }
    let(:participation) { Fabricate(:event_participation, event: event, person: user) }
    let(:event_role) { Fabricate(Event::Role::Leader.name.to_sym, participation: participation) }

    before { event_role }

    context Event do
      it 'may not create events' 


      it 'may update his event' 


      it 'may not destroy his event' 


      it 'may index people his event' 


      it 'may not update other event' 


      it 'may not index people for other event' 


      context 'AssistantLeader' do
        before { Fabricate(Event::Role::AssistantLeader.name.to_sym, participation: participation) }

        it 'may not update event' 

      end
    end

    context Event::Participation do
      let(:other) { Fabricate(:event_participation, event: event) }
      before { Fabricate(Event::Role::Participant.name.to_sym, participation: other) }

      it 'may show participation' 


      it 'may not create participation' 


      it 'may update participation' 


      it 'may not destroy participation' 


      it 'may not show participation in other event' 


      it 'may not update participation in other event' 

    end

    context Event::Role do
      let(:other) { Fabricate(:event_participation, event: event) }
      let(:other_role) { Fabricate(Event::Role::Leader.name.to_sym, participation: other) }
      before { other_role }

      it 'may update own role' 


      it 'may update other role' 


      it 'may not destroy own leader role' 


      it 'may destroy own helper role' 


      it 'may destroy other role' 


      it 'may not update role in other event' 

    end

  end

  context :participations_read do
    let(:role)   { Fabricate(Group::BottomGroup::Leader.name.to_sym, group: groups(:bottom_group_one_one)) }
    let(:event)  { Fabricate(:event, groups: [groups(:bottom_layer_one)]) }
    let(:participation) { Fabricate(:event_participation, event: event, person: user) }

    before { Fabricate(Event::Role::Cook.name.to_sym, participation: participation) }

    context Event do
      it 'may show his event' 


      it 'may not create events' 


      it 'may not update his event' 


      it 'may not destroy his event' 


      it 'may index people for his event' 


      it 'may show other event' 


      it 'may not update other event' 


      it 'may not index people for other event' 


    end

    context Event::Participation do
      it 'may show his participation' 


      it 'may show other participation' 


      it 'may not show details of other participation' 


      it 'may not show participation in other event' 


      it 'may not update his participation' 


      it 'may not update other participation' 

    end

  end

  context 'inactive participation' do
    let(:role)   { Fabricate(Group::BottomGroup::Leader.name.to_sym, group: groups(:bottom_group_one_one)) }
    let(:event)  { Fabricate(:course, groups: [groups(:bottom_layer_one)]) }
    let(:participation) do
      Fabricate(:event_participation,
                event: event,
                person: user,
                active: false,
                application: Fabricate(:event_application))
    end

    before { Fabricate(Event::Course::Role::Participant.name.to_sym, participation: participation) }

    context Event do
      it 'may show his event' 


      it 'may not update his event' 


      it 'may not index people for his event' 


    end

    context Event::Participation do
      it 'may show his participation' 


      it 'may not show other participation' 


      it 'may not show details of other participation' 


      it 'may not show participation in other event' 


      it 'may not update his participation' 


      it 'may not update other participation' 


      it 'may destroy his participation if applications_cancelable' 


      it 'may not destroy his participation if applications cancelable and applications closed' 


      it 'may not destroy his participation if applications not cancelable' 


      it 'may not destroy other participation if applications cancelable' 

    end
  end

  context :in_same_hierarchy do
    let(:role) { Fabricate(Group::BottomLayer::Member.name.to_sym, group: groups(:bottom_layer_one)) }
    let(:participation) { Fabricate(:event_participation, person: user, event: event) }

    context Event::Participation do
      it 'may create his participation' 


      it 'may show his participation' 


      it 'may not update his participation' 

    end
  end

  context :in_other_hierarchy do
    let(:role)  { Fabricate(Group::BottomLayer::Member.name.to_sym, group: groups(:bottom_layer_two)) }
    let(:event) { Fabricate(:event, groups: [groups(:bottom_layer_one)]) }
    let(:participation) { Fabricate(:event_participation, person: user, event: event) }

    context Event::Participation do
      it 'may create his participation' 


      it 'may not create his participation if application is not possible' 


      it 'may show his participation' 


      it 'may not update his participation' 

    end

  end

  context :admin do
    let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }

    it 'may manage event kinds' 

  end

  context :approver do
    let(:event) { Fabricate(:course, groups: [groups(:top_layer)]) }
    let(:role) { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)) }

    context 'for his guides' do
      it 'may show participations' 


      it 'may show application' 


      it 'may approve participations' 

    end

    context 'for other participants' do
      let(:participant) { Fabricate(Group::BottomLayer::Member.name.to_sym, group: groups(:bottom_layer_two)).person }

      before { participation.application.priority_2 = nil }

      it 'may not show participations' 


      it 'may not show application' 


      it 'may not approve participations' 

    end
  end

  context :application_market do
    let(:course) { Fabricate(:course, groups: [groups(:top_layer)]) }

    let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }

    it 'allowed ' 


  end

  context :qualify do
    let(:course) { Fabricate(:course, groups: [groups(:top_layer)]) }

    before do
      participation = Fabricate(:event_participation, event: course, person: user)
      Fabricate(:event_role, participation: participation, type: 'Event::Role::Leader')
    end

    let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }

    it 'allowed for course' 

  end

  context 'destroyed group' do
    let(:group) { groups(:bottom_layer_two) }
    let(:role) { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: group) }
    before do
      group.children.each { |g| g.destroy }
      group.destroy
    end

    it 'cannot create new event' 

  end

end

