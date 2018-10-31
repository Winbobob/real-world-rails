# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe LabelFormatsController do

  let(:group) { groups(:top_group) }
  let(:person) { people(:top_leader) }

  describe 'with admin permissions' do

    before do
      sign_in(person)
    end

    it 'create global label' 


    it 'create personal label' 

  end

  describe 'without admin permissions' do

    let(:person) { Fabricate(Group::TopGroup::Member.name.to_sym, group: groups(:top_group)).person }

    before do
      sign_in(person)
    end

    it 'create personal label' 


    it 'can not create global label' 


    it 'sorts global formats' 


  end

end

