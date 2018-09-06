require_relative 'spec_helper'

module Aws
  module S3
    class Bucket
      describe '#presigned_post' do

        def bucket(options = {})
          options[:stub_responses] ||= true
          Bucket.new('bucket', options)
        end

        it 'creates a presigned post without a key' 


        it 'applies the :endpoint option' 


      end
    end
  end
end

