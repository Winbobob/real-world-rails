# encoding: utf-8

#  Copyright (c) 2017 Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::ImpersonationController do

  before do
    @ref = @request.env['HTTP_REFERER'] = root_path
    SeedFu.quiet = true
    SeedFu.seed [Rails.root.join('db', 'seeds')]
  end

  let(:group) { groups(:top_layer) }
  let(:user) { people(:top_leader) }

  context 'POST' do
    before { sign_in(user) }

    it 'impersonates user and sets origin_user' 


    it 'impersonates user and create Log entry' 


    it 'impersonates user and sends mail' 


    it 'cannot impersonate user if current_user' 


    it 'user without permission cannot impersonate user' 

  end

  context 'DELETE' do
    before do
      sign_in(people(:bottom_member))
    end

    it 'returns to origin user and creates log entry' 


    it 'redirects back if no origin_user' 

  end
end

