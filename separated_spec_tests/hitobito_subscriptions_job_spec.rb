# encoding: utf-8

#  Copyright (c) 2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Export::SubscriptionsJob do

  subject { Export::SubscriptionsJob.new(format, mailing_list.id, user.id, true) }

  let(:mailing_list) { mailing_lists(:info) }
  let(:user)         { people(:top_leader)}

  let(:group)        { groups(:top_layer) }
  let(:mailing_list) { Fabricate(:mailing_list, group: group) }

  before do
    SeedFu.quiet = true
    SeedFu.seed [Rails.root.join('db', 'seeds')]

    Fabricate(:subscription, mailing_list: mailing_list)
    Fabricate(:subscription, mailing_list: mailing_list)
  end

  context 'creates an CSV-Export' do
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

