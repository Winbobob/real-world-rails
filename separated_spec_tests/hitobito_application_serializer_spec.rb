# encoding: utf-8

#  Copyright (c) 2014, CEVI Regionalverband ZH-SH-GL. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe ApplicationSerializer do

  class TestPersonSerializer < ApplicationSerializer
    schema do
      json_api_properties

      map_properties :first_name, :last_name

      apply_extensions(:details)

      # entities with content appearing multiple times
      entity :primary_group, item.primary_group do |group, s|
        s.json_api_properties
        s.property :name, group.name
      end
      # additional property to test unify_linked_entries
      entity :default_group, item.primary_group do |group, s|
        s.json_api_properties
        s.property :name, group.name
      end

      # entity containing only id
      entities :roles, item.roles do |role, s|
        s.json_api_properties
      end

      template_link(:primary_group, 'groups', '/groups/%7Bprimary_group%7D', returning: true)

      modification_properties
    end

    extension(:details) do
      map_properties :town
    end

    extension(:other) do
      map_properties :country
    end

    extension(:details) do
      map_properties :email
    end
  end

  let(:person) do
    p = people(:top_leader)
    p.update!(creator_id: p.id)
    p
  end

  let(:controller) { double().as_null_object }

  let(:serializer) { TestPersonSerializer.new(person, controller: controller)}
  let(:hash) { serializer.to_hash }

  subject { hash[:people].first }

  context 'format' do
    it 'contains plural main key with one entry' 

  end


  context '#extensions' do
    it 'contains all extension properties' 

  end

  context '#json_api_properties' do
    it 'contains id as string' 


    it 'contains plural type' 

  end

  context '#modification_properties' do
    it 'contains created_at and updated_at' 


    it 'contains creator_id and updater_id' 


    it 'contains links for creator and updater' 

  end

  context '#template_link' do
    it 'are added to top level links' 

  end

  context '#unify_linked_entities' do
    context 'with attributes' do
      it 'contains linked entries only once' 


      it 'contains link data' 


      it 'contains only ids in item links' 

    end

    context 'without attributes' do
      it 'contains only ids in item links' 


      it 'does not contain linked entries' 

    end
  end
end

