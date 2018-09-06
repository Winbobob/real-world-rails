# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe GroupDecorator, :draper_with_helpers do
  include Rails.application.routes.url_helpers

  let(:context) { double('context') }
  let(:model) { groups(:top_group) }

  subject { GroupDecorator.new(model) }

  describe 'possible roles' do
    its(:possible_roles) do
      should eq [Group::TopGroup::Leader,
                 Group::TopGroup::LocalGuide,
                 Group::TopGroup::Secretary,
                 Group::TopGroup::LocalSecretary,
                 Group::TopGroup::Member,
                 Role::External]
    end
  end

  describe 'selecting attributes' do

    class DummyGroup < Group
      self.used_attributes += [:foo, :bar]
    end

    let(:model) { DummyGroup.new }

    before do
      allow(subject).to receive_messages(h: context)
    end

    it '#used_attributes selects via .attr_used?' 


    it '#modifiable_attributes we can :modify_superior' 


    it '#modifiable_attributes filters attributes if we cannot :modify_superior' 

  end

end

