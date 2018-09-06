require 'spec_helper'

describe CsvImportHelper do

  include UtilityHelper
  include ERB::Util

  context '#csv_field_documentation' do
    it 'renders string directly' 


    it 'renders hashes as options' 

  end

  context '#csv_import_contact_account_attrs' do
    let(:field_mappings) do
      { "Vorname"=>"first_name",
        "Nachname"=>"last_name",
        "Pfadiname"=>"nickname",
        "Titel"=>"title",
        "Anrede"=>"salutation",
        "Telefonnummer Privat"=>"phone_number_privat",
        "Telefonnummer Vater"=>"phone_number_vater",
        "Weitere E-Mail Privat"=>"additional_email_privat",
        "Social Media Adresse Facebook"=>"social_account_facebook" }
    end

    it 'returns mapping values' 

  end

  context '#csv_import_contact_account_value' do
    let(:person) do
      p = Fabricate(:person)
      p.phone_numbers.create!(label: 'Privat', number: '123')
      p.social_accounts.create!(label: 'Facebook', name: 'foo')
      p.additional_emails.create!(label: 'Privat', email: 'privat@example.com')
      p.additional_emails.create!(label: 'Arbeit', email: 'arbeit@example.com')
      p
    end

    it 'returns email value' 


    it 'returns social account value' 


    it 'returns nil for non existing social account value' 


    it 'returns phone number' 

  end
end

