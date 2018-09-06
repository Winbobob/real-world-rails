# encoding: utf-8

#  Copyright (c) 2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Export::PeopleExportJob do

  subject { Export::PeopleExportJob.new(format, full, user.id, person_filter, household) }

  let(:user)          { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: group).person }
  let(:person_filter) { Person::Filter::List.new(group, user) }
  let(:group)         { groups(:bottom_layer_one) }
  let(:household)     { false }

  before do
    SeedFu.quiet = true
    SeedFu.seed [Rails.root.join('db', 'seeds')]
  end

  context 'creates a CSV-Export' do
    let(:format) { :csv }
    let(:full) { false }

    it 'and sends it via mail' 


    it 'send exports zipped if larger than 512kb' 


    it 'zips exports larger than 512kb' 


    context 'household' do
      let(:household) { true }

      before do
        user.update(household_key: 1)
        people(:bottom_member).update(household_key: 1)
      end

      it 'and sends email with single line per household' 

    end
  end

  context 'creates a full CSV-Export' do
    let(:format) { :csv }
    let(:full) { true }

    it 'and sends it via mail' 

  end

  context 'creates an Excel-Export' do
    let(:format) { :xlsx }
    let(:full) { false }

    it 'and sends it via mail' 

  end

end

