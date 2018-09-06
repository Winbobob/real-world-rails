# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'
describe Subscriber::UserController do

  before { sign_in(person) }

  let(:group) { groups(:top_group) }
  let(:person) { people(:top_leader) }
  let(:list) { Fabricate(:mailing_list, group: group, subscribable: true) }

  context 'POST create' do

    context 'as any user' do
      let(:person) { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)).person }

      it 'can create new subscription' 


      it 'cannot create new subscription if mailing list not subscribable' 

    end

    context 'as admin user'  do
      it 'creates new subscription' 


      it 'creates new subscription only once' 


      it 'updates excluded subscription' 


      after do
        expect(flash[:notice]).to eq 'Du wurdest dem Abo erfolgreich hinzugefügt.'
        is_expected.to redirect_to group_mailing_list_path(group_id: list.group.id, id: list.id)
      end
    end
  end


  context 'POST destroy' do
    it 'creates exclusion when no direct subscription exists' 


    it 'handle multiple direct and indirect subscription' 


    it 'destroys direct subscription' 


    it 'does not create exclusion twice' 


    after do
      expect(flash[:notice]).to eq 'Du wurdest erfolgreich vom Abo entfernt.'
      is_expected.to redirect_to group_mailing_list_path(group_id: list.group.id, id: list.id)
    end
  end

end

