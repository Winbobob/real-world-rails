require_relative 'spec_helper'

module Aws
  module CognitoIdentity
    describe Client do

      let(:client) { Client.new(stub_responses: true, validate_params: false) }

      %w(
        get_credentials_for_identity
        get_id
        get_open_id_token
        unlink_identity
      ).each do |method_name|

        it "does not sign calls to #{method_name}" 


      end
    end
  end
end

