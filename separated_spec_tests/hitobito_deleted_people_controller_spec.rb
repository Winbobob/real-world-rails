# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Group::DeletedPeopleController do

  let(:group) { groups(:top_group) }
  let(:person1) { people(:top_leader)  }
  let(:person2) { people(:bottom_member)  }

  context 'authenticated and permitted' do

    before { sign_in(person1) }

    it 'renders index view if permitted' 

  end

  context 'authenticated and not permitted' do
    before { sign_in(person2) }
    
    it 'fails if not permitted' 

  end
end

