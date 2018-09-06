# encoding: utf-8

#  Copyright (c) 2012-2013, CEVI ZH SH GL. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Devise::TokensController do

  let(:bottom_group) { groups(:bottom_group_one_one) }
  let(:role) { Fabricate('Group::BottomGroup::Member', group: bottom_group) }
  let(:person) do
    role.person.update_attribute(:password, 'password')
    role.person.reload
  end

  before do
    @controller.allow_forgery_protection = true
    @request.env["devise.mapping"] = Devise.mappings[:person]
  end

  render_views

  context 'POST create' do
    it 'responds with unauthorized with wrong password' 


    it 'responds with unauthorized with token' 


    it 'responds with user and newly generated token' 


    it 'responds with user and regenerated token' 

  end

  context 'DELETE destroy' do
    it 'responds with unauthorized with wrong password' 


    it 'responds with unauthorized with token' 


    it 'responds without token' 


    it 'responds with deleted token' 

  end


end

