# encoding: utf-8

#  Copyright (c) 2012-2017, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe NotesController do

  let(:top_leader) { people(:top_leader) }
  let(:bottom_member) { people(:bottom_member) }

  before { sign_in(top_leader) }

  describe 'GET #index' do
    let(:group) { groups(:top_layer) }
    let(:top_leader) { people(:top_leader) }
    let(:bottom_member) { people(:bottom_member) }

    it 'assignes all notes of layer' 

  end

  describe 'POST #create' do
    it 'creates person notes' 


    it 'creates group notes' 


    it 'redirects for html requests' 


    it 'cannot create notes on lower layer' 

  end

  describe 'POST #destroy' do
    it 'destroys person note' 


    it 'redirects for html requests' 

  end

end

