# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'
require 'csv'

describe Person::CsvImportsController do

  include CsvImportMacros

  let(:group) { groups(:top_group) }
  let(:person) { people(:top_leader) }

  before { sign_in(person) }


  describe 'POST #define_mapping' do

    it 'populates flash, data and columns' 


    it 'redisplays form if failed to parse csv' 


    it 'renders form when submitted without file' 


  end

  describe 'POST preview' do
    let(:data) { File.read(path(:utf8)) }
    let(:role_type) { 'Group::TopGroup::Leader' }
    let(:mapping) { { Vorname: 'first_name', Nachname: 'last_name', Geburtsdatum: 'birthday' } }
    let(:required_params) { { group_id: group.id, data: data, role_type: role_type } }

    it 'informs about newly imported person' 


    it 'renders preview even when field_mapping is missing' 


    it 'informs about duplicates in assignment' 


    it 'rerenders form when role_type is missing' 


    context 'csv data matches multiple people' do
      let(:data) { generate_csv(%w{Vorname Email}, %w{foo foo@bar.net}) }

      it 'reports error if multiple candidates for doublettes are found' 

    end

  end

  describe 'POST #create' do
    let(:data) { File.read(path(:utf8)) }
    let(:role_type) { Group::TopGroup::Leader }
    let(:mapping) { { Vorname: 'first_name', Nachname: 'last_name', Geburtsdatum: 'birthday' } }
    let(:required_params) { { group_id: group.id, data: data, role_type: role_type.sti_name, field_mappings: mapping } }

    it 'fails if role_type is missing' 


    it 'renders define_mapping if button is pressed' 


    it 'populates flash and redirects to group role list' 


    context 'mapping misses attribute' do
      let(:mapping) { { email: :email, role: role_type.sti_name } }
      let(:data) { generate_csv(%w{name email}, %w{foo foo@bar.net}) }

      it 'imports first person and displays errors for second person' 

    end

    context 'trying to update email of user with superior permissions' do
      let(:role_type) { Group::BottomLayer::Member }
      let(:mapping) { { Nachname: 'last_name',
                        Geburtsdatum: 'birthday',
                        Email: 'email'} }

      let(:user) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_one)).person }
      let(:group) { groups(:bottom_layer_one) }

      let(:data) { generate_csv(%w{Nachname Email Geburtsdatum},
                                [person.last_name, "abusive_email@example.com", person.birthday],
                                ['new_user', "new_user@example.com", Time.now]) }

      let(:required_params) { { group_id: group.id,
                                data: data,
                                role_type: role_type.sti_name,
                                field_mappings: mapping,
                                update_behaviour: 'override'} }

      before { sign_in(user) }

      it 'does not update persisted user' 

    end

    context 'invalid phone number value' do
      let(:mapping) { { Vorname: 'first_name', Telefon: 'phone_number_vater', role: role_type.sti_name } }
      let(:data) { generate_csv(%w{Vorname Telefon}, %w{foo }) }

      it 'is ignored' 

    end

    context 'list' do
      let(:data) { File.read(path(:list)) }
      let(:last_person) { Person.last }

      context 'mapping single attribute' do
        let(:mapping) { { first_name: 'first_name' } }

        it 'imports first name of all 4 people' 

      end

      context 'mapping all attributes' do
        let(:mapping) { headers_mapping(CSV.parse(data, headers: true)) }

        it 'imports single person' 

      end


      context 'with add request' do

        let(:role_type) { Group::BottomGroup::Member }
        let(:mapping) { { Vorname: 'first_name', Nachname: 'last_name', Geburtsdatum: 'birthday', Email: 'email', Ort: 'town' } }

        let(:user) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_one)).person }
        let(:person) { Fabricate(Group::TopGroup::LocalSecretary.name, group: groups(:top_group)).person }
        let(:group) { groups(:bottom_group_one_one) }

        let(:data) { generate_csv(%w{Nachname Email Ort}, [person.last_name, person.email, 'Wabern']) }

        before { sign_in(user) }
        before { groups(:top_layer).update_column(:require_person_add_requests, true) }

        it 'creates request' 


        it 'creates role if person already visible' 


        it 'informs about existing request' 

      end
    end

    context 'doublette handling' do
      context 'multiple updates to single person' do
        let(:mapping) { { vorname: :first_name, email: :email, nickname: :nickname } }
        let(:data) { generate_csv(%w{vorname email nickname}, %w{foo foo@bar.net foobar}, %w{bar bar@bar.net barfoo}) }

        before do
          @person = Fabricate(:person, first_name: 'bar', email: 'foo@bar.net', nickname: '')
        end

        it 'last update wins' 

      end

      context 'csv data matches multiple people' do
        let(:mapping) { { vorname: :first_name, email: :email, role: role_type.sti_name } }
        let(:data) { generate_csv(%w{vorname email}, %w{foo foo@bar.net}) }

        it 'reports error if multiple candidates for doublettes are found' 

      end
    end
  end
end

