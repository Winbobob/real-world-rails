# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Event::KindsController do

  let(:destroyed) { Event::Kind.with_deleted.find(ActiveRecord::FixtureSet.identify(:old)) }

  before { sign_in(people(:top_leader)) }

  it 'POST update resets destroy flag when updating deleted kinds' 


  it 'GET index lists destroyed entries last' 


  it 'POST create accepts qualification_conditions and general_information' 


  context 'qualification kinds' do
    let(:sl) { qualification_kinds(:sl) }
    let(:gl) { qualification_kinds(:gl) }
    let(:ql) { qualification_kinds(:ql) }
    let(:kind) { event_kinds(:fk) }

    it 'creates event kind without associations' 


    it 'adds associations to new event kind' 


    it 'adds association to existing event kind' 


    it 'removes association from existing event kind' 


    it 'removes all associations from existing event kind' 


  end


end

