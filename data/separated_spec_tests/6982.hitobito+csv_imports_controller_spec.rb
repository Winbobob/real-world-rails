# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'
require 'csv'
describe Person::CsvImportsController, type: :controller do

  include CsvImportMacros

  render_views
  let(:group) { groups(:top_group) }
  let(:person) { people(:top_leader) }
  before { sign_in(person) }
  subject { Capybara::Node::Simple.new(response.body) }


  describe 'GET :new' do
    it 'renders template' 

  end


  describe 'POST :define_mapping' do
    it 'renders template and flash' 

  end

  describe 'POST :create imports single person' do
    let(:data) { File.read(path(:list)) }
    let(:role_type) { Group::TopGroup::Leader }
    let(:mapping) { headers_mapping(CSV.parse(data, headers: true))  }

    it 'imports single person only' 

  end

  describe 'POST :preview renders preview' do
    let(:data) { File.read(path(:list)) }
    let(:role_type) { 'Group::TopGroup::Leader' }
    let(:mapping) { headers_mapping(CSV.parse(data, headers: true)).merge(role: role_type)  }

    it 'imports single person only' 

  end

end

