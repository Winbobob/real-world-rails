# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe ApplicationDecorator do
  it '#klass returns model class'  do
    dec = GroupDecorator.new(Group.new)
    expect(dec.klass).to eq Group
  end

  context 'userstamp' do
    before do
      Person.reset_stamper
      @person = Fabricate(:person)
      @creator = Fabricate(:person)
      @updater = Fabricate(:person)
      @person.creator = @creator
      @person.updater = @updater
      @person.save!
    end

    it 'should return date and time with updater/creator' 

  end


end

