# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Subscriber::PersonController do

  before { sign_in(user) }

  let(:group) { groups(:top_group) }
  let(:user) { people(:top_leader) }
  let(:list) { Fabricate(:mailing_list, group: group) }

  context 'POST create' do
    it 'without subscriber_id replaces error' 


    it 'duplicated subscription replaces error' 


    it 'updates exclude flag for existing subscription' 



    context 'with required person add requests' do
      let(:group) { groups(:bottom_layer_one) }
      let(:user)  { Fabricate(Group::BottomLayer::Leader.name, group: group).person }
      let(:person) { Fabricate(Group::BottomGroup::Leader.name, group: groups(:bottom_group_two_one)).person }

      it 'creates subscription if person already visible' 


      it 'creates person add request' 


      it 'shows notification if person add request already exists' 


    end

  end
end

