# encoding: utf-8

#  Copyright (c) 2012-2016, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::TagsController do

  let(:top_leader) { people(:top_leader) }
  let(:bottom_member) { people(:bottom_member) }

  before { sign_in(top_leader) }

  describe 'GET #query' do
    let(:group) { groups(:top_layer) }
    let(:top_leader) { people(:top_leader) }
    let(:bottom_member) { people(:bottom_member) }

    before do
      bottom_member.tag_list.add('loremipsum')
      bottom_member.save!
      top_leader.tag_list.add('lorem', 'ispum')
      top_leader.save!
    end

    it 'returns empty array if no :q param is given' 


    it 'returns empty array if no tag matches' 


    it 'returns empty array if :q param is not at least 3 chars long' 


    it 'returns matching and unassigned tags if :q param at least 3 chars long' 

  end

  describe 'POST #create' do
    it 'creates person tag' 

  end

  describe 'DELETE #destroy' do
    it 'deletes person tag' 

  end

end

