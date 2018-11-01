require_relative 'spec_helper'

module Aws
  module EC2
    describe Client do

      describe 'request ids' do

        it 'populates request ids in the response context' 


      end

      describe 'gov-cloud' do

        it 'expands the endpoint correctly for gov-cloud' 


      end

      describe ':region' do

        it 'should not be an availability zone' 


      end

      describe '#copy_snapshot' do

        it 'requires a source shapshot region' 


        it 'manages :destination_region and :presigned_url' 


      end

      describe '#wait_until' do
        describe ':instance_exists' do

          it 'returns fails when an error is returned' 


        end
      end
    end
  end
end

