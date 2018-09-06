# encoding: utf-8

#  Copyright (c) 2012-2015 Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Group::PersonAddRequestIgnoredApproversController do

  let(:group) { groups(:top_layer) }
  let(:user) { people(:top_leader) }

  before { sign_in(user) }

  describe 'PUT update' do
    it 'adds entry for ignored approver' 


    it 'removes entry for added approver' 


    it 'does nothing if approver is already ignored' 


    it 'does nothing if approver is already set' 

  end

end

