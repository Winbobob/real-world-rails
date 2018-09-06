# encoding: utf-8

#  Copyright (c) 2012-2014, Jungwacht Blauring Schweiz, Pfadibewegung Schweiz.
#  This file is part of hitobito and licensed under the Affero General Public
#  License version 3 or later. See the COPYING file at the top-level
#  directory or at https://github.com/hitobito/hitobito.

require 'spec_helper'

describe PeopleController, js: true do

  let(:group) { groups(:top_layer) }

  it 'may define role filter, display and edit it again' 


  context 'toggling roles' do
    it 'toggles roles when clicking layer' 


    it 'toggles roles when clicking group' 


    it 'toggles groups and layers when changing range' 

  end

  def sign_in_and_create_filter
    sign_in
    visit group_people_path(group)
    expect(page).to have_no_selector('.table tbody tr')

    click_link 'Weitere Ansichten'
    click_link 'Neuer Filter...'
    click_link 'Rollen'

    expect(page).to have_css('#roles .label-columns input:checked', count: 0)
  end
end

