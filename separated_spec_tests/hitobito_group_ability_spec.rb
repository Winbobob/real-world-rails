# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'


describe GroupAbility do


  subject { ability }
  let(:ability) { Ability.new(role.person.reload) }


  context 'layer and below full' do
    let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }

    context 'without specific group' do
      it 'may not create subgroup' 

    end

    context 'in own group' do
      let(:group) { role.group }

      it 'may create subgroup' 


      it 'may edit group' 


      it 'may not modify superior' 


      it 'may destroy group' 


      it 'may not destroy permission giving group' 


      it 'may show person notes' 


      it 'may manage person tags' 

    end

    context 'in group from lower layer' do
      let(:group) { groups(:bottom_layer_one) }

      it 'may create subgroup' 


      it 'may edit group' 


      it 'may modify superior' 


      it 'may modify superior in new group' 


      it 'may destroy group' 


      it 'may show person notes' 


      it 'may manage person tags' 

    end
  end

  context 'layer and below full in lower layer' do
    let(:role) { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)) }

    context 'in own group' do
      let(:group) { role.group }

      it 'may edit group' 


      it 'may not modify superior' 


      it 'may show person notes' 


      it 'may manage person tags' 

    end

    context 'in top layer' do
      let(:group) { groups(:top_group) }

      it 'may not show person notes' 


      it 'may not manage person tags' 

    end
  end

  context 'layer full' do
    let(:role) { Fabricate(Group::TopGroup::LocalGuide.name.to_sym, group: groups(:top_group)) }

    context 'without specific group' do
      it 'may not create subgroup' 

    end

    context 'in own group' do
      let(:group) { role.group }

      it 'may create subgroup' 


      it 'may edit group' 


      it 'may not destroy permission giving group' 


      it 'may not modify superior' 


      it 'may not create sublayer' 


      it 'may show person notes' 


      it 'may manage person tags' 

    end

    context 'in group from same layer' do
      let(:group) { Fabricate(Group::TopGroup.name.to_sym, parent: groups(:top_layer)) }

      it 'may create subgroup' 


      it 'may edit group' 


      it 'may destroy group' 


      it 'may show person notes' 


      it 'may manage person tags' 

    end

    context 'in group from lower layer' do
      let(:group) { groups(:bottom_layer_one) }

      it 'may not create subgroup' 


      it 'may not edit group' 


      it 'may not destroy group' 


      it 'may not show person notes' 


      it 'may not manage person tags' 

    end
  end

  context 'group and below full' do
    let(:role) { Fabricate(Group::TopLayer::TopAdmin.name.to_sym, group: groups(:top_layer)) }

    context 'in own group' do
      let(:group) { role.group }
      it 'may create subgroup' 


      it 'may not create sub layer' 


      it 'may edit group' 


      it 'may edit below group' 


      it 'may not edit below layer' 


      it 'may not destroy group' 


      it 'may destroy below group' 


      it 'may not modify superior' 


      it 'may not modify superior in below group' 


      it 'may not show person notes' 


      it 'may not manage person tags' 

    end

    context 'without specific group' do
      it 'may not create subgroup' 

    end

    context 'in other group from same layer' do
      let(:group) { groups(:top_group) }
      it 'may create subgroup' 

    end

    context 'in group from lower layer' do
      let(:group) { groups(:bottom_layer_one) }
      it 'may not create subgroup' 

    end
  end

  context 'group full' do
    let(:role) { Fabricate(Group::GlobalGroup::Leader.name.to_sym, group: groups(:toppers)) }

    context 'in own group' do
      let(:group) { role.group }
      it 'may not create subgroup' 


      it 'may edit group' 


      it 'may not destroy group' 


      it 'may not modify superior' 


      it 'may not show person notes' 


      it 'may not manage person tags' 

    end

    context 'without specific group' do
      it 'may not create subgroup' 

    end

    context 'in other group from same layer' do
      let(:group) { groups(:top_group) }
      it 'may not create subgroup' 

    end

    context 'in group from lower layer' do
      let(:group) { groups(:bottom_layer_one) }
      it 'may not create subgroup' 

    end
  end

  context 'finance' do
    let(:role) { Fabricate(Group::TopGroup::Leader.name.to_sym, group: groups(:top_group)) }

    it 'may not index invoices on random group' 


    it 'may not index in own group' 


    it 'may not index in bottom layer group' 


    it 'may index in top layer layer group' 

  end

  context 'deleted group' do
    let(:group) { groups(:bottom_layer_two) }
    let(:role) { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: group) }
    before do
      group.children.each { |g| g.destroy }
      group.destroy
    end

    it 'may not create subgroup' 


    it 'may not update group' 


    it 'may reactivate group' 

  end

end

