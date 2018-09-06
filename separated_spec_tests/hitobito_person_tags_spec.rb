# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe 'Person Tags', js: true do

  subject { page }
  let(:group) { groups(:top_group) }
  let(:leader) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: group).person }
  let(:secretary) { Fabricate(Group::TopGroup::LocalSecretary.name.to_sym, group: group).person }
  let(:user) { leader }
  let(:person) { people(:top_leader) }

  before do
    sign_in(user)
  end

  context 'listing' do
    context 'user without :index_tags permission' do
      let(:user) { secretary }

      it 'does not show tags section' 

    end

    context 'user with :index_tags permission' do
      let(:user) { leader }

      it 'lists tags without categories' 


      it 'lists tags grouped by categories' 

    end
  end

  context 'creation' do
    before do
      user.tag_list.add('pasta')
      user.save!
      visit group_person_path(group_id: group.id, id: person.id)
    end

    it 'adds newly created tags' 

  end

  context 'deletion' do
    before do
      person.tag_list.add('pizza', 'fruit:banana', 'fruit:apple')
      person.save!
      visit group_person_path(group_id: group.id, id: person.id)
    end

    it 'removes deleted tags' 

  end

end

