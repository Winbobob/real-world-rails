require_relative 'spec_helper'

module Aws
  module RDS

    describe AuthTokenGenerator do

      let(:generator) {
        AuthTokenGenerator.new(
          credentials: Credentials.new('akid', 'skid')
        )
      }

      describe 'initialize' do

        it 'requires :credentials parameter' 


      end

      describe 'auth_token' do

        it 'requires region, endpoint, username to create a token' 


        it 'generates a valid token' 


      end

    end

  end
end

