# encoding: utf-8

#  Copyright (c) 2012-2015, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::HistoryController, type: :controller do

  render_views

  let(:top_leader) { people(:top_leader) }
  let(:top_group) { groups(:top_group) }
  let(:bottom_group) { groups(:bottom_group_one_one) }
  let(:test_entry) { top_leader }
  let(:other) { Fabricate(Group::TopGroup::Member.name.to_sym, group: top_group).person }
  let(:dom) { Capybara::Node::Simple.new(response.body) }

  before { sign_in(top_leader) }

  describe '#index' do
    let(:params) { { group_id: top_group.id, id: other.id } }

    it 'list current role and group' 


    it 'lists past roles' 


    it 'lists roles in other groups' 


    it 'lists past roles in other groups' 


    it "lists person's events" 

  end

end
