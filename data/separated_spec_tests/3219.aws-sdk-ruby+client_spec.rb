require_relative 'spec_helper'

module Aws
  module IAM
    describe Client do

      let(:credentials) { Aws::Credentials.new('akid', 'secret') }

      it 'forces the endpoint to iam.amazonaws.com despite region' 


      it 'uses us-east-1 as the signing region' 


      it 'expands the endpoint correctly for gov-cloud' 


      it 'uses the proper sigv4 signing name for gov-cloud' 


    end
  end
end

