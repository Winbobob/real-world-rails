require_relative 'spec_helper'

module Aws
  module S3
    class Object
      describe '#presigned_post' do

        let(:object) { Object.new('bucket', 'key', stub_responses: true) }

        it 'creates a presigned post with a key' 


      end
    end
  end
end

