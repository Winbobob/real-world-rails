# encoding: utf-8

#  Copyright (c) 2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Export::PeopleExportJob do

  subject { Export::PeopleExportJob.new(format, user.id, filter, { household: household, full: full, filename: 'people_export' }) }

  let(:user)      { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: group).person }
  let(:filter)    { Person::Filter::List.new(group, user) }
  let(:group)     { groups(:bottom_layer_one) }
  let(:household) { false }
  let(:filepath)      { AsyncDownloadFile::DIRECTORY.join('people_export') }

  before do
    SeedFu.quiet = true
    SeedFu.seed [Rails.root.join('db', 'seeds')]
  end

  context 'creates a CSV-Export' do
    let(:format) { :csv }
    let(:full) { false }

    it 'and saves it' 


    context 'household' do
      let(:household) { true }

      before do
        user.update(household_key: 1)
        people(:bottom_member).update(household_key: 1)
      end

      it 'and saves it with single line per household' 

    end
  end

  context 'creates a full CSV-Export' do
    let(:format) { :csv }
    let(:full) { true }

    it 'and saves it' 

  end

  context 'creates an Excel-Export' do
    let(:format) { :xlsx }
    let(:full) { false }

    it 'and saves it' 

  end

end

