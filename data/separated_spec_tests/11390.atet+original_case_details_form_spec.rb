require 'rails_helper'
module Refunds
  RSpec.describe OriginalCaseDetailsForm, type: :form do
    # These attributes are required because form objects load these values and
    # make decisions on them at initialization stage
    let(:address_attributes) do
      {
        address_changed: true
      }
    end
    let(:refund_attributes) do
      {
        applicant_title: 'mr',
        applicant_first_name: 'Test',
        applicant_last_name: 'User',
        applicant_email_address: 'test.user@emaildomain.com'
      }.merge(address_attributes)
    end
    let(:session_attributes) { Refund.new(refund_attributes).attributes.to_h }
    let(:refund_session) { Session.new session_attributes }

    let(:form) { described_class.new(refund_session) }

    describe 'before validations' do
      context 'without changed address' do
        let(:address_attributes) do
          {
            address_changed: false,
            applicant_address_building: '102',
            applicant_address_street: 'Petty France',
            applicant_address_locality: 'London',
            applicant_address_county: 'Greater London',
            applicant_address_post_code: 'SW12 3HQ'
          }
        end

        it 'transfers the address' 

      end

      context 'with address changed' do
        let(:address_attributes) do
          {
            address_changed: true,
            applicant_address_building: '102',
            applicant_address_street: 'Petty France',
            applicant_address_locality: 'London',
            applicant_address_county: 'Greater London',
            applicant_address_post_code: 'SW12 3HQ'
          }
        end

        it 'does not transfer the address' 

      end

      it 'transfers personal email' 


      it 'transfers name and titleize the title' 

    end

    describe 'validations' do
      context 'et_case_number' do
        it 'allows blank' 


        it 'allows the correct format' 


        it 'does not allow more digits before the slash' 


        it 'does not allow less digits before the slash' 


        it 'does not allow a value without the slash' 


        it 'does not allow less digits after the slash' 


        it 'does not allow more digits after the slash' 


        it 'does not allow anything but digits before the slash' 


        it 'does not allow anything but digits after the slash' 


        it 'does not allow 2 slashes - possible confusion with eat number' 


        it 'does not allow 3 slashes - possible confusion with eat number' 

      end
      context 'eat_case_number' do
        it 'allows blank' 


        it 'allows the correct format' 


        it 'does not allow more digits before the second slash' 


        it 'does not allow less digits before the second slash' 


        it 'does not allow a value without any slashes' 


        it 'does not allow less digits after the second slash' 


        it 'does not allow more digits after the second slash' 


        it 'does not allow less digits after the third slash' 


        it 'does not allow more digits after the third slash' 


        it 'does not allow anything but UKEAT' 


        it 'does not allow anything but digits after the first slash' 


        it 'does not allow anything but digits after the second slash' 


        it 'does not allow anything but digits after the third slash' 


        it 'does not allow number with one slash - possible confusion with et number' 

      end
      context 'address_changed' do
        it 'validates - allowing true value' 


        it 'validates - allowing false value' 


        it 'validates - disallowing nil value' 


        it 'validates - disallowing empty string value' 

      end

      context 'claimant_address_building' do
        it 'validates presence' 

      end

      context 'claimant_address_street' do
        it 'validates presence' 

      end

      context 'claimant_address_post_code' do
        it 'validates presence' 

      end

      context 'claim_had_representative' do
        it 'validates - allowing true value' 


        it 'validates - allowing false value' 


        it 'validates - disallowing nil value' 


        it 'validates - disallowing empty string value' 

      end
    end

    describe 'standard form behavior' do
      attrs = {
        et_country_of_claim: 'england_and_wales',
        claim_had_representative: false,
        address_changed: true,
        claimant_address_building: '1',
        claimant_address_street: 'Street',
        claimant_address_post_code: 'DE21 6QQ',
        respondent_name: 'Mr Resp',
        respondent_address_building: '1',
        respondent_address_street: 'Street'
      }
      it_behaves_like 'a Form', attrs, Session
    end
  end
end

