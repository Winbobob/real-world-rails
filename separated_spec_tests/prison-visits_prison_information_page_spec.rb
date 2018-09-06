require 'poltergeist_helper'

RSpec.feature 'visitor entering prisoner information' do
  include FeaturesHelper

  before(:each) { visit edit_prisoner_details_path }

  describe 'page validations' do
    context 'when a prison is not selected' do
      it 'displays an error message' 

    end

    context 'when prisoner related form fields are left blank' do
      let(:prisoner_element_ids) { %w<first_name last_name date_of_birth_day number> }

      it 'displays error messages for each field' 

    end

    context 'when a prison that is disabled is selected' do
      let(:a_disabled_prison) { 'Rye Hill' }

      it 'displays a message about the prison being disabled' 

    end

    context 'when a prison is coming soon' do
      let(:a_prison_coming_soon) { 'Hull' }

      it 'displays a message about the prison not being available just yet' 

    end

    context 'when a prison has IT issues' do
      let(:a_prison_with_it_issues) { 'Blantyre House' }

      it 'displays a message about the prison not being available just yet' 

    end
  end

  scenario 'a user is taken to the vistor page when information is entered correctly' do
    enter_prisoner_information

    expect(page).to have_content('Visitor 1')
    expect(page.current_path).to eq edit_visitors_details_path
  end
end

