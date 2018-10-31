# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Event::RolesController do

  let(:group) { groups(:top_layer) }

  let(:course) do
    course = Fabricate(:course, groups: [group])
    course.questions << Fabricate(:event_question, event: course)
    course.questions << Fabricate(:event_question, event: course)
    course
  end

  let(:user) { people(:top_leader) }

  before { sign_in(user) }

  context 'GET new' do
    before { get :new, group_id: group.id, event_id: course.id, event_role: { type: Event::Role::Leader.sti_name } }

    it 'builds participation without answers' 


  end

  context 'POST create' do

    context 'without participation' do

      it 'creates role and participation' 


      it 'creates person add request if required' 


      it 'creates roles and participation for user even if person add request required' 

    end

    context 'with existing participation' do
      it 'creates role' 


      it 'creates role if person add request' 

    end

  end

  context 'PUT update' do
    it 'keeps type if not given' 


    it 'may change type for teamers' 


    it 'may not change type for teamers to participant' 



    it 'may not change type for participant to team' 

  end

end

