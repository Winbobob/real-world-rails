# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Event::ListsController do
  render_views
  before { sign_in(person) }
  let(:person) { people(:bottom_member) }


  context 'GET #events' do
    it 'populates events in group_hierarchy, order by start_at' 


    it 'does not include courses' 


    it 'groups by month' 

  end

  context 'GET #courses' do
    context 'filters by year' do
      let(:year) { Date.today.year }
      let(:year_range) { (year - 2..year + 1) }

      it 'defaults to current year' 


      it 'reads year from params, populates vars'do
        get :courses, year: 2010
        expect(assigns(:year)).to eq 2010
        expect(controller.send(:year_range)).to eq 2008..2011
      end

      it 'groups by course kind' 

    end

    context 'filter per group' do
      before { sign_in(people(:top_leader)) }

      it 'defaults to layer of primary group' 


      it 'can be set via param, only if year is present' 

    end

    context 'finds course offerer' do
      it 'via primary group' 


      it 'via hierarchy' 

    end

    context 'exports to csv' do
      let(:rows) { response.body.split("\n") }
      let(:course) { Fabricate(:course) }
      before { Fabricate(:event_date, event: course)  }

      it 'renders csv headers' 

    end

    context 'without kind_id' do
      before { Event::Course.used_attributes -= [:kind_id] }

      it 'groups by month' 


      after { Event::Course.used_attributes += [:kind_id] }
    end

    context 'booking info' do
      before do
        course = Fabricate(:course, display_booking_info: false)
        Fabricate(:event_date, event: course, start_at: Date.new(2012, 1, 23))
      end

      it 'is visible for manager' 


      it 'is only visible for member where allowed by course' 


    end

  end

  def create_event(group, hash = {})
    hash = { start_at: 4.days.ago, finish_at: 1.day.from_now, type: :event }.merge(hash)
    event = Fabricate(hash[:type], groups: [groups(group)])
    event.dates.create(start_at: hash[:start_at], finish_at: hash[:finish_at])
    event
  end

end

