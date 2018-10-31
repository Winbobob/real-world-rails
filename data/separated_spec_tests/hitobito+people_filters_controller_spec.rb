# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe PeopleFiltersController do

  before { sign_in(user) }

  let(:user) { people(:top_leader) }
  let(:group) { groups(:top_group) }
  let(:role_types) { [Group::TopGroup::Leader, Group::TopGroup::Member] }
  let(:role_type_ids) { role_types.collect(&:id) }
  let(:role_type_ids_string) { role_type_ids.join(Person::Filter::Base::ID_URL_SEPARATOR) }
  let(:role_type_names) { role_types.collect(&:sti_name) }

  context 'GET new' do
    it 'builds entry with group and existing params' 

  end

  context 'POST create' do
    it 'redirects to show for search' 


    it 'redirects to show for empty search' 


    it 'saves filter and redirects to show with save' 


    context 'with read only permissions' do
      before do
        @role = Fabricate(Group::BottomLayer::Member.name.to_sym, group: groups(:bottom_layer_one))
        @person = @role.person
        sign_in(@person)
      end

      let(:group) { @role.group }

      it 'redirects to show with search' 


      it 'is not authorized with save' 

    end
  end

end

