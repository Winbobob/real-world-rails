require_relative 'spec_helper'

module Aws
  module S3
    describe ObjectSummary do

      let(:object_summary) {
        ObjectSummary.new(
          bucket_name: 'bucket',
          key: 'key',
          stub_responses: true,
        )
      }

      let(:object) { double('object') }

      before(:each) do
        allow(object_summary).to receive(:object).and_return(object)
      end

      it 'delegates #copy_from to #object' 


      it 'delegates #copy_to to #object' 


      it 'delegates #move_to to #object' 


      it 'delegates #presigned_post to #object' 


      it 'delegates #presigned_url to #object' 


      it 'delegates #public_url to #object' 


      it 'delegates #upload_file to #object' 


      it 'delegates #upload_stream to #object' 


      it 'delegates #download_file to #object' 

    end
  end
end

