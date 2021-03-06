# encoding: utf-8

#  Copyright (c) 2012-2015, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'


describe PersonFullReadables do

  [:index, :layer_search, :deep_search, :global].each do |action|
    context action do
      let(:action) { action }
      let(:user)   { role.person.reload }
      let(:ability) { PersonFullReadables.new(user, action == :index ? group : nil) }

      let(:all_accessibles) do
        people = Person.accessible_by(ability)
        case action
        when :index then people
        when :layer_search then people.in_layer(group.layer_group)
        when :deep_search then people.in_or_below(group.layer_group)
        when :global then people
        end
      end


      subject { all_accessibles }

      context :layer_and_below_full do
        let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }

        context 'own group' do
          let(:group) { role.group }

          it 'may read himself' 


          it 'may read people in his group' 


          it 'may read external people in his group' 

        end

        context 'lower group' do
          let(:group) { groups(:bottom_layer_one) }

          it 'may read visible people' 


          it 'may not read external people' 

        end
      end


      context :layer_and_below_read do
        let(:role) { Fabricate(Group::TopGroup::Secretary.name.to_sym, group: groups(:top_group)) }

        context 'own group' do
          let(:group) { role.group }

          it 'may read himself' 


          it 'may read people in his group' 


          it 'may read external people in his group' 

        end

        context 'group in same layer' do
          let(:group) { groups(:toppers) }

          it 'may read people' 


          it 'may read external people' 

        end

        context 'lower group' do
          let(:group) { groups(:bottom_layer_one) }

          it 'may read visible people' 


          it 'may not read external people' 

        end

        context 'bottom group' do
          let(:group) { groups(:bottom_group_one_one) }

          it 'may not read non-visible' 

        end

      end


      context :layer_full do
        let(:role) { Fabricate(Group::TopGroup::LocalGuide.name.to_sym, group: groups(:top_group)) }

        context 'own group' do
          let(:group) { role.group }

          it 'may read himself' 


          it 'may read people in his group' 


          it 'may read external people in his group' 

        end

        context 'lower group' do
          let(:group) { groups(:bottom_layer_one) }

          it 'may not read visible people' 


          it 'may not read external people' 

        end
      end


      context :layer_read do
        let(:role) { Fabricate(Group::TopGroup::LocalSecretary.name.to_sym, group: groups(:top_group)) }

        it 'has layer_read permission' 


        context 'own group' do
          let(:group) { role.group }

          it 'may read himself' 


          it 'may read people in his group' 


          it 'may read external people in his group' 

        end

        context 'group in same layer' do
          let(:group) { groups(:toppers) }

          it 'may read people' 


          it 'may read external people' 

        end

        context 'lower group' do
          let(:group) { groups(:bottom_layer_one) }

          it 'may not read visible people' 


          it 'may not read external people' 

        end

        context 'bottom group' do
          let(:group) { groups(:bottom_group_one_one) }

          it 'may not read non-visible' 

        end

      end

      context :group_and_below_full do
        let(:role) { Fabricate(Group::TopLayer::TopAdmin.name.to_sym, group: groups(:top_layer)) }

        context 'own group' do
          let(:group) { role.group }

          it 'may read himself' 


          it 'may read people in his group' 


          it 'may read external people in his group' 

        end

        context 'below group' do
          let(:group) { groups(:top_group) }

          it 'may read people' 


          it 'may read external people' 

        end

        context 'in below layer' do
          let(:group) { groups(:bottom_layer_one) }

          it 'may not read people' 


          it 'may not read external people' 

        end

      end

      context :group_full do
        let(:role) { Fabricate(Group::BottomGroup::Leader.name.to_sym, group: groups(:bottom_group_one_one)) }

        context 'own group' do
          let(:group) { role.group }

          it 'may read himself' 


          it 'may read people in his group' 


          it 'may read external people in his group' 

        end

        context 'group in same layer' do
          let(:group) { groups(:bottom_group_one_two) }

          it 'may not read people' 


          it 'may not read external people' 

        end

      end

      context :contact_data do
        let(:role) { Fabricate(Group::GlobalGroup::Leader.name.to_sym, group: groups(:toppers)) }

        context 'group in same layer' do
          let(:group) { groups(:top_group) }

          it 'may not read people with contact data' 


          it 'may not read external people' 

        end

        context 'lower group' do
          let(:group) { groups(:bottom_layer_one) }

          it 'may not read people with contact data' 


          it 'may not get people without contact data' 

        end

      end


      context :group_read do
        let(:role) { Fabricate(Group::GlobalGroup::Member.name.to_sym, group: groups(:toppers)) }

        it 'has only login permission' 


        context 'own group' do
          let(:group) { role.group }


          if action == :index
            it 'may not read himself' 

          else
            it 'may read himself' 

          end

          it 'may not read people in his group' 


          it 'may not read external people in his group' 

        end

        context 'group in same layer' do
          let(:group) { groups(:top_group) }

          it 'may not read people with contact data' 


          it 'may not read external people' 

        end

        context 'lower group' do
          let(:group) { groups(:bottom_layer_one) }

          it 'may not read people with contact data' 


          it 'may not read external people' 

        end

      end


      describe 'no permissions' do
        let(:role) { Fabricate(Role::External.name.to_sym, group: groups(:top_group)) }

        it 'has no permissions' 


        context 'own group' do
          let(:group) { role.group }

          if action == :index
            it 'may not read himself' 

          else
            it 'may read himself' 

          end

          it 'may not read people in his group' 


          it 'may not read external people in his group' 

        end

      end

      context :root do
        let(:user) { people(:root) }

        context 'every group' do
          let(:group) { groups(:top_group) }

          it 'may read all people' 


          it 'may read external people' 

        end

        if action == :global
          it 'may read herself' 


          it 'may read people outside groups' 

        end

      end

    end
  end
end

