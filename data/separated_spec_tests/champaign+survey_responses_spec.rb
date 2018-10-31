# frozen_string_literal: true

require 'rails_helper'

describe 'api/pages/:id/survey_responses', type: :request do
  let!(:page) { create(:page, :published) }
  let!(:plugins_survey) { create(:plugins_survey, page: page) }
  let!(:form) { create(:form_with_name_email_and_country, formable: plugins_survey) }

  describe 'POST survey_responses' do
    context 'given the form is valid' do
      let(:params) do
        {
          name: 'Bob',
          email: 'b@test.com',
          country: 'AR',
          form_id: form.id
        }
      end

      it 'returns a successful response' 


      it 'creates a new action and sets the form data submitted' 


      context "given a member with the passed email doesn't exist" do
        it 'creates a member and assigns it to the action' 

      end

      context 'given a member with the passed email already exists' do
        let!(:member) { create(:member, email: 'b@test.com') }
        it 'assigns the member to the created action' 

      end
    end

    context 'given the form is invalid' do
      let(:params) do
        {
          country: 'AR',
          form_id: form.id
        }
      end

      it 'returns 422 and an error message' 

    end

    context 'given that the user has previously responded to the same survey' do
      let!(:form_2) do
        create(:form, formable: plugins_survey).tap do |f|
          create :form_element, form: f, name: 'phone', label: 'Phone number', data_type: 'phone', required: true
        end
      end

      let(:form_params) do
        {
          email: 'l@test.com',
          name: 'Lucy',
          country: 'AR',
          form_id: form.id
        }
      end

      let(:form_2_params) do
        {
          phone: '123456',
          form_id: form_2.id
        }
      end

      it 'updates the existing action' 

    end
  end
end

