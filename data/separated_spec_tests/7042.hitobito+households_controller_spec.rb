#  Copyright (c) 2012-2018, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::HouseholdsController do

  let(:leader) { people(:top_leader) }
  let(:member)    { people(:bottom_member) }
  let(:top_group) { groups(:top_group) }
  let(:person)    { assigns(:person) }
  let(:household) { assigns(:household) }

  context 'as leader' do
    before { sign_in(leader) }

    it 'adds person to new household' 


    it 'adds person to existing household' 


    it 'adds person from existing household' 


    it 'adds person from existing household to existing household' 


    it 'adds two people from an existing household' 


    it 'adds two people from different existing households' 

  end

  context 'as member with non writable person' do

    before { sign_in(member) }

    it 'adds person to new household' 


    it 'adds person to existing household' 


    it 'adds person from existing household' 


    it 'adds person from existing household to existing household' 


    it 'adds two people from an existing household' 

  end

  private

  def parameters(person: , other: , ids: [])
    { group_id: person.groups.first.id,
      person_id: person.id,
      other_person_id: other.id,
      person: person_attrs(ids) }
  end

  def person_attrs(ids)
    { address: '',
      zip_code: '',
      town: '',
      country: '',
      household_people_ids: ids }
  end

  def create(role, group)
    Fabricate(role.name.to_s, group: group).person
  end

end

