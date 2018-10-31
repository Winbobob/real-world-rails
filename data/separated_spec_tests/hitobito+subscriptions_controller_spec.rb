# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe SubscriptionsController do

  before { sign_in(user) }

  let(:user)  { people(:top_leader) }
  let(:group) { groups(:top_layer) }
  let(:event) { Fabricate(:event, groups: [group], dates: [Fabricate(:event_date, start_at: Time.zone.today)]) }
  let(:mailing_list) { Fabricate(:mailing_list, group: group) }

  context 'GET index' do
    before do
      create_group_subscription(mailing_list)
      @person_subscription = create_person_subscription(mailing_list)
      create_event_subscription(mailing_list)
      @excluded_person_subscription = create_person_subscription(mailing_list, true)
    end

    it 'groups subscriptions by type' 


    it 'renders csv in backround job' 


    it 'renders xlsx in backround job' 


    it 'sets cookie on export' 


    it 'exports vcf files' 


    it 'renders email addresses with additional ones' 


    it 'renders email addresses with additional_email matching preferred_labels instead of subscriber email' 


    it 'loads pending person add requests' 

  end

  def create_group_subscription(mailing_list)
    group = groups(:bottom_layer_one)
    Fabricate(:subscription,
              mailing_list: mailing_list,
              subscriber: group,
              related_role_types: [RelatedRoleType.new(role_type: Group::BottomLayer::Member.sti_name)])
  end

  def create_person_subscription(mailing_list, excluded = false)
    Fabricate(:subscription, mailing_list: mailing_list, excluded: excluded)
  end

  def create_event_subscription(mailing_list)
    Fabricate(:subscription, mailing_list: mailing_list, subscriber: event)
  end

end

