# encoding: utf-8

#  Copyright (c) 2012-2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::Filter::Role do

  let(:user) { people(:top_leader) }
  let(:group) { groups(:top_group) }

  context 'initialize' do

    it 'ignores unknown role types' 


    it 'ignores unknown role ids' 


    it 'is considered blank if no role_type_ids are set' 


    %w(active deleted).each do |kind|
      it "is not considered blank if kind #{kind} but no role_type_ids are set" 

    end
  end

  context 'filtering' do
    let(:list_filter) do
      Person::Filter::List.new(group,
                               user,
                               range: range,
                               filters: {
                                 role: {role_type_ids: role_type_ids_string }
                               })
    end

    let(:entries) { list_filter.entries }
    let(:range) { nil }
    let(:role_types) { [] }
    let(:role_type_ids_string) { role_types.collect(&:id).join(Person::Filter::Role::ID_URL_SEPARATOR) }


    before do
      @tg_member = Fabricate(Group::TopGroup::Member.name.to_sym, group: groups(:top_group)).person
      Fabricate(:phone_number, contactable: @tg_member, number: '123', label: 'Privat', public: true)
      Fabricate(:phone_number, contactable: @tg_member, number: '456', label: 'Mobile', public: false)
      Fabricate(:social_account, contactable: @tg_member, name: 'facefoo', label: 'Facebook', public: true)
      Fabricate(:social_account, contactable: @tg_member, name: 'skypefoo', label: 'Skype', public: false)
      # duplicate role
      Fabricate(Group::TopGroup::Member.name.to_sym, group: groups(:top_group), person: @tg_member)
      @tg_extern = Fabricate(Role::External.name.to_sym, group: groups(:top_group)).person

      @bl_leader = Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)).person
      @bl_extern = Fabricate(Role::External.name.to_sym, group: groups(:bottom_layer_one)).person

      @bg_leader = Fabricate(Group::BottomGroup::Leader.name.to_sym, group: groups(:bottom_group_one_one)).person
      @bg_member = Fabricate(Group::BottomGroup::Member.name.to_sym, group: groups(:bottom_group_one_one)).person
    end

    context 'group' do
      it 'loads all members of a group' 


      it 'contains all existing members' 


      context 'with external types' do
        let(:role_types) { [Role::External] }
        it 'loads externs of a group' 


        it 'contains all existing externals' 

      end

      context 'with specific types' do
        let(:role_types) { [Role::External, Group::TopGroup::Member] }
        it 'loads selected roles of a group' 


        it 'contains all existing people' 

      end
    end

    context 'layer' do
      let(:group) { groups(:bottom_layer_one) }
      let(:range) { 'layer' }

      context 'with layer and below full' do
        let(:user) { @bl_leader }

        it 'loads people in layer when no types given' 


        context 'with specific types' do
          let(:role_types) { [Group::BottomGroup::Member, Role::External] }

          it 'loads selected roles of a group when types given' 

        end
      end

    end

    context 'deep' do
      let(:group) { groups(:top_layer) }
      let(:range) { 'deep' }

      it 'loads people in subtree when no types are given' 


      context 'with specific types' do
        let(:role_types) { [Group::BottomGroup::Leader, Role::External] }

        it 'loads selected roles of a group when types given' 


        it 'contains not all existing people' 

      end
    end
  end

  context 'filering specific timeframe' do
    include ActiveSupport::Testing::TimeHelpers

    let(:person)      { people(:top_leader) }
    let(:now)         { Time.zone.parse('2017-02-01 10:00:00') }

    around(:each) { |example| travel_to(now) { example.run } }

    def transform(attrs)
      attrs.slice(:start_at, :finish_at).transform_values do |value|
        value.to_date.to_s
      end
    end

    context :time_range do
      def time_range(attrs = {})
        Person::Filter::Role.new(:role, transform(attrs)).time_range
      end

      it 'sets min to beginning_of_time if missing' 


      it 'sets max to Date.today#end_of_day if missing' 


      it 'sets min to start_at#beginning_of_day' 


      it 'sets max to finish_at#end_of_day' 


      it 'accepts start_at and finish_at on same day' 


      it 'min and max are nil if range is invalid' 

    end

    context :filter do
      def filter(attrs)
        kind = attrs[:kind] || described_class.to_s
        role_type_ids = Array(role_type).collect(&:id)
        filters = { role: transform(attrs).merge(role_type_ids: role_type_ids, kind: kind) }
        Person::Filter::List.new(group, user, range: kind, filters: filters)
      end

      context :created do
        let(:role) { roles(:top_leader) }
        let(:role_type) { Group::TopGroup::Leader }

        it 'finds role created on same day' 


        it 'finds role created within range' 


        it 'does not find role created before start_at' 


        it 'does not find role created after finish_at' 


        it 'does not find role when invalid range is given' 


        it 'does not find deleted role' 

      end

      context :deleted do
        let(:role_type) { Group::TopGroup::Member }
        let(:role) { person.roles.create!(type: role_type.sti_name, group: group) }

        it 'finds role deleted on same day' 


        it 'finds role deleted within range' 


        it 'does not find role deleted before start_at' 


        it 'does not find role deleted after finish_at' 


        it 'does not find role deleted on same when invalid range is given' 


        it 'does not find active role' 


        it 'does not find active role if deleted role from other group matches' 

      end

      context :without_role_type do
        let(:role_type) { nil }
        let(:role) { person.roles.create!(type: Group::TopGroup::Member.sti_name, group: group) }

        context :deleted do
          it 'applies filter and does not find role deleted outside of timeframe' 


          it 'applies filter and finds role deleted inside of timeframe' 

        end
      end

      context :bottom_group_one_one do
        let(:group)     { groups(:bottom_group_one_one) }
        let(:role_type) { Group::BottomGroup::Member }
        let(:role)      { Fabricate(role_type.name.to_sym, group: group) }
        let(:user)      { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)).person }

        context :deleted do
          it 'finds one deleted role but has no access' 


          it 'finds one deleted role but and has access because of another active role' 

        end
      end

      context :active do
        let(:role_type) { Group::TopGroup::Member }
        let(:role) { person.roles.create!(type: role_type.sti_name, group: group) }

        it 'does not find role deleted before timeframe' 


        it 'does not find role created after timeframe' 


        it 'finds role deleted within range' 


        it 'finds role created within range' 

      end
    end
  end
end

