# encoding: utf-8

#  Copyright (c) 2012-2018, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Event::Filter do

  let(:group) { groups(:top_layer) }
  let(:year)  { 2012 }
  let(:type)  { nil }

  before do
    @g1 = Fabricate(Group::TopGroup.name.to_sym, name: 'g1', parent: groups(:top_group))
    Fabricate(:event, groups: [@g1])
    Fabricate(:event, groups: [groups(:bottom_group_one_one)])
  end

  def filter(filter = nil, sort_expression = nil)
    Event::Filter.new(type, filter, group, year, sort_expression)
  end

  it 'lists events of descendant groups by default' 


  it 'lists events of descendant groups for filter all' 


  it 'limits list to events of all non layer descendants' 


  it 'sorts according to sort_expression' 


end

