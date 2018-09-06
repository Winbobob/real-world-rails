# frozen_string_literal: true
require 'rails_helper'

describe FormValidator do
  shared_examples 'is correctly validated' do
    let(:form) { create :form }

    context 'with required as true' do
      let!(:element) do
        create :form_element, form: form, required: true, label: 'Address', name: 'address1'
      end
      let(:params) { {} }

      it 'is valid with value' 


      it 'is valid with value and string key' 


      context 'is invalid' do
        it 'without value' 


        it 'with nil' 


        it 'with false' 


        it 'with empty string' 


        it 'with paragraph data type and empty string' 

      end
    end

    context 'with checkbox as data_type' do
      let!(:element) { create :form_element, :checkbox, form: form, required: true, name: 'action_box_agrees' }
      let(:params) { {} }

      it 'is valid with value 1' 


      it 'is valid with string value' 


      it 'is invalid when nil' 


      it 'is invalid when not included' 


      it 'is invalid when number 0' 


      it 'is invalid when string 0' 

    end

    context 'with email as data_type' do
      let!(:element) { create :form_element, :email, form: form }
      let(:params) { { email: 'foo@example.com' } }

      context 'is valid' do
        it 'with regular address' 


        it 'with multiple dots' 

      end

      context 'is invalid' do
        it 'with a basic sentence' 


        it 'with missing the TLD' 


        it 'with two @ symbols' 


        it 'with ascii' 


        it 'with a dot just before the @' 


        it 'with dot at start' 


        it 'with a dot just after the @' 


        it 'with a two consecutive dots' 

      end
    end

    context 'with phone as data_type' do
      let!(:element) { create :form_element, :phone, form: form }
      let(:params) { { phone: '00 2323 12345' } }

      context 'is valid' do
        it 'with regular numbers' 


        it 'has spaces, dashes, pluses, and parentheses' 

      end

      context 'is invalid' do
        it 'if too short' 


        it 'with invalid special characters' 

      end
    end

    context 'with country as data_type' do
      let!(:element) { create :form_element, :country, form: form }
      let(:params) { { country: 'FR' } }

      it 'is valid' 


      context 'is invalid' do
        it 'with full country name' 


        it 'with a number' 


        it 'as lowercase' 

      end
    end

    context 'with zip as data type' do
      let!(:element) { create :form_element, :postal, form: form }
      let(:country_element) { create :form_element, :country, form: form }
      let(:us_postal) { '12345' }
      let(:uk_postal) { 'CR0 3RL' }
      let(:params) { { postal: us_postal } }

      context 'is valid' do
        it 'without a country code' 


        it 'with a valid country code in the UK' 

      end

      context 'is invalid' do
        it 'with an incorrect code' 


        it 'with a valid code but incorrect country code' 

      end
    end

    context 'with text as data type' do
      let!(:element) { create :form_element, form: form, required: false, label: 'Address', name: 'address1' }
      let(:params) { { address1: 'b' * 249 } }

      it 'is valid with a 249 character string' 


      it 'is invalid with a 250 character string' 

    end

    context 'with comment as data type' do
      let!(:element) do
        create :form_element, :paragraph, form: form, required: false, label: 'Address', name: 'address1'
      end
      let(:params) { { address1: 'b' * 9_999 } }

      it 'is valid with a 9,999 character string' 


      it 'is valid with a nil when element not required' 


      it 'is valid with an empty string when element not required' 


      it 'is invalid with a 10,000 character string' 

    end
  end

  context 'passing a form id' do
    subject { FormValidator.new(params.merge(form_id: element.form_id)) }

    include_examples 'is correctly validated'
  end

  context 'passing hashes' do
    let(:hash_els) do
      form.form_elements.map do |el|
        { name: el.name, required: el.required?, data_type: el.data_type }
      end
    end

    subject { FormValidator.new(params, hash_els) }

    include_examples 'is correctly validated'
  end
end

