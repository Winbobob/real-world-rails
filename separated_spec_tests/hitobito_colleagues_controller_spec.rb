# encoding: utf-8

#  Copyright (c) 2017, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::ColleaguesController do

  let(:top_leader) { people(:top_leader) }

  before { sign_in(top_leader) }

  describe 'GET #index' do
    it 'returns ordered colleagues' 


    it 'contains nobody if persons company_name is blank' 

  end

  def create_person(role, group)
    Fabricate(role.name.to_sym,
              group: groups(group),
              person: Fabricate(:person, company_name: 'Foo Inc.')).person
  end
end

