# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Event::ParticipationMailer do

  before do
    SeedFu.quiet = true
    SeedFu.seed [Rails.root.join('db', 'seeds')]
  end

  let(:person) { people(:top_leader) }
  let(:event) { Fabricate(:event) }
  let(:participation) { Fabricate(:event_participation, event: event, person: person) }
  let(:mail) { Event::ParticipationMailer.confirmation(participation) }

  before do
    Fabricate(:phone_number, contactable: person, public: true)
  end

  subject { mail.parts.first.body }

  it 'includes an html and a pdf part' 


  it 'deals with quotes in event name' 


  describe 'event data' do
    it 'renders set attributes only' 


    it 'renders location if set' 


    it 'renders dates if set' 


    it 'renders multiple dates below each other' 


    it 'renders participant info' 


    it 'renders application questions if present' 

  end

  describe '#confirmation' do

    it 'renders the headers' 


    it { is_expected.to match(/Hallo Top/) }

    it 'contains participation url' 


    it 'sends to all email addresses of participant' 


  end

  describe '#approval' do
    subject { mail.body }

    let(:approvers) do
      [Fabricate(:person, email: 'approver0@example.com', first_name: 'firsty'),
       Fabricate(:person, email: 'approver1@example.com', first_name: 'lasty')]
    end
    let(:mail) { Event::ParticipationMailer.approval(participation, approvers) }

    it 'sends to all email addresses of approvers' 


    it { is_expected.to match(/Hallo firsty, lasty/) }
    it { is_expected.to match(/Top Leader hat sich/) }
  end

  describe '#cancel' do
    let(:mail) { Event::ParticipationMailer.cancel(event, person) }
    subject { mail.body }

    it 'renders dates if set' 


    it 'renders multiple dates below each other' 


    it 'renders the headers' 


    it { is_expected.to match(/Hallo Top/) }

  end
end

