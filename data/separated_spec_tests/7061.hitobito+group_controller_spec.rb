# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Subscriber::GroupController do

  before { sign_in(people(:top_leader)) }

  let(:list) { mailing_lists(:leaders) }
  let(:group) { list.group }

  context 'GET query' do
    subject { response.body }

    context 'top group' do
      before do
        get :query, q: 'bot', group_id: group.id, mailing_list_id: list.id
      end

      it { is_expected.to match(/Top \\u0026gt; Bottom One/) }
      it { is_expected.to match(/Bottom One \\u0026gt; Group 11/) }
      it { is_expected.to match(/Bottom One \\u0026gt; Group 12/) }
      it { is_expected.to match(/Top \\u0026gt; Bottom Two/) }
      it { is_expected.to match(/Bottom Two \\u0026gt; Group 21/) }
      it { is_expected.not_to match(/Bottom One \\u0026gt; Group 111/) }
    end

    context 'bottom layer' do
      let(:group) { groups(:bottom_layer_one) }
      let(:list) { MailingList.create!(group: group, name: 'bottom_layer') }

      before do
        Group::BottomLayer::Leader.create!(group: group, person: people(:top_leader))
        get :query, q: 'bot', group_id: group.id, mailing_list_id: list.id
      end

      it 'does not include sister group or their descendants' 

    end

  end

  context 'GET roles.js' do
    it 'load role types' 


    it 'does not load role types for nil group' 


  end

  context 'POST create' do
    it 'without subscriber_id replaces error' 


    it 'create subscription with role types' 

  end

end

