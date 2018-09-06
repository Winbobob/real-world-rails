# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe MailingListAbility do

  let(:user) { role.person }
  let(:group) { role.group }
  let(:list) { Fabricate(:mailing_list, group: group) }

  subject { Ability.new(user.reload) }

  context 'layer and below full' do
    let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }

    context 'in own group' do
      it 'may show mailing lists' 


      it 'may update mailing lists' 


      it 'may index subscriptions' 


      it 'may create subscriptions' 


      it 'may export empty subscriptions' 


      it 'may export subscriptions with role types from lower groups' 

    end

    context 'in group in same layer' do
      let(:group) { groups(:top_layer) }

      it 'may show mailing lists' 


      it 'may update mailing lists' 


      it 'may index subscriptions' 


      it 'may create subscriptions' 


      it 'may export empty subscriptions' 


      it 'may export subscriptions with role types from lower layers' 


      it 'may export subscriptions with events from lower layers' 

    end

    context 'in global group in same layer' do
      let(:group) { groups(:toppers) }

      it 'may export subscriptions with role types from local layers' 

    end

    context 'in group in lower layer' do
      let(:group) { groups(:bottom_layer_one) }

      it 'may show mailing lists' 


      it 'may not update mailing lists' 


      it 'may not index subscriptions' 


      it 'may not export subscriptions' 


      it 'may not create subscriptions' 

    end

    context 'in group in upper layer' do
      let(:role) { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)) }
      let(:group) { groups(:top_layer) }

      it 'may show mailing lists' 


      it 'may not update mailing lists' 


      it 'may not index subscriptions' 


      it 'may not export subscriptions' 


      it 'may not create subscriptions' 

    end
  end

  context 'layer full' do
    let(:role) { Fabricate(Group::BottomLayer::LocalGuide.name.to_sym, group: groups(:bottom_layer_one)) }

    context 'in own group' do
      it 'may show mailing lists' 


      it 'may update mailing lists' 


      it 'may index subscriptions' 


      it 'may create subscriptions' 


      it 'may export empty subscriptions' 


      it 'may export subscriptions with role types from local groups' 


      it 'may export subscriptions with role types from global groups if bottom layer' 


      it 'may export subscriptions with events from lower groups' 


      it 'may export subscriptions with events shared with neighbouring group' 


    end

    context 'in top group' do
      let(:role) { Fabricate(Group::TopGroup::LocalGuide.name.to_sym, group: groups(:top_group)) }

      it 'may export subscriptions with role types from local groups' 


      it 'may not export subscriptions with role types from below groups' 


      it 'may not export subscriptions with role types from global groups' 


      context 'in top layer' do
        let(:group) { groups(:top_layer) }

        it 'may not export subscriptions with events from lower layers' 

      end
    end

    context 'in global group in same layer' do
      let(:group) { Fabricate(Group::GlobalGroup.name, parent: groups(:bottom_layer_one)) }

      it 'may export subscriptions with role types from local layers' 

    end

  end

  context 'group and below full' do
    let(:role) { Fabricate(Group::TopLayer::TopAdmin.name.to_sym, group: groups(:top_layer)) }

    context 'in own group' do
      it 'may show mailing lists' 


      it 'may update mailing lists' 


      it 'may index subscriptions' 


      it 'may create subscriptions' 


      it 'may export empty subscriptions' 


      it 'may export subscriptions with role types from local groups' 


      it 'may export subscriptions with role types from global groups' 


      it 'may not export subscriptions with role types from lower layers' 


      it 'may export subscriptions with events from lower groups' 


      it 'may not export subscriptions with events from lower layer' 

    end

    context 'in group in same layer' do
      let(:group) { groups(:top_group) }

      it 'may show mailing lists' 


      it 'may update mailing lists' 


      it 'may index subscriptions' 


      it 'may create subscriptions' 


      it 'may export empty subscriptions' 


      it 'may export subscriptions with role types from local layers' 


      it 'may export subscriptions with events' 

    end

    context 'in global group below' do
      let(:group) { groups(:toppers) }

      it 'may export subscriptions with role types from local layers' 


      it 'may export subscriptions with events' 

    end

    context 'in group in lower layer' do
      let(:group) { groups(:bottom_layer_one) }

      it 'may show mailing lists' 


      it 'may not update mailing lists' 


      it 'may not index subscriptions' 


      it 'may not export subscriptions' 


      it 'may not create subscriptions' 

    end

    context 'for destroyed group' do
      let(:group) { groups(:toppers) }

      before { list; group.destroy }

      it 'may not create mailing list' 


      it 'may not update mailing list' 


      it 'may not create subscription' 

    end
  end

  context 'group full' do
    let(:role) { Fabricate(Group::GlobalGroup::Leader.name.to_sym, group: groups(:toppers)) }

    context 'in own group' do
      it 'may show mailing lists' 


      it 'may update mailing lists' 


      it 'may index subscriptions' 


      it 'may export empty subscriptions' 


      it 'may export subscriptions with local role types' 


      it 'may not export subscriptions with lower role types' 


      it 'may export subscriptions with events' 


      it 'may export subscriptions with events shared with siblings' 


      it 'may not export subscriptions with events in lower groups' 


      it 'may create subscriptions' 

    end

    context 'in group in same layer' do
      let(:group) { groups(:top_group) }

      it 'may show mailing lists' 


      it 'may not update mailing lists' 


      it 'may not index subscriptions' 


      it 'may not create subscriptions' 

    end

    context 'in group in lower layer' do
      let(:group) { groups(:bottom_layer_one) }

      it 'may show mailing lists' 


      it 'may not update mailing lists' 


      it 'may not index subscriptions' 


      it 'may not create subscriptions' 

    end
  end

  def create_group_subscription(*role_types)
    Subscription.create!(mailing_list: list, subscriber: group, role_types: role_types)
  end

  def create_event_subscription(*groups)
    event = Fabricate(:event, groups: groups, dates: [Fabricate(:event_date, start_at: Time.zone.today)])
    Subscription.create!(mailing_list: list, subscriber: event)
  end
end

