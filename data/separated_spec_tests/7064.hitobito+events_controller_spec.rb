# encoding: utf-8

#  Copyright (c) 2012-2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe EventsController do

  let(:group) { groups(:top_group) }
  let(:group2) { Fabricate(Group::TopGroup.name.to_sym, name: 'CCC', parent: groups(:top_layer)) }
  let(:group3) { Fabricate(Group::TopGroup.name.to_sym, name: 'AAA', parent: groups(:top_layer)) }

  context 'event_course' do

    before { group2 }

    context 'GET index' do
      let(:group) { groups(:top_layer) }
      let(:top_leader) { people(:top_leader) }


      before do
        sign_in(top_leader)
        @g1 = Fabricate(Group::TopGroup.name.to_sym, name: 'g1', parent: groups(:top_group))
        Fabricate(:event, groups: [@g1])
        Fabricate(:event, groups: [groups(:bottom_group_one_one)])
      end

      it 'lists events of descendant groups by default' 


      it 'limits list to events of all non layer descendants' 


      it 'orders according to sort expression' 


      it 'sets cookie on export' 

    end

    context 'GET show' do

      it 'sets empty @user_participation' 


      it 'sets  @user_participation' 


    end

    context 'GET new' do
      it 'loads sister groups' 


      it 'does not load deleted kinds' 


      it 'duplicates other course' 


      it 'raises not found if event is in other group' 

    end

    context 'POST create' do
      let(:date)  { { label: 'foo', start_at_date: Date.today, finish_at_date: Date.today } }
      let(:question)  { { question: 'foo?', choices: '1,2,3,4' } }

      it 'creates new event course with dates' 


      it "does not create event course if the user hasn't permission" 

    end

    context 'PUT update' do
      let(:group) { groups(:top_layer) }
      let(:event) { events(:top_event) }

      before { sign_in(people(:top_leader)) }

      it 'creates, updates and destroys dates' 


      it 'creates, updates and destroys questions' 

    end

  end

  context 'destroyed associations' do
    let(:course) { Fabricate(:course, groups: [group, group2, group3]) }

    before do
      course
      sign_in(people(:top_leader))
    end

    context 'kind' do
      before { course.kind.destroy }

      it 'new does not include delted kind' 


      it 'edit does include deleted kind' 


    end

    context 'groups' do
      before { group3.destroy }

      it 'new does not include delete' 


      it 'edit does include delete' 

    end
  end

  context 'contact attributes' do

    let(:event) { events(:top_event) }
    let(:group) { groups(:top_layer) }

    before { sign_in(people(:top_leader)) }

    it 'assigns required and hidden contact attributes' 


    it 'removes contact attributes' 

  end


end

