require 'spec_helper'

RSpec.describe Event::ParticipationFilter, type: :domain do
  subject { Event::ParticipationFilter.new(event, people(:bottom_member), params) }

  let(:participation)              { event_participations(:top) }
  let(:person)                     { Fabricate(:person, first_name: 'Max', last_name: 'muster', nickname: 'bambi') }
  let(:event)                      { participation.event }
  let(:params)                     { { filter: 'all' } }

  before do
    participation = Event::Participation.create(event: event, active: true, person: person)
    Event::Role::Leader.create(participation: participation)
  end

  context 'without search string' do
    it 'lists all entries' 

  end

  context 'search for first_name' do
    let(:params) { { filter: 'all', q: 'max' } }

    it 'and list matching entries' 

  end

  context 'search for last_name' do
    let(:params) { { filter: 'all', q: 'ember' } }

    it 'and list matching entries' 

  end

  context 'search for nickname' do
    let(:params) { { filter: 'all', q: 'bambi' } }

    it 'and list matching entries' 

  end

end

