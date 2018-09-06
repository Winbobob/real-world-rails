# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Subscriber::ExcludePersonController do

  before { sign_in(person) }

  let(:group) { groups(:top_group) }
  let(:person) { people(:top_leader) }
  let(:list) { Fabricate(:mailing_list, group: group) }

  context 'POST create' do

    context 'with existing subscription' do

      it 'destroys subscription' 


      it 'creates exclusion' 


      it 'creates exclusion even if person add request is required' 


      after do
        expect(list.subscribed?(person)).to be_falsey
      end
    end


    it 'without subscriber_id replaces error' 


    it 'without valid subscriber_id replaces error' 


    it 'duplicated subscription replaces error' 

  end
end

