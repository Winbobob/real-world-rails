# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

# encoding:  utf-8

require 'spec_helper'

describe PeopleController, type: :controller do

  let(:top_leader) { people(:top_leader) }
  let(:top_group) { groups(:top_group) }
  let(:bottom_group) { groups(:bottom_group_one_one) }
  let(:test_entry) { top_leader }
  let(:test_entry_attrs) { { first_name: 'foo', last_name: 'bar' } }
  let(:other) { Fabricate(Group::TopGroup::Member.name.to_sym, group: top_group).person  }
  let(:dom) { Capybara::Node::Simple.new(response.body) }

  before { sign_in(top_leader) }


  def scope_params
    return { group_id: top_group.id } unless RSpec.current_example.metadata[:action] == :new
    {  group_id: top_group.id, role: { type: 'Group::TopGroup::Member', group_id: top_group.id }  }
  end


  include_examples 'crud controller', skip: [%w(new), %w(create), %w(destroy)]

  describe '#show' do
    let(:page_content) { ['Bearbeiten', 'Info', 'Verlauf', 'Aktive Rollen', 'Passwort ändern'] }

    it 'cannot view person in uppper group' 


    it 'renders my own page' 


    it 'renders page of other group member' 


    it 'leader can see link to remove role' 


    it 'leader can see created and updated info' 


    it 'member without permission to see details cannot see created or updated info' 


    context 'send_login tooltip' do
      before { sign_in(top_leader) }

      def tooltip_includes(text)
        expect(dom.all('.btn[rel^=tooltip]')[0][:title]).to include(text)
      end

      it 'should hint for persons without login and token' 


      it 'should hint for persons without login but with token' 


      it 'should hint for persons with login' 

    end
  end


  describe 'role section' do
    let(:params) { { group_id: top_group.id, id: top_leader.id } }
    let(:section) { dom.all('aside section')[1] }

    it 'contains roles' 

  end

  describe 'add requests section' do
    let(:section) { dom.all('aside section')[2] }

    it 'contains requests' 


    it 'is hidden if no pending requests exist' 

  end

  describe 'event sections' do
    let(:params) { { group_id: top_group.id, id: top_leader.id } }
    let(:header) { section.find('h2').text }
    let(:dates) { section.find('tr:eq(1) td:eq(2)').text.strip }
    let(:label) { section.find('tr:eq(1) td:eq(1)') }
    let(:label_link) { label.find('a') }
    let(:course) { Fabricate(:course, groups: [groups(:top_layer)], kind: event_kinds(:slk))  }

    context 'pending applications' do
      let(:section) { dom.all('aside section')[2] }
      let(:date) { Time.zone.parse('02-01-2010') }

      it 'is missing if we have no applications' 


      it 'lists application' 

    end

    context 'upcoming events' do
      let(:section) { dom.all('aside section')[2] }
      let(:date) { 2.days.from_now }
      let(:pretty_date) { date.strftime('%d.%m.%Y %H:%M') + ' - ' + (date + 5.days).strftime('%d.%m.%Y %H:%M') }

      it 'is missing if we have no events' 


      it 'is missing if we have no upcoming events' 


      it 'lists event label, link and dates' 

    end

    def create_application(date)
      Fabricate(:event_application, priority_1: course, participation: create_participation(date, false))
    end

    def create_participation(date, active_participation = false)
      set_start_finish(course, date, date + 5.days)
      Fabricate(:event_participation, person: top_leader, event: course, active: active_participation)
    end

  end

  describe_action :put, :update, id: true do
    let(:params) { { person: { birthday: '33.33.33' } } }

    it 'displays old value again' 

  end

  describe 'redirect_url' do
    it 'should adjust url if param redirect_url is given' 

  end

end

