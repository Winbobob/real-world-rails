# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'
describe Import::Person do

  context 'keys' do
    subject { Import::Person.fields.map { |entry| entry[:key] }  }
    it 'contains social media' 


    it 'contains phone number' 


    it 'contains additional email' 

  end

  context 'labels' do
    subject { Import::Person.fields.map { |entry| entry[:value] }  }

    it 'contains social media' 


    it 'contains phone number' 


    it 'contains additional email' 

  end

  context 'extract contact accounts' do
    let(:data) do
      { first_name: 'foo',
        social_account_skype: 'foobar',
        phone_number_vater: '0123',
        additional_email_mutter: 'mutter@example.com' }
    end
    let(:person) { Person.new }
    before { Import::Person.new(person, data.with_indifferent_access).populate }

    subject { person }

    its(:first_name) { should eq 'foo' }
    its('phone_numbers.first') { should be_present }
    its('phone_numbers.first.label') { should eq 'Vater' }
    its('phone_numbers.first.number') { should eq '0123' }

    its('social_accounts.first') { should be_present }
    its('social_accounts.first.label') { should eq 'Skype' }
    its('social_accounts.first.name') { should eq 'foobar' }

    its('additional_emails.first') { should be_present }
    its('additional_emails.first.label') { should eq 'Mutter' }
    its('additional_emails.first.email') { should eq 'mutter@example.com' }
  end

  context 'tags' do
    let(:data) do
      { first_name: 'foo',
        tags: 'de, responsible:jack,foo bar' }
    end

    let(:person) { Fabricate(:person) }
    let(:import_person) do
      Import::Person.new(person, data.with_indifferent_access, can_manage_tags: can_manage_tags)
    end
    before do
      import_person.populate
    end

    subject { person }

    context 'can manage' do
      let (:can_manage_tags) { true }

      its('tag_list') { should eq ['de', 'responsible:jack', 'foo bar'] }
      its('tags.count') { should eq 0 }

      it 'saves the tags' 

    end

    context 'cannot manage' do
      let (:can_manage_tags) { false }

      its('tag_list') { should eq [] }
    end

  end

  context 'with keep behaviour' do

    before do
      Import::Person.new(person, data.with_indifferent_access,
                         override: false, can_manage_tags: true).populate
    end

    subject { person }

    context 'keeps existing attributes' do
      let(:person) do
        Fabricate(:person, email: 'foo@example.com', first_name: 'Peter', last_name: 'Muster')
      end

      let(:data) do
         { first_name: 'foo',
           last_name: '',
           email: 'foo@example.com',
           town: 'Bern',
           birthday: '-' }
      end

      its('first_name') { should eq 'Peter' }
      its('last_name') { should eq 'Muster' }
      its('town') { should eq 'Bern' }
      its('address') { should be_nil }
      its('birthday') { should be_nil }
    end

    context 'keeps existing contact accounts' do
      let(:person) do
        p = Fabricate(:person, email: 'foo@example.com')
        p.phone_numbers.create!(number: '123', label: 'Privat')
        p.phone_numbers.create!(number: '456', label: 'Mobil')
        p.social_accounts.create!(name: 'foo', label: 'Skype')
        p.social_accounts.create!(name: 'foo', label: 'MSN')
        p.additional_emails.create!(email: 'foo@example.com', label: 'Mutter')
        p.additional_emails.create!(email: 'bar@example.com', label: 'Vater')
        p
      end

      let(:data) do
         { first_name: 'foo',
           email: 'foo@example.com',
           social_account_skype: 'foo',
           social_account_msn: 'bar',
           phone_number_mobil: '789',
           additional_email_mutter: 'bar@example.com',
           additional_email_privat: 'privat@example.com' }
      end

      its('phone_numbers.first.label') { should eq 'Privat' }
      its('phone_numbers.first.number') { should eq '123' }
      its('phone_numbers.second.label') { should eq 'Mobil' }
      its('phone_numbers.second.number') { should eq '456' }

      its('social_accounts.first.label') { should eq 'Skype' }
      its('social_accounts.first.name') { should eq 'foo' }
      its('social_accounts.second.label') { should eq 'MSN' }
      its('social_accounts.second.name') { should eq 'foo' }
      its('social_accounts.third.label') { should eq 'Msn' }
      its('social_accounts.third.name') { should eq 'bar' }

      its('additional_emails.first.label') { should eq 'Mutter' }
      its('additional_emails.first.email') { should eq 'foo@example.com' }
      its('additional_emails.second.label') { should eq 'Vater' }
      its('additional_emails.second.email') { should eq 'bar@example.com' }
      its('additional_emails.third.label') { should eq 'Privat' }
      its('additional_emails.third.email') { should eq 'privat@example.com' }
    end

    context 'keeps existing tags' do
      let(:person) do
        p = Fabricate(:person, email: 'foo@example.com')
        p.tag_list.add('foo bar', 'bar')
        p.save!
        p
      end

      context 'nonempty' do
        let(:data) do
          { first_name: 'foo',
            tags: 'de, responsible:jack,foo bar' }
        end

        its('tag_list') { should eq ['foo bar', 'bar', 'de', 'responsible:jack'] }
      end

      context 'empty' do
        let(:data) do
          { first_name: 'foo' }
        end

        its('tag_list') { should eq ['foo bar', 'bar'] }
      end
    end

  end

  context 'with override behaviour' do

    before do
      Import::Person.new(person, data.with_indifferent_access,
                         override: true, can_manage_tags: true).populate
    end

    subject { person }

    context 'overrides existing attributes' do
      let(:person) do
        Fabricate(:person,
                  email: 'foo@example.com',
                  first_name: 'Peter',
                  last_name: 'Muster',
                  address: 'EP 4')
      end

      let(:data) do
         { first_name: 'foo',
           last_name: '',
           email: 'foo@example.com',
           town: 'Bern' }
      end

      its('first_name') { should eq 'foo' }
      its('last_name') { should eq '' }
      its('town') { should eq 'Bern' }
      its('address') { should eq 'EP 4' }
    end

    context 'overrides existing contact accounts' do
      let(:person) do
        p = Fabricate(:person, email: 'foo@example.com')
        p.phone_numbers.create!(number: '123', label: 'Privat')
        p.phone_numbers.create!(number: '456', label: 'Mobil')
        p.social_accounts.create!(name: 'foo', label: 'Skype')
        p.social_accounts.create!(name: 'foo', label: 'MSN')
        p.additional_emails.create!(email: 'foo@example.com', label: 'Mutter')
        p.additional_emails.create!(email: 'bar@example.com', label: 'Vater')
        p
      end

      let(:data) do
         { first_name: 'foo',
           email: 'foo@example.com',
           social_account_skype: 'foo',
           social_account_msn: 'bar',
           phone_number_mobil: '789',
           additional_email_mutter: 'bar@example.com',
           additional_email_privat: 'privat@example.com' }
      end

      its('phone_numbers.first.label') { should eq 'Privat' }
      its('phone_numbers.first.number') { should eq '123' }
      its('phone_numbers.second.label') { should eq 'Mobil' }
      its('phone_numbers.second.number') { should eq '789' }

      its('social_accounts.first.label') { should eq 'Skype' }
      its('social_accounts.first.name') { should eq 'foo' }
      its('social_accounts.second.label') { should eq 'MSN' }
      its('social_accounts.second.name') { should eq 'foo' }
      its('social_accounts.third.label') { should eq 'Msn' }
      its('social_accounts.third.name') { should eq 'bar' }

      its('additional_emails.first.label') { should eq 'Mutter' }
      its('additional_emails.first.email') { should eq 'bar@example.com' }
      its('additional_emails.second.label') { should eq 'Vater' }
      its('additional_emails.second.email') { should eq 'bar@example.com' }
      its('additional_emails.third.label') { should eq 'Privat' }
      its('additional_emails.third.email') { should eq 'privat@example.com' }
    end

    context 'overrides existing tags' do
      let(:person) do
        p = Fabricate(:person, email: 'foo@example.com')
        p.tag_list.add('foo bar', 'bar')
        p.save!
        p
      end

      context 'nonempty' do
        let(:data) do
          { first_name: 'foo',
            tags: 'de, responsible:jack,foo bar' }
        end

        its('tag_list') { should eq ['de', 'responsible:jack', 'foo bar'] }
      end

      context 'empty' do
        let(:data) do
          { first_name: 'foo' }
        end

        its('tag_list') { should eq [] }
      end
    end

  end

  context 'can assign mass assigned attributes' do
    let(:person) { Fabricate(:person) }

    it 'all protected attributes are filtered via blacklist' 

  end

  context 'tracks emails' do
    let(:emails) { ['foo@bar.com', '', nil, 'bar@foo.com', 'foo@bar.com'] }

    let(:import_people) do
      emails_tracker = {}
      emails.map do |email|
        person_attrs = Fabricate.build(:person, email: email).attributes.select { |attr| attr =~ /name|email/ }
        import_person = Import::Person.new(Person.new, person_attrs)
        import_person.populate
        import_person.email_unique?(emails_tracker)
        import_person
      end
    end

    it 'validates uniqueness of emails in currently imported person set' 

  end

end

