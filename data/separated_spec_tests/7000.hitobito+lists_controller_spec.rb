# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

# encoding:  utf-8

require 'spec_helper'

describe Event::ListsController, type: :controller do

  render_views

  before { sign_in(people(:top_leader)) }

  let(:dom) { Capybara::Node::Simple.new(response.body) }

  let(:dropdown) { dom.find('.nav .dropdown-menu') }
  let(:year) { Date.today.year }
  let(:top_layer) { groups(:top_layer) }
  let(:top_group) { groups(:top_group) }

  context 'GET events' do
    let(:tomorrow) { 1.day.from_now }
    let(:table) { dom.find('table') }
    let(:description) { 'Impedit rem occaecati quibusdam. Ad voluptatem dolorum hic. Non ad aut repudiandae. ' }
    let(:event) { Fabricate(:event, groups: [top_group], description: description) }
    before  { event.dates.create(start_at: tomorrow) }

    it 'renders title, grouper and selected tab' 


    it 'renders event label with link' 


    context 'application' do
      let(:link) { dom.all('table a').last }
      it 'contains apply button for future events' 

    end
  end

  context 'GET courses' do

    context 'filter dropdown' do
      before { get :courses }
      let(:items) { dropdown.all('a') }
      let(:first) { items.first }
      let(:middle) { items[1] }
      let(:last) { items.last }

      it 'contains links that filter event data' 

    end

    context 'yearwise paging' do
      before { get :courses }
      let(:tabs) { dom.find('#content .pagination') }

      it 'tabs contain year based pagination' 

    end

    context 'courses content' do
      let(:slk) { event_kinds(:slk) }
      let(:main) { dom.find('#main') }
      let(:slk_ev) { Fabricate(:course, groups: [groups(:top_layer)], kind: event_kinds(:slk), maximum_participants: 20, state: 'Geplant') }
      let(:glk_ev) { Fabricate(:course, groups: [groups(:top_group)], kind: event_kinds(:glk), maximum_participants: 20) }

      before do
        set_start_dates(slk_ev, '2009-01-2', '2010-01-2', '2010-01-02', '2011-01-02')
        set_start_dates(glk_ev, '2009-01-2', '2011-01-02')
      end

      it 'renders course info within table' 


      it 'does not show details for users who cannot manage course' 


      it 'groups courses by course type' 


      it 'filters with group param' 


      it 'filters by year, keeps year in dropdown' 


    end

  end
end

