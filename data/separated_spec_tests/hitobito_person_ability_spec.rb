# encoding: utf-8

#  Copyright (c) 2012-2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe PersonAbility do

  subject { ability }
  let(:ability) { Ability.new(role.person.reload) }

  context :layer_and_below_full do
    let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }

    it 'may modify any public role in lower layers' 


    it 'may not update root email if in same group' 


    it 'may modify its role' 


    it 'may modify its password' 


    it 'may not destroy its role' 


    it 'may modify externals in the same layer' 


    it 'may not view any non-visible in lower layers' 


    it 'may not view any externals in lower layers' 


    it 'may index groups in lower layer' 


    it 'may index groups in same layer' 


    it 'may show notes and tags in same layer' 


    it 'may show notes and tags in lower layer' 

  end


  describe 'layer_and_below_full in bottom layer' do
    let(:role) { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)) }

    it 'may create other users' 


    it 'may modify its role' 


    it 'may not destroy its role' 


    it 'may modify any public role in same layer' 


    it 'may not view any public role in upper layer' 


    it 'may not update email for person with role in upper layer' 


    it 'may not view any public role in other layer' 


    it 'may not update email for person with role in other layer' 


    it 'may update email for person with role in other layer if layer_and_below_full there' 


    it 'may update email for person with role in other group if group_full there' 


    it 'may update email for person with uncapable role in upper layer' 


    it 'may update email for person with uncapable role in other layer' 


    it 'may update email for uncapable person with uncapable role in other layer' 


    it 'may not update email for uncapable person with role in other layer' 


    it 'may modify externals in his layer' 


    it 'may modify children in his layer' 


    it 'may not view any externals in upper layers' 


    it 'may index groups in upper layer' 


    it 'may index groups in same layer' 


    it 'may show notes and tags in same layer' 


    it 'may not show notes and tags in lower layer' 

  end


  context :layer_and_below_read do
    # member with additional group_full role
    let(:role)       { Fabricate(Group::TopGroup::Secretary.name.to_sym, group: groups(:top_group)) }

    it 'may view details of himself' 


    it 'may modify himself' 


    it 'may modify its read role' 


    it 'may not destroy its role' 


    it 'may create other users as group admin' 


    it 'may view any public role in same layer' 


    it 'may not modify any role in same layer' 


    it 'may view any externals in same layer' 


    it 'may modify any role in same group' 


    it 'may view any public role in groups below' 


    it 'may not modify any public role in groups below' 


    it 'may not view any externals in groups below' 


    it 'may index groups in lower layer' 


    it 'may index groups in same layer' 


    it 'may not show notes and tags in same layer' 


    it 'may not show notes in lower layer' 

  end


  context :layer_full do
    let(:role) { Fabricate(Group::TopGroup::LocalGuide.name.to_sym, group: groups(:top_group)) }

    it 'may not modify any public role in lower layers' 


    it 'may not update root email if in same group' 


    it 'may modify its role' 


    it 'may modify its password' 


    it 'may not destroy its role' 


    it 'may modify externals in the same layer' 


    it 'may not view any non-visible in lower layers' 


    it 'may not view any non-contact data in lower layers' 


    it 'may not view any externals in lower layers' 


    it 'may not index groups in lower layer' 


    it 'may index groups in same layer' 


    it 'may show notes and tags in same layer' 


    it 'may not show notes and tags in lower layer' 

  end


  describe 'layer_full in bottom layer' do
    let(:role) { Fabricate(Group::BottomLayer::LocalGuide.name.to_sym, group: groups(:bottom_layer_one)) }

    it 'may create other users' 


    it 'may modify its role' 


    it 'may not destroy its role' 


    it 'may modify any public role in same layer' 


    it 'may not view any public role in upper layer' 


    it 'may not update email for person with role in upper layer' 


    it 'may not view any public role in other layer' 


    it 'may not view any private role in other layer' 


    it 'may not update email for person with role in other layer' 


    it 'may update email for person with role in other layer if layer_full there' 


    it 'may update email for person with role in other group if group_full there' 


    it 'may update email for person with uncapable role in upper layer' 


    it 'may update email for person with uncapable role in other layer' 


    it 'may update email for uncapable person with uncapable role in other layer' 


    it 'may not update email for uncapable person with role in other layer' 


    it 'may modify externals in his layer' 


    it 'may modify children in his layer' 


    it 'may not view any externals in upper layers' 


    it 'may index groups in upper layer' 


    it 'may index groups in same layer' 


    it 'may show notes and tags in same layer' 


    it 'may not show notes and tags in lower layer' 

  end


  context :layer_read do
    let(:role) { Fabricate(Group::TopGroup::LocalSecretary.name.to_sym, group: groups(:top_group)) }

    it 'may view details of himself' 


    it 'may modify himself' 


    it 'may modify its read role' 


    it 'may not destroy its role' 


    it 'may create other users as group admin' 


    it 'may view any public role in same layer' 


    it 'may not modify any role in same layer' 


    it 'may view any externals in same layer' 


    it 'may not modify any role in same group' 


    it 'may not view any public role in groups below' 


    it 'may not modify any public role in groups below' 


    it 'may not view any externals in groups below' 


    it 'may index groups in lower layer' 


    it 'may index people same layer' 


    it 'may index people in groups in same layer' 


    it 'may not show notes and tags in same layer' 


    it 'may not show notes and tags in lower layer' 

  end


  context :contact_data do
    let(:role) { Fabricate(Group::TopGroup::Member.name.to_sym, group: groups(:top_group)) }

    it 'may view details of himself' 


    it 'may modify himself' 


    it 'may not modify his role' 


    it 'may not create other users' 


    it 'may view others in same group' 


    it 'may view details of others in same group' 

    it 'may not view full of others in same group' 


    it 'may not modify others in same group' 


    it 'may show any public role in same layer' 


    it 'may not view details of public role in same layer' 


    it 'may not modify any role in same layer' 


    it 'may not view externals in other group of same layer' 


    it 'may view any public role in groups below' 


    it 'may not modify any public role in groups below' 


    it 'may not view any externals in groups below' 


    it 'may index own group' 


    it 'may index groups anywhere' 


  end


  context :group_and_below_full do
    let(:role) { Fabricate(Group::TopLayer::TopAdmin.name.to_sym, group: groups(:top_layer)) }

    it 'may view details of himself' 


    it 'may update himself' 


    it 'may update her email with password' 


    it 'may update his role' 


    it 'may create other users' 


    it 'may view and update others in same group' 


    it 'may update email for person in below group' 


    it 'may not view and update email for person in below layer' 


    it 'may not update email for person in same group and in below layer' 


    it 'may update email for person in below group if group_and_below_full everywhere' 


    it 'may not update root email if in same group' 


    it 'may view and update externals in below group' 


    it 'may view details of others in below group' 


    it 'may view full of others in below group' 


    it 'may index same group' 


    it 'may index below group' 


    it 'may not index groups in below layer' 

  end

  context :group_and_below_read do
    let(:role) { Fabricate(Group::TopGroup::Member.name.to_sym, group: groups(:top_group)) }

    it 'may view details of himself' 


    it 'may update himself' 


    it 'may not update his role' 


    it 'may not create other users' 


    it 'may view others in same group' 


    it 'may view others in below group' 


    it 'may not view others in same layer' 


    it 'may view externals in same group' 


    it 'may view externals in below group' 


    it 'may view details of others in same group' 


    it 'may view details of others in below group' 


    it 'may not view full of others in same group' 


    it 'may not view full of others in same group' 


    it 'may index same group' 


    it 'may index below group' 


    it 'may not index groups in same layer' 

  end

  context :group_full do
    let(:role) { Fabricate(Group::BottomGroup::Leader.name.to_sym, group: groups(:bottom_group_one_one)) }

    it 'may view details of himself' 


    it 'may update himself' 


    it 'may update her email with password' 


    it 'may update his role' 


    it 'may create other users' 


    it 'may view and update others in same group' 


    it 'may not update email for person in other group' 


    it 'may update email for person in other group if group_full everywhere' 


    it 'may update email for person with uncapable role in other group' 


    it 'may update email for uncapable person with uncapable role in other group' 


    it 'may not update email for uncapable person with role in other group' 


    it 'may not update root email if in same group' 


    it 'may view and update externals in same group' 


    it 'may view details of others in same group' 


    it 'may view full of others in same group' 


    it 'may not view public role in same layer' 


    it 'may index same group' 


    it 'may not index groups in same layer' 

  end

  context :group_read do
    let(:role) { Fabricate(Group::BottomGroup::Member.name.to_sym, group: groups(:bottom_group_one_one)) }

    it 'may view details of himself' 


    it 'may update himself' 


    it 'may not update his role' 


    it 'may not create other users' 


    it 'may view others in same group' 


    it 'may view externals in same group' 


    it 'may view details of others in same group' 


    it 'may not view full of others in same group' 


    it 'may not view public role in same layer' 


    it 'may index same group' 


    it 'may not index groups in same layer' 

  end

  context 'finance' do
    let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }

    it 'may not index in bottom layer group' 


    it 'may index in top group' 

  end

  context 'impersonation' do
    let(:role) { people(:top_leader).roles.first }

    it 'may not impersonate user' 

  end

  describe 'no permissions' do
    let(:role) { Fabricate(Role::External.name.to_sym, group: groups(:top_group)) }

    it 'may view details of himself' 


    it 'may view invoices of himself' 


    it 'may modify himself' 


    it 'may not modify his role' 


    it 'may not create other users' 


    it 'may not view others in same group' 


    it 'may not view externals in same group' 


    it 'may not view details of others in same group' 


    it 'may not view full of others in same group' 


    it 'may not view public role in same layer' 


    it 'may index same group' 


    it 'may not index groups in same layer' 

  end

  describe 'root' do
    let(:user) { people(:root) }
    let(:ability) { Ability.new(user) }


    it 'may not change her email' 

  end

  describe 'people filter' do

    context 'root layer and below full' do
      let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }

      context 'in group from same layer' do
        let(:group) { groups(:top_group) }

        it 'may create people filters' 

      end

      context 'in group from lower layer' do
        let(:group) { groups(:bottom_layer_one) }

        it 'may not create people filters' 


        it 'may define new people filters' 

      end
    end

    context 'bottom layer and below full' do
      let(:role) { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)) }

      context 'in group from same layer' do
        let(:group) { groups(:bottom_layer_one) }

        it 'may create people filters' 

      end

      context 'in group from upper layer' do
        let(:group) { groups(:top_layer) }

        it 'may not create people filters' 


        it 'may define new people filters' 

      end
    end

    context 'layer and below read' do
      let(:role) { Fabricate(Group::TopGroup::Secretary.name.to_sym, group: groups(:top_group)) }

      context 'in group from same layer' do
        let(:group) { groups(:top_group) }

        it 'may not create people filters' 


        it 'may define new people filters' 

      end

      context 'in group from lower layer' do
        let(:group) { groups(:bottom_layer_one) }

        it 'may not create people filters' 


        it 'may define new people filters' 

      end
    end
  end

  context :show_details do
    let(:other) { Fabricate(Group::TopGroup::Member.name.to_sym, group: groups(:top_group)).person.reload }

    context 'layer and below full' do
      let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }
      it 'can show_details' 

    end

    context 'same group' do
      let(:role) { Fabricate(Group::TopGroup::Member.name.to_sym, group: groups(:top_group)) }
      it 'can show_details' 

    end

    context 'group below' do
      let(:role) { Fabricate(Group::BottomGroup::Leader.name.to_sym, group: groups(:bottom_group_one_one)) }
      it 'cannot show_details' 

    end
  end

  context :send_password_instructions do
    let(:other) { Fabricate(Group::TopGroup::Member.name.to_sym, group: groups(:top_group)).person.reload }

    context 'layer and below full' do
      let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }
      it 'can send_password_instructions' 


      it 'can send_password_instructions for external role' 


      it 'cannot send_password_instructions for self' 

    end

    context 'same group' do
      let(:role) { Fabricate(Group::TopGroup::Member.name.to_sym, group: groups(:top_group)) }
      it 'cannot send_password_instructions' 

    end

    context 'group below' do
      let(:role) { Fabricate(Group::BottomLayer::Member.name.to_sym, group: groups(:bottom_layer_one)) }
      it 'cannot send_password_instructions' 

    end
  end

end

