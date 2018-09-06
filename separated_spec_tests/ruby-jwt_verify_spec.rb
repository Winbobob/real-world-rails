# frozen_string_literal: true

require 'spec_helper'
require 'jwt/verify'

module JWT
  RSpec.describe Verify do
    let(:base_payload) { { 'user_id' => 'some@user.tld' } }
    let(:options) { { leeway: 0 } }

    context '.verify_aud(payload, options)' do
      let(:scalar_aud) { 'ruby-jwt-aud' }
      let(:array_aud) { %w[ruby-jwt-aud test-aud ruby-ruby-ruby] }
      let(:scalar_payload) { base_payload.merge('aud' => scalar_aud) }
      let(:array_payload) { base_payload.merge('aud' => array_aud) }

      it 'must raise JWT::InvalidAudError when the singular audience does not match' 


      it 'must raise JWT::InvalidAudError when the payload has an array and none match the supplied value' 


      it 'must allow a matching singular audience to pass' 


      it 'must allow an array with any value matching the one in the options' 


      it 'must allow an array with any value matching any value in the options array' 


      it 'must allow a singular audience payload matching any value in the options array' 

    end

    context '.verify_expiration(payload, options)' do
      let(:payload) { base_payload.merge('exp' => (Time.now.to_i - 5)) }

      it 'must raise JWT::ExpiredSignature when the token has expired' 


      it 'must allow some leeway in the expiration when global leeway is configured' 


      it 'must allow some leeway in the expiration when exp_leeway is configured' 


      it 'must be expired if the exp claim equals the current time' 


      context 'when leeway is not specified' do
        let(:options) { {} }

        it 'used a default leeway of 0' 

      end
    end

    context '.verify_iat(payload, options)' do
      let(:iat) { Time.now.to_f }
      let(:payload) { base_payload.merge('iat' => iat) }

      it 'must allow a valid iat' 


      it 'must ignore configured leeway' 


      it 'must properly handle integer times' 


      it 'must raise JWT::InvalidIatError when the iat value is not Numeric' 


      it 'must raise JWT::InvalidIatError when the iat value is in the future' 

    end

    context '.verify_iss(payload, options)' do
      let(:iss) { 'ruby-jwt-gem' }
      let(:payload) { base_payload.merge('iss' => iss) }

      let(:invalid_token) { JWT.encode base_payload, payload[:secret] }

      context 'when iss is a String' do
        it 'must raise JWT::InvalidIssuerError when the configured issuer does not match the payload issuer' 


        it 'must raise JWT::InvalidIssuerError when the payload does not include an issuer' 


        it 'must allow a matching issuer to pass' 

      end
      context 'when iss is an Array' do
        it 'must raise JWT::InvalidIssuerError when no matching issuers in array' 


        it 'must raise JWT::InvalidIssuerError when the payload does not include an issuer' 


        it 'must allow an array with matching issuer to pass' 

      end
    end

    context '.verify_jti(payload, options)' do
      let(:payload) { base_payload.merge('jti' => 'some-random-uuid-or-whatever') }

      it 'must allow any jti when the verfy_jti key in the options is truthy but not a proc' 


      it 'must raise JWT::InvalidJtiError when the jti is missing' 


      it 'must raise JWT::InvalidJtiError when the jti is an empty string' 


      it 'must raise JWT::InvalidJtiError when verify_jti proc returns false' 


      it 'true proc should not raise JWT::InvalidJtiError' 


      it 'it should not throw arguement error with 2 args' 

      it 'should have payload as second param in proc' 

    end

    context '.verify_not_before(payload, options)' do
      let(:payload) { base_payload.merge('nbf' => (Time.now.to_i + 5)) }

      it 'must raise JWT::ImmatureSignature when the nbf in the payload is in the future' 


      it 'must allow some leeway in the token age when global leeway is configured' 


      it 'must allow some leeway in the token age when nbf_leeway is configured' 

    end

    context '.verify_sub(payload, options)' do
      let(:sub) { 'ruby jwt subject' }

      it 'must raise JWT::InvalidSubError when the subjects do not match' 


      it 'must allow a matching sub' 

    end
  end
end

