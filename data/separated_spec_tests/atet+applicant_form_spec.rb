require 'rails_helper'
module Refunds
  RSpec.describe ApplicantForm, type: :form do
    let(:session_attributes) { Refund.new.attributes.to_h }
    let(:refund_session) { Session.new session_attributes }
    let(:applicant_form) { described_class.new(refund_session) }

    describe 'validations' do
      context 'applicant_address_building' do
        it 'validates presence' 


        it 'validates length' 

      end

      context 'applicant_address_street' do
        it 'validates presence' 


        it 'validates length' 

      end

      context 'applicant_address_locality' do
        it 'validates presence' 


        it 'validates the length' 

      end

      context 'applicant_address_county' do
        it 'validates the length' 

      end

      context 'applicant_address_post_code' do
        it 'validates presence' 


        it 'validates length' 

      end

      context 'applicant_address_telephone_number' do
        it 'validates presence' 


        it 'validates length' 

      end

      context 'applicant_title' do
        it 'validates presence' 


        it 'validates inclusion' 

      end

      context 'applicant_first_name' do
        it 'validates length' 

      end

      context 'applicant_last_name' do
        it 'validates length' 

      end

      context 'applicant_email_address' do
        it 'allows blank' 


        it 'validates email - allowing a good email address' 


        it 'validates email - disallowing a bad email address' 


        it 'validates length' 

      end

      context 'applicant_date_of_birth' do
        it 'validates presence' 


        it 'validate date - allowing a good value' 


        it 'validate date - disallowing an invalid date' 


        it 'validates date - disallowing a blank value' 


        it 'validates date - disallowing a nil value' 

      end

      context 'has_name_changed' do
        it 'validates - disallowing nil value' 


        it 'validates - disallowing empty string value' 


        it 'validates - allowing true' 


        it 'validates - allowing false' 

      end

    end

    describe '#applicant_first_name=' do
      it 'strips the string' 

    end

    describe '#applicant_last_name=' do
      it 'strips the string' 

    end

    describe '#applicant_date_of_birth=' do
      # I don't understand this craziness, but this is how it works currently
      # @TODO See if the functionality provided by the 'dates' class method can be done better
      #
      it 'converts to the correct date if a hash with string keys is given' 


      it 'converts to the correct date if an ActionController:Parameters is given with string keys' 


      it 'stores nil if the values of the hash are all not present' 


      it 'stores nil if the values of the ActionController::Parameters are all not present' 


      it 'stores the provided hash if the date is invalid' 


      it 'stores the provided ActionController::Parameters as a hash if the date is invalid' 

    end

    describe 'standard form behavior' do
      attrs = {
        applicant_address_building: '1',
        applicant_address_street: 'Street',
        applicant_address_locality: 'Locality',
        applicant_address_post_code: 'DE21 6QQ',
        applicant_title: 'mr',
        applicant_first_name: 'First',
        applicant_last_name: 'Last',
        applicant_address_telephone_number: '01332 222222',
        applicant_date_of_birth: 18.years.ago,
        has_name_changed: false
      }
      it_behaves_like 'a Form', attrs, Session
    end
  end
end

