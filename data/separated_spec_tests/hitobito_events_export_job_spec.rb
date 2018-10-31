# encoding: utf-8

#  Copyright (c) 2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Export::EventsExportJob do

  subject { Export::EventsExportJob.new(format, user.id, nil, year, group) }

  let(:user)  { people(:top_leader) }
  let(:group) { groups(:top_layer) }
  let(:year)  { 2012 }

  before do
    SeedFu.quiet = true
    SeedFu.seed [Rails.root.join('db', 'seeds')]
    Fabricate(:event)
  end

  context 'creates a CSV-Export' do
    let(:format) { :csv }

    it 'and sends it via mail' 


    it 'send exports zipped if larger than 512kb' 


    it 'zips exports larger than 512kb' 

  end

  context 'creates an Excel-Export' do
    let(:format) { :xlsx }

    it 'and sends it via mail' 

  end

end

