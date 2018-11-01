require_relative '../spec_helper'
require 'stringio'

module Aws
  module S3
    describe Client do
      describe 'MD5 checksums' do

        it 'has a :compute_checksums option that defaults to true' 


        it 'can disabled' 


        describe '#put_object' do

          it 'computes an MD5 of the body and sends it with content-md5 header' 


          it 'does not compute the MD5 when :compute_checksums is false' 


          it 'skips the md5 when the body is empty' 


          it 'computes the MD5 by reading the body 1MB at a time' 


        end

        describe '#upload_part' do

          it 'computes an MD5 of the body and sends it with content-md5 header' 


          it 'does not compute the MD5 when :compute_checksums is false' 


          it 'skips the md5 when the body is empty' 


          it 'computes the MD5 by reading the body 1MB at a time' 


        end


        {
          'delete_objects' => {bucket:'b',delete:{objects:[]}},
          'put_bucket_cors' => {bucket:'b',cors_configuration:{cors_rules:[]}},
          'put_bucket_lifecycle' => {bucket:'b',lifecycle_configuration:{rules:[]}},
          'put_bucket_policy' => {bucket:'b', policy:'{foo:"bar"}'},
          'put_bucket_tagging' => {bucket:'b',tagging:{tag_set:[]}},
        }.each_pair do |operation_name, params|

          it "computes the required md5 for #{operation_name} when :compute_checksums is false" 


        end

      end
    end
  end
end

