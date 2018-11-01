require 'spec_helper'

describe Gitlab::HookData::IssueBuilder do
  set(:issue) { create(:issue) }
  let(:builder) { described_class.new(issue) }

  describe '#build' do
    let(:data) { builder.build }

    it 'includes safe attribute' 


    it 'includes additional attrs' 


    context 'when the issue has an image in the description' do
      let(:issue_with_description) { create(:issue, description: 'test![Issue_Image](/uploads/abc/Issue_Image.png)') }
      let(:builder) { described_class.new(issue_with_description) }

      it 'sets the image to use an absolute URL' 

    end
  end
end

