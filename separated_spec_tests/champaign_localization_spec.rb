# frozen_string_literal: true
require 'rails_helper'

describe 'Localization for pages' do
  let(:english_page) { create :page, language: (create :language, code: :en) }
  let(:german_page) { create :page, language: (create :language, code: :de) }
  let(:form) { create :form_with_email_and_name }
  let(:form_params) { { form_id: form.id, email: 'asdf@test.com', name: 'Metiulous Tester' } }

  Champaign::Application.config.i18n.available_locales.each do |locale|
    it "sets localization for a page in #{locale}" 


    it "resets localization back from #{locale} to default if a non-localized page is requested afterwards" 

  end

  it "uses default locale for a page where localization isn't required" 


  it 'uses the correct locale if two localized pages are requested in a row' 


  it 'resets to default locale viewing a back-end page after taking action on another language page' 


  it "validates in the current page's language" 


  it 'mails and shows member auth signup with language of most recent page' 

end

