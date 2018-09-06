# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe EventsController do

  let(:user) { people(:top_leader) }

  let(:event) { Fabricate(:course) }
  let(:group) { event.groups.first }

  it 'signs in with valid token' 


  it 'cannot sign in with expired token' 


  it 'cannot sign in with wrong token' 

end

