
# encoding: utf-8
#  Copyright (c) 2012-2018, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.
#
require 'spec_helper'

describe Export::Tabular::People::HouseholdRow do

  def name(first_names = [], last_names = [])
    person = Person.new(first_name: first_names.join(','),
                        last_name: last_names.join(','))
    Export::Tabular::People::HouseholdRow.new(person).name
  end

  it 'handles nil first and last name' 


  it 'treats blank last name as first present lastname' 


  it 'does not output anything if first and last names are blank' 


  it 'combines two people with same last_name' 


  it 'combines multiple people with same last_name' 


  it 'joins two different names by SEPARATOR' 


  it 'reduces first names to initial if line is too long' 


end

