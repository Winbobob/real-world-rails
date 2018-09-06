# encoding: utf-8

#  Copyright (c) 2012-2017, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe 'Person Notes', js: true do

  subject { page }
  let(:group) { groups(:top_group) }
  let(:leader) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: group).person }
  let(:secretary) { Fabricate(Group::TopGroup::LocalSecretary.name.to_sym, group: group).person }
  let(:user) { leader }
  let(:person) { people(:top_leader) }

  before do
    sign_in(user)
  end

  context 'creation' do
    before do
      visit group_person_path(group_id: group.id, id: person.id)
    end

    it 'adds newly created notes' 

  end

  context 'deletion' do
    before do
      @n1 = group.notes.create!(text: 'foo', author: user)
      @n2 = group.notes.create!(text: 'bar', author: user)
      visit group_path(id: group.id)
    end

    it 'removes deleted notes' 

  end

end

