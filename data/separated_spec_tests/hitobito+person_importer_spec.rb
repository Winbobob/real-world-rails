# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'
describe Import::PersonImporter do
  include CsvImportMacros

  let(:group) { groups(:top_group) }
  let(:role_type) { Group::TopGroup::Leader }
  let(:importer) do
    importer = Import::PersonImporter.new(data, group, role_type, can_manage_tags: can_manage_tags)
    importer.user_ability = Ability.new(people(:top_leader))
    importer
  end
  let(:can_manage_tags) { true }

  subject { importer }

  context 'minimal' do
    let(:data) { [{ first_name: 'foo' }] }

    it 'creates person' 


    it 'creates role' 

  end

  context 'creates associations' do
    let(:data) do
      [{ first_name: 'foo',
         social_account_skype: 'foobar',
         phone_number_vater: '0123',
         tags: 'foo' }]
    end

    it 'creates social account' 


    it 'creates phone number' 


    context 'can manage tags' do
      it 'creates tag' 

    end

    context 'cannot manage tags' do
      let(:can_manage_tags) { false }
      it 'does not create tag' 

    end

  end

  context 'records successful and failed imports' do
    let(:data) { [{ first_name: 'foobar', email: 'foo@bar.net' },  { first_name: 'foobar', zip_code: 'asdf', country: 'CH' }] }

    it 'creates only first record' 


    context 'result' do
      before { importer.import }
      its(:new_count)  { should eq 1 }
      its(:failure_count)  { should eq 1 }
    end

    context 'base error' do
      let(:data) { [{}] }
      before { importer.import }
      its('errors.first') { should eq 'Zeile 1: Bitte geben Sie einen Namen ein' }
    end

    context 'zip_code validation' do
      before { importer.import }
      its('errors.first') { should eq 'Zeile 2: PLZ ist nicht gültig' }
    end
  end

  context 'duplicate emails' do
    let(:emails) { ['foo@bar.com', '', nil, 'bar@foo.com', 'foo@bar.com'] }
    let(:data) { emails.map { |email| Fabricate.build(:person, email: email).attributes.select { |attr| attr =~ /name|email/ } } }
    before { importer.import }
    its(:errors) { should have(1).item }
    its('errors.last') { should start_with 'Zeile 5: Haupt-E-Mail ist bereits vergeben' }
  end

  context 'existing tags' do
    let(:attrs) { { first_name: 'Paul', tag_list: ['Responsible:John'] } }
    let(:data) { [{ first_name: 'Paul', tags: 'responsible: john, lang: de' }] }
    let(:person) { @person.reload }
    before do
      @person = Fabricate(:person, attrs)
      importer.import
    end

    it 'parses tags before assigning' 

  end

  context 'doublettes' do
    let(:attrs) { { first_name: 'foobar', email: 'foo@bar.net' } }
    let(:data) { [attrs.merge(email: 'bar@foo.net')] }
    let(:person) { @person.reload }

    before { @person = Fabricate(:person, attrs) }
    subject { person }


    context 'adds role, does not update email' do
      before { importer.import }
      its(:email) { should eq 'foo@bar.net' }
      its('roles.size') { should eq 1 }
      it 'updates double and success count' 

    end

    context 'does not duplicate role' do
      before do
        role = person.roles.new
        role.group = group
        role.type = role_type.sti_name
        role.save!
        importer.import
        person.reload
      end
      its(:email) { should eq 'foo@bar.net' }
      its('roles.size') { should eq 1 }
    end

    context 'marks multiple' do
      before { Fabricate(:person, attrs.merge(email: 'asdf@asdf.net')); importer.import }
      subject { importer }
      its(:errors) { should eq ['Zeile 1: 2 Treffer in Duplikatserkennung.'] }
      it 'does not change person' 

    end

    context 'person loaded multiple times via doublette finder' do
      let(:attrs) { { email: 'foo@bar.net', nickname: '', last_name: '' } }
      let(:data) do [{ email: 'foo@bar.net', nickname: 'nickname', town: 'Bern', social_account_msn: 'msn' },
                     { email: 'foo@bar.net', last_name: 'last_name', town: 'Muri', social_account_skype: 'skype' }] end

      before { importer.import }
      its('roles.size') { should eq 1 }
      its(:nickname) { should eq 'nickname' }
      its(:last_name) { should eq 'last_name' }
      its(:town) { should eq 'Bern' }
      its('social_accounts.size') { should eq 2 }
    end
  end

  context 'with person add requests' do
    let(:role_type) { Group::BottomGroup::Member }

    let(:user) { Fabricate(Group::BottomLayer::Leader.name, group: groups(:bottom_layer_one)).person }
    let(:person) { Fabricate(Group::TopGroup::LocalSecretary.name, group: groups(:top_group)).person }
    let(:group) { groups(:bottom_group_one_one) }

    before do
      importer.user_ability = Ability.new(user)
      groups(:top_layer).update_column(:require_person_add_requests, true)
    end

    context 'records successful and failed imports' do
      let(:data) do
        [{ first_name: 'foobar', email: 'foo@bar.net' },
         { first_name: 'foobar', zip_code: 'asdf', country: 'CH' },
         { first_name: person.first_name, email: person.email, town: 'Wabern' }]
      end

      it 'creates only first record' 


      it 'creates request' 


      it 'creates role if person already visible' 


      it 'does not inform about existing request' 


    end
  end

  context 'list file' do
    let(:parser) { Import::CsvParser.new(File.read(path(:list))) }
    let(:mapping) { headers_mapping(parser) }
    let(:data) { parser.map_data(mapping) }
    let(:imported) { Person.order(:id).last }

    before { parser.parse }

    context 'importer reports errors' do
      before { importer.import }
      subject { importer }

      its(:errors) { should include 'Zeile 1: Firmenname muss ausgefüllt werden' }
      its(:errors) { should include 'Zeile 2: Land ist kein gültiger Wert, Firmenname muss ausgefüllt werden' }
      its(:errors) { should include 'Zeile 4: PLZ ist nicht gültig' }
      its(:errors) { should have(3).items }
    end

    context 'imported person' do
      before { expect { importer.import }.to change { Person.count }.by(1) }
      subject { imported }

      its(:first_name) { should eq 'Ramiro' }
      its(:last_name) { should eq 'Brown' }
      its(:additional_information) { should be_present }
      its(:company) { should eq true }
      its(:company_name) { should eq 'Mrs. Jalon Kling' }
      its(:email) { should eq 'ramiro_brown@example.com' }
      its(:address) { should eq '1649 Georgette Circles' }
      its(:zip_code) { should eq '7202' }
      its(:town) { should be_blank }
      its(:gender) { should eq 'm' }
      its(:additional_information) { should be_present }

      context 'phone numbers' do
        subject { imported.phone_numbers }
        its(:size) { should eq 4 }
        its('first.label') { should eq 'Privat' }
        its('first.number') { should eq '1-637-999-2837 x7851' }

        its('second.label') { should eq 'Mobil' }
        its('second.label') { should eq 'Mobil' }

        its('third.label') { should eq 'Arbeit' }
        its('third.number') { should eq '1-403-4ä9-5561' }

        its('fourth.label') { should eq 'Vater' }
        its('fourth.number') { should eq '908.647.4334' }
      end

      context 'social accounts' do
        subject { imported.social_accounts.order(:label) }
        its(:size) { should eq 3 }
        its('first.label') { should eq 'MSN' }
        its('first.name') { should eq 'reyes_mckenzie' }

        its('second.label') { should eq 'Skype' }
        its('second.name') { should eq 'florida_armstrong' }

        its('third.label') { should eq 'Webseite' }
        its('third.name') { should eq 'colliäs.com' }
      end

      context 'tags' do
        subject { imported.tags }
        its(:size) { should eq 2 }
        its('first.name') { should eq 'foo' }
        its('second.name') { should eq 'bar' }
      end
    end
  end

end

