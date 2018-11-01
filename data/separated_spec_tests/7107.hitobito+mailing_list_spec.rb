# encoding: utf-8

#  Copyright (c) 2012-2015, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::AddRequest::Approver::MailingList do

  let(:person) { Fabricate(Group::BottomLayer::Member.name, group: groups(:bottom_layer_two)).person }
  let(:requester) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_one)).person }

  let(:user) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_two)).person }

  subject { Person::AddRequest::Approver.for(request, user) }

  let(:group) { groups(:bottom_group_one_one) }
  let(:list) { Fabricate(:mailing_list, group: group) }

  let(:request) do
    Person::AddRequest::MailingList.create!(
      person: person,
      requester: requester,
      body: list)
  end

  it 'resolves correct subclass based on request' 


  context '#approve' do

    # load before to get correct change counts
    before { subject }

    it 'creates a new subscription' 


    it 'does nothing if subscription already exists' 


    it 'creates new one if subscription was excluded before' 


  end

end

