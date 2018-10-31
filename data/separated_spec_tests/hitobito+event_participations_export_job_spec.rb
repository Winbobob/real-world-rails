# encoding: utf-8

#  Copyright (c) 2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Export::EventParticipationsExportJob do

  subject { Export::EventParticipationsExportJob.new(format, user.id, event_participation_filter, params.merge(filename: 'event_participation_export')) }

  let(:participation)              { event_participations(:top) }
  let(:user)                       { participation.person }
  let(:event)                      { participation.event }
  let(:params)                     { { filter: 'all' } }
  let(:event_participation_filter) { Event::ParticipationFilter.new(event, user, params) }
  let(:filepath)      { AsyncDownloadFile::DIRECTORY.join('event_participation_export') }

  before do
    SeedFu.quiet = true
    SeedFu.seed [Rails.root.join('db', 'seeds')]
  end

  context 'creates a CSV-Export' do
    let(:format) { :csv }

    it 'and saves it' 

  end

  context 'creates a full CSV-Export' do
    let(:format) { :csv }
    let(:params) { { details: true } }

    it 'and saves it' 

  end

  context 'creates an Excel-Export' do
    let(:format) { :xlsx }

    it 'and saves it' 

  end

end

