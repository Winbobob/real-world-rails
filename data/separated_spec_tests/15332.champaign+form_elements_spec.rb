# frozen_string_literal: true
require 'rails_helper'

describe 'form element manipulation' do
  let(:user) { create :user }
  let(:page) { create :page }
  let(:survey) { create :plugins_survey, page: page }

  before :each do
    login_as(user, scope: :user)
  end

  describe 'deleting survey elements' do
    it 'returns an error message instead of deleting the last email' 


    it 'returns 200 when deleting a normal element' 


    describe 'reordering survey forms' do
      let(:desired) { [@form2.id, @form1.id, @form3.id, @form0.id] }

      subject { put "/plugins/surveys/#{survey.id}/sort", params: { form_ids: desired.join(',') } }

      before :each do
        @form0 = survey.forms.first
        @form0.update_attributes(position: 0)
        @form1 = create :form, position: 1, formable: survey
        @form2 = create :form, position: 2, formable: survey
        @form3 = create :form, position: 3, formable: survey
        survey.forms.reload
      end

      it 'can reorder forms based on comma separated IDs' 


      it 'touches the page when the forms are reordered' 

    end
  end

  describe 'creating dropdowns' do
    let(:el_params) do
      {
        data_type: 'dropdown',
        label: "What's your favorite flavor?",
        name: 'favorite_flavor',
        many_choices: '',
        choices: [''],
        default_value: '',
        required: '0'
      }
    end

    subject { post "/forms/#{survey.forms.first.id}/form_elements", params: @params }

    it 'creates the dropdowns properly if sent many strings on separate lines with \r\n' 


    it 'creates the dropdowns properly if sent many json objects on separate lines with \r\n' 


    it 'lets the many_choices value override the choices value' 


    it 'returns 200 if successfully made the element' 


    it 'returns a JSON error if it could not make the element' 

  end
end

