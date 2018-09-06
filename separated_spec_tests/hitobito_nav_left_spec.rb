# encoding: utf-8

#  Copyright (c) 2012-2014, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe 'Sheet::Group::NavLeft' do

  let(:group) { groups(:bottom_group_one_one) }
  let(:sheet) { Sheet::Group.new(self, nil, group) }
  let(:nav)   { Sheet::Group::NavLeft.new(sheet) }

  let(:request) { ActionController::TestRequest.new }

  let(:html) { nav.render }
  subject { Capybara::Node::Simple.new(html) }

  def can?(*_args)
    true
  end

  it { is_expected.to have_selector('li', count: 4) }

  it { is_expected.to have_selector('ul', count: 2) }

  it 'has balanced li tags' 


  it 'has balanced li tags if last group is stacked' 


  context 'short name' do
    let(:group) { groups(:top_layer) }

    before do
      group.update(short_name: 'TP')
      groups(:top_group).update(short_name: 'TG')
    end

    it 'displays header group with full name' 


    # TODO: safe_join of this test's view does not behave as it should
    # it 'displays sub layer with short name if available' do
    #   is_expected.to have_link('One', text: 'One')
    #   is_expected.to_not have_link('Bottom One', text: 'Bottom One')
    # end

    it 'displays group with short name if available' 

  end

  context 'layer groups visibility' do
    before do
      # Hierarchy:
      #  * Bottom One (layer)
      #    * Group 11
      #      * Group 111
      #        * Group 1111
      #      * Group 112
      #    * Group 12
      #      * Group 121

      Fabricate(Group::BottomGroup.sti_name.to_sym, parent: groups(:bottom_group_one_one_one),
                                                    name: 'Group 1111')
      Fabricate(Group::BottomGroup.sti_name.to_sym, parent: groups(:bottom_group_one_one),
                                                    name: 'Group 112')
      Fabricate(Group::BottomGroup.sti_name.to_sym, parent: groups(:bottom_group_one_two),
                                                    name: 'Group 121')
    end

    context 'Bottom One' do
      let(:group) { groups(:bottom_layer_one) }

      it 'displays itself' 


      it 'displays childs' 


      it 'hides other decendents' 


      it 'displays deleted peoples' 

    end

    context 'Group 11' do
      let(:group) { groups(:bottom_group_one_one) }

      it 'displays itself' 


      it 'displays childs' 


      it 'hides other decendents' 


      it 'displays ancestors and its siblings' 


      it 'hides decendents of ancestor siblings' 


      it 'displays deleted peoples' 

    end

    context 'Group 111' do
      let(:group) { groups(:bottom_group_one_one_one) }

      it 'displays itself' 


      it 'displays childs' 


      it 'displays ancestors and its siblings' 


      it 'hides decendents of ancestor siblings' 


      it 'displays deleted peoples' 

    end

    context 'Group 1111' do
      let(:group) { groups(:bottom_group_one_one_one) }

      it 'displays ancestors and its siblings' 


      it 'hides decendents of ancestor siblings' 


      it 'displays deleted peoples' 

    end
  end

end

