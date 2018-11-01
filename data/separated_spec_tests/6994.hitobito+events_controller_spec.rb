# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe EventsController, type: :controller do

  render_views

  # always use fixtures with crud controller examples, otherwise request reuse might produce errors
  let(:test_entry) { ev = events(:top_course); ev.dates.clear; ev }
  let(:group) { test_entry.groups.first }
  let(:date)  { { label: 'foo', start_at_date: Date.today, finish_at_date: Date.today } }
  let(:test_entry_attrs) do
    { name: 'Chief Leader Course',
      group_ids: [group.id],
      dates_attributes: [date] }
  end

  def scope_params
    { group_id: group.id }
  end

  before { sign_in(people(:top_leader)) }

  def self.it_should_redirect_to_index
    it { is_expected.to redirect_to course_group_events_path(group.id, returning: true) }
  end

  include_examples 'crud controller', skip: [%w(index), %w(new)]

  def deep_attributes(*args)
    { name: 'Chief Leader Course', dates_attributes: [date], group_ids: [group.id] }
  end


  describe 'GET #index' do
    context '.html' do
      let(:group) { groups(:top_layer) }
      let(:dom) { Capybara::Node::Simple.new(response.body) }
      let(:today) { Date.today }
      let(:last_year) { 1.year.ago }

      it 'renders button to add new events' 


      it 'renders button to add new courses' 


      it 'renders button to export courses' 


      it 'lists entries for current year' 


      it 'pages per year' 


      def event_with_date(opts = {})
        opts = { groups: [group], state: 'application_open', start_at: Date.today }.merge(opts)
        event = Fabricate(:event, groups: opts[:groups], state: opts[:state])
        set_start_dates(event, opts[:start_at])
        event
      end
    end

    context '.csv' do

      let(:group) { groups(:top_layer) }

      it 'renders events csv' 


      it 'renders courses csv' 


      it 'sets cookie on export' 

    end

    context '.ics' do

      let(:group) { groups(:top_layer) }

      it 'renders events ics' 


      it 'renders courses csv' 


    end

  end

  describe 'GET #show' do
    context '.ics' do

      let(:group) { groups(:top_layer) }

      it 'renders event ics' 

    end
  end

  describe 'GET #new' do
    let(:group) { groups(:top_group) }
    let(:dom) { Capybara::Node::Simple.new(response.body) }

    it 'renders new form' 

  end

end

