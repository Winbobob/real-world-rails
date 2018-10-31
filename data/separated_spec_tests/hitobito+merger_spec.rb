# encoding: utf-8

#  Copyright (c) 2012-2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Group::Merger do

  let(:group1) { groups(:bottom_layer_one) }
  let(:group2) { groups(:bottom_layer_two) }
  let(:other_group) { groups(:top_layer) }

  let(:merger) { Group::Merger.new(group1, group2, 'foo') }

  let(:new_group) { Group.find(merger.new_group.id) }

  context 'merge groups' do

    before do
      @person = Fabricate(Group::BottomLayer::Member.name.to_sym,
                          created_at: Date.today - 14, group: group1).person
      Fabricate(Group::BottomLayer::Member.name.to_sym, group: group1)
      Fabricate(Group::BottomLayer::Member.name.to_sym, group: group2)

      Fabricate(:event, groups: [group1])
      Fabricate(:event, groups: [group1])
      Fabricate(:event, groups: [group2])

      Fabricate(:invoice, group: group2, recipient: @person)
      Fabricate(:invoice_article, group: group2)
    end

    it 'creates a new group and merges roles, events' 


    it 'should raise an error if one tries to merge two groups with different types/parent' 


    it 'add events from both groups only once' 


    it 'updates layer_group_id for descendants' 


    it 'moves invoices' 


    it 'moves invoice-articles' 


  end
end

