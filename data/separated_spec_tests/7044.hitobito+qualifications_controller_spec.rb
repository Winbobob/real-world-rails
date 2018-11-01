# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'
describe QualificationsController do

  before { sign_in(person) }
  let(:group) { groups(:top_group) }
  let(:person) { people(:top_leader) }
  let(:params) { { group_id: group.id, person_id: person.id } }



  context 'GET new' do
    it 'builds entry for person' 

  end


  context 'POST create' do
    let(:kind) { qualification_kinds(:gl) }
    it 'redirects to show for person' 


    it 'fails without permission' 

  end

  context 'POST destroy' do
    let(:id) { @qualification.id }
    before { @qualification = Fabricate(:qualification, person: person) }
    it 'redirects to show for person' 


    it 'fails without permission' 

  end



end

