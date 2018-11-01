# encoding: utf-8

#  Copyright (c) 2018, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::Filter::List do

  it 'empty filter works for normal user' 


  it 'empty filter works with root user' 


  def filter_list(person: people(:top_leader), group: groups(:top_group), filter: PeopleFilter.new(name: 'name'))
    described_class.new(group, person, filter)
  end
end

