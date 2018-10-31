# encoding: utf-8

#  Copyright (c) 2012-2015, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe 'export import person' do

  let(:group) { groups(:top_group) }
  let(:role_type) { Group::TopGroup::Leader }

  it 'may import what is exported' 


  def export(person)
    Export::Tabular::People::PeopleFull.csv([person])
  end

  def import(csv)
    parser = Import::CsvParser.new(csv)
    parser.parse

    guesser = Import::PersonColumnGuesser.new(parser.headers)
    header_mapping = guesser.mapping.each_with_object({}) do |map, hash|
      hash[map.first] = map.last[:key]
    end

    data = parser.map_data(header_mapping)
    importer = Import::PersonImporter.new(data, group, role_type)
    importer.import
  end

  def expect_attrs_equal(actual, expected, excluded)
    expect(actual.attributes.except(*excluded)).to eq(expected.attributes.except(*excluded))
  end

end

