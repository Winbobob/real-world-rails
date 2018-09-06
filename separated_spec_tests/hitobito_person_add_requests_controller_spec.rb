# encoding: utf-8

#  Copyright (c) 2012-2015 Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Group::PersonAddRequestsController do

  before { sign_in(user) }
  let(:group) { groups(:top_layer) }
  let(:user) { people(:top_leader) }

  describe 'GET index' do

    context 'status notification' do

      it 'shows nothing if no params passed' 


      it 'shows nothing if not all params passed' 


      it 'shows nothing if person_id not in layer' 


      it 'shows approved message if role exists' 


      it 'shows rejected message if role does not exist' 


      it 'assigns current if request exists' 

    end
  end

  context 'POST activate' do
    let(:other_group) { groups(:bottom_layer_one) }

    it 'activates person add requests requirement if user has write permissions' 


    it 'access denied when trying to activate for other group' 


  end

  context 'DELETE deactivate' do

    before { group.update_attribute(:require_person_add_requests, true) }
    let(:other_group) { groups(:bottom_layer_one) }

    it 'deactivates person add requests requirement if user has write permissions' 


    it 'access denied when trying to deactivate for other group' 


  end

end

