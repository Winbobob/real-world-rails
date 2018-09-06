# encoding: utf-8

#  Copyright (c) 2012-2017, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::Filter::Qualification do

  let(:user) { people(:top_leader) }
  let(:group) { groups(:top_layer) }
  let(:range) { nil }
  let(:validity) { 'all' }
  let(:match) { 'one' }
  let(:qualification_kind_ids) { [] }

  let(:list_filter) do
    Person::Filter::List.new(
      group,
      user,
      range: range,
      filters: { qualification: filters.merge(additional_filter_params) }
    )
  end

  let(:filters) do
    {
      qualification_kind_ids: qualification_kind_ids,
      validity: validity,
      match: match,
    }
  end
  let(:additional_filters) { {} }

  let(:entries) { list_filter.entries }

  let(:bl_leader) { create_person(Group::BottomLayer::Leader, :bottom_layer_one, 'reactivateable', :sl, :gl_leader) }

  def additional_filter_params
    additional_filters.invert.stringify_keys.invert
  end

  def create_person(role, group, validity, *qualification_kinds)
    person = Fabricate(role.name.to_sym, group: groups(group)).person
    qualification_kinds.each do |key|
      kind = qualification_kinds(key)
      start = case validity
              when 'active'         then Date.today
              when 'reactivateable' then Date.today - kind.validity.years - 1.year
              when Fixnum           then Date.new(validity, 1, 1)
              else Date.today - 20.years
              end
      Fabricate(:qualification, person: person, qualification_kind: kind, start_at: start)
    end
    person
  end

  def create_qualification(person, kind, year)
    Fabricate(:qualification,
              person: person,
              qualification_kind: qualification_kinds(kind),
              start_at: Date.new(year, 1, 1))
  end

  context 'initialize' do
    it 'is not year_scope if params is empty' 


    %w(start_at finish_at).product(%w(year_from year_until)).each do |pre, post|
      it "is year_scope if #{pre}_#{post} is present" 


      it "is not year_scope if #{pre}_#{post} is present but blank" 

    end
  end

  context 'filtering' do

    before do
      @tg_member = create_person(Group::TopGroup::Member, :top_group, 'active', :sl)
      # duplicate qualification
      Fabricate(:qualification, person: @tg_member, qualification_kind: qualification_kinds(:sl), start_at: Date.today - 2.weeks)

      @tg_extern = create_person(Role::External, :top_group, 'active', :sl)

      @bl_leader = bl_leader
      @bl_extern = create_person(Role::External, :bottom_layer_one, 'reactivateable', :gl_leader)

      @bg_leader = create_person(Group::BottomGroup::Leader, :bottom_group_one_one, 'all', :sl, :ql)
      @bg_member = create_person(Group::BottomGroup::Member, :bottom_group_one_one, 'active', :sl)
    end


    context 'no filter' do
      it 'loads only entries on group' 


      it 'count is 0' 

    end

    context 'kind deep' do
      let(:range) { 'deep' }

      context 'no qualification kinds' do
        it 'loads people in subtree' 

      end

      context 'with qualification kinds' do
        let(:qualification_kind_ids) { qualification_kinds(:sl, :gl_leader).collect(&:id) }

        it 'loads all entries in layer and below' 


        it 'contains only visible people' 


        context 'with years' do
          let(:qualification_kind_ids) { [qualification_kinds(:sl_leader).id] }

          before do
            @sl_2013 = create_person(Group::TopGroup::Member, :top_group, 2013, :sl_leader)
            @sl_2014 = create_person(Group::TopGroup::Member, :top_group, 2014, :sl_leader)
            @sl_2015 = create_person(Group::TopGroup::Member, :top_group, 2015, :sl_leader)
            @sl_2016 = create_person(Group::TopGroup::Member, :top_group, 2016, :sl_leader)
          end

          context 'loads entry with start_at later' do
            let(:additional_filters) do
              {
                start_at_year_from: 2015
              }
            end
            it 'correctly' 


          end

          context 'loads entry with start_at before' do
            let(:additional_filters) do
              {
                start_at_year_until: '2015'
              }
            end
            it 'correctly' 


            it 'only considers newest qualification for query' 

          end

          context 'loads entry with start_at between' do
            let(:additional_filters) do
              {
                start_at_year_from: 2014,
                start_at_year_until: 2015
              }
            end
            it 'correctly' 

          end

          context 'loads entry with finish_at later' do
            let(:additional_filters) do
              {
                finish_at_year_from: 2016
              }
            end
            it 'correctly' 

          end

          context 'loads entry with finish_at before' do
            let(:additional_filters) do
              {
                finish_at_year_until: 2016
              }
            end
            it 'correctly' 

          end

          context 'loads entry with finish_at between' do
            let(:additional_filters) do
              {
                finish_at_year_from: 2016,
                finish_at_year_until: 2017
              }
            end
            it 'correctly' 

          end

          context 'only active' do

            context 'loads entry with finish_at before' do
              let(:additional_filters) do
                {
                  validity: 'active',
                  finish_at_year_until: 2016
                }
              end
              it 'correctly' 

            end

          end
        end

        context 'as bottom leader' do
          let(:user) { bl_leader }

          it 'loads all accessible entries' 


          it 'contains only visible people' 


          context 'combined with role filter' do
            let(:list_filter) do
              Person::Filter::List.new(group,
                                       user,
                                       range: range,
                                       filters: {
                                         role: {
                                           role_types: [
                                             Group::TopGroup::Member.sti_name,
                                             Group::BottomLayer::Leader.sti_name,
                                             Group::BottomGroup::Leader.sti_name
                                           ]
                                         },
                                         qualification: {
                                           qualification_kind_ids: qualification_kind_ids,
                                           validity: validity
                                         }
                                       })
            end

            it 'loads all accessible entries' 


            it 'contains only visible people' 


          end
        end
      end

    end

    context 'kind layer' do
      let(:range) { 'layer' }

      context 'with qualification kinds' do
        let(:qualification_kind_ids) { qualification_kinds(:sl, :gl_leader).collect(&:id) }

        it 'loads all entries in layer' 


        it 'contains all people' 

      end
    end

    context 'in bottom layer' do
      let(:user) { bl_leader }
      let(:range) { 'layer' }
      let(:group) { groups(:bottom_layer_one) }
      let(:qualification_kind_ids) { qualification_kinds(:sl, :gl_leader).collect(&:id) }

      context 'active validities' do

        let(:validity) { 'active' }

        it 'loads matched entries' 


        it 'contains all people' 


        context 'with infinite qualifications' do
          let(:qualification_kind_ids) { qualification_kinds(:sl, :ql).collect(&:id) }

          it 'contains them' 

        end

        context 'match all' do
          let(:match) { 'all' }
          let(:qualification_kind_ids) { qualification_kinds(:sl, :ql).collect(&:id) }

          it 'contains only people with all qualifications' 


          it 'contains people with additional qualifications' 


          context 'loads entry with start_at between' do
            let(:start_at) { Date.today - 2.years }
            let(:additional_filters) do
              {
                start_at_year_from: start_at.year,
                start_at_year_until: start_at.year
              }
            end

            it 'correctly' 

          end

          context 'does not contain entries outside start_at between' do
            let(:start_at) { Date.today - 2.years }
            let(:additional_filters) do
              {
                start_at_year_from: start_at.year - 2,
                start_at_year_until: start_at.year - 1
              }
            end

            it 'correctly' 

          end

          it 'does not contain people with all, but expired qualifications' 


        end

        context 'as top leader' do
          let(:user) { people(:top_leader) }

          it 'does not load non-visible entries' 


          it 'contains only visible people' 

        end
      end

      context 'reactivateable validities' do
        let(:validity) { 'reactivateable' }

        it 'loads matched entries' 


        it 'contains all people' 


        context 'with infinite qualifications' do
          let(:qualification_kind_ids) { qualification_kinds(:sl, :ql).collect(&:id) }
          it 'contains them' 

        end

        context 'match all' do
          let(:match) { 'all' }

          before { qualification_kinds(:sl).update!(reactivateable: 2) }

          it 'loads matched entries' 


          it 'loads matched entries with multiple, old qualifications just once' 


          it 'does not contain people with all, but expired qualifications' 

        end
      end

      context 'all validities' do
        let(:validity) { 'all' }

        it 'loads matched entries' 


        it 'contains all people' 


        context 'match all' do
          let(:match) { 'all' }

          it 'loads matched entries with multiple, old qualifications just once' 

        end
      end
    end

    it 'does not fail if sorting by role and person has only group_read' 


    it 'does not fail if sorting by role and person has layer_and_below_full' 


  end
end

