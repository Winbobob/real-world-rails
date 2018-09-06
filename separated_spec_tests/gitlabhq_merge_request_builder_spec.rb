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

  end
end

