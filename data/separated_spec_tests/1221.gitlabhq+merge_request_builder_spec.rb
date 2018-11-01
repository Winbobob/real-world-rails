require 'spec_helper'

describe Gitlab::HookData::MergeRequestBuilder do
  set(:merge_request) { create(:merge_request) }
  let(:builder) { described_class.new(merge_request) }

  describe '#build' do
    let(:data) { builder.build }

    it 'includes safe attribute' 


    %i[source target].each do |key|
      describe "#{key} key" do
        include_examples 'project hook data', project_key: key do
          let(:project) { merge_request.public_send("#{key}_project") }
        end
      end
    end

    it 'includes additional attrs' 


    context 'when the MR has an image in the description' do
      let(:mr_with_description) { create(:merge_request, description: 'test![MR_Image](/uploads/abc/MR_Image.png)') }
      let(:builder) { described_class.new(mr_with_description) }

      it 'sets the image to use an absolute URL' 

    end
  end
end

