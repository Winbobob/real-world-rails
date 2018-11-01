#  Copyright (c) 2012-2018, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::Household do

  let(:leader) { people(:top_leader) }
  let(:member) { people(:bottom_member) }

  let(:user) { Person.first }

  def create(role, group)
    Fabricate(role.name.to_s, group: group).person
  end

  def household(person)
    Person::Household.new(person, Ability.new(person), nil, user)
  end

  context '#assign' do
    def assign_household(person, other)
      Person::Household.new(person, Ability.new(person), other).tap(&:assign)
    end

    it 'adding self resets address' 


    it 'copies address and adds person to people' 


    it 'adds all household people' 


    it 'adds first non writable person' 


    it 'does not add another non writeable person' 


    it 'does add another non writable person if address identical' 


    it 'does add another writable person if address is different' 

  end

  context "#valid?" do
    it 'true if person address is identical to readonly person address' 


    it 'false if person address is not identical to readonly person address' 

  end

  context '#save' do
    it 'persists new household', versioning: true do
      leader.household_people_ids = [member.id]
      expect do
        household(leader).save
      end.to change { member.versions.count }.by(2)

      expect(leader.reload.household_key).to eq member.reload.household_key
      expect(leader.household_key).to be_present
      expect(member.household_key).to be_present
      expect(leader.household_people).to eq [member]
    end

    it 'persists new household with readonly person' 


    it 'adds person to persisted household' 


    it 'combines two existing households' 


    it 'raises if person address attrs differ from readonly person address attrs' 


    it 'raises if two readonly people have different addresses' 


    it 'creates append_to_household version' 


    it 'creates household_update version' 


    it 'does not create household_updated version when addesss and people are unchanged' 


  end

  context '#remove' do
    it 'clears two people household' 


    it 'removes person from 3 people household' 


    it 'creates Papertrail entries at the household deletion' 


    it 'creates Papertrail entries for removal from 3 people household' 



    it 'does not create Papertrail for remove household, if person does not belong to a household' 

  end

end

