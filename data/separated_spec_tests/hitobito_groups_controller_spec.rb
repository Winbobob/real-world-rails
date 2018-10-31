# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe GroupsController, type: :controller do

  let(:group) { groups(:top_layer) }
  let(:user) { Fabricate(Group::TopLayer::Member.name.to_sym, group: group).person }

  let(:test_entry) { group }
  let(:create_entry_attrs) { { name: 'foo', type: 'Group::TopGroup', parent_id: group.id } }
  let(:update_entry_attrs) { { name: 'bar' } }
  let(:dom) { Capybara::Node::Simple.new(response.body) }

  before { sign_in(user) }

  include_examples 'crud controller', skip: [%w(index), %w(new), %w(destroy)]


  describe 'happy path for skipped crud views' do
    render_views

    it '#index' 


    describe '#show' do

      it 'has a set of links'  do
        get :show, id: groups(:bottom_layer_one).id
        expect(response.body).to match(/Bearbeiten/)
        expect(response.body).not_to match(/Löschen/)
        expect(response.body).to match(/Gruppe erstellen/)
      end

      it 'has no remove link for current layer group' 

    end

    it '#new' 

  end

  context 'created/updated info' do
    it 'user can see created or updated info' 


    it 'user cannot see created or updated info' 

  end

  context 'GET #deleted_subgroups'do
    before { groups(:bottom_group_one_one_one).destroy }

    it 'renders delete subgroups with link' 

  end

end

